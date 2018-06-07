package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com. internousdev.regalo.dao.ProductSearchDAO;
import com.internousdev.regalo.dto.ProductSearchDTO;
import com.internousdev.regalo.util.ToHiragana;
import com.opensymphony.xwork2.ActionSupport;

public class ProductSearchAction extends ActionSupport implements SessionAware {


	private String searchWord;

	private String keyword;

	private int categoryId;

	private ProductSearchDAO productSearchDAO = new ProductSearchDAO();

	private List<ProductSearchDTO> productSearchDTOList = new ArrayList<ProductSearchDTO>();

	private ToHiragana toHiragana =new ToHiragana();

	private String[] searchWords;

	private Map<String,Object> session;

	private ArrayList<String> messageList = new ArrayList<String>();

	//ソート
	//商品種類数
	private int productCount;
//	ページ番号777777777777777777777777777777777777.jspから取得
//	private int page =1;
//
//	private int pages = page -1;
//
//	private int startProductId = 1;
//
//	private int maxProductDisplay =8;

	public String execute() throws SQLException {

		String ret =ERROR;
		session.put("categoryId",categoryId);
//		System.out.println("page:"+page);

		if (searchWord.length() > 16){

			messageList.add("16文字以内で検索してください");
			ret=SUCCESS;
			return ret;

		}else{

			messageList.add(searchWord);
			session.put("messageList",messageList);

		}

		//検索値を全て全角に変換し、適切な値に加工
		keyword =Normalizer.normalize(searchWord, Normalizer.Form.NFKC);

		keyword =toHiragana.toZenkakuHiragana(keyword);

		keyword =keyword.trim();


		if(keyword.matches("^[\\p{Punct}]+$")){

			messageList.add("一般的な検索ワードを使ってください");

			ret = SUCCESS;
			return ret;
		}

		/*
		 * 複数検索カテゴリーなし
		 */
		//空白の場所を確認
		int space = keyword.indexOf(" ");

		if(categoryId == 1 && space > 0){

			List<ProductSearchDTO> notUniqueBuyProductDTOList = new ArrayList<ProductSearchDTO>();

			String[] searchWords = keyword.replace("|","piyopiyo").replace("_", "|_").replace("　", " ").replace("~","～").replace("%", "|%").split("[\\s]+");

			//検索ワードを作って重複ありのリストを作成
//			for(String str : searchWords){
//
//				notUniqueBuyProductDTOList = productSearchDAO.BySearchWord(str
//						,pages, maxProductDisplay
//						);
//
//			}

			//重複ありのIDリストを作成
			List<Integer> idList = new ArrayList<Integer>();

			for(int i=0; i< notUniqueBuyProductDTOList.size(); i++){

				int id= notUniqueBuyProductDTOList.get(i).getProduct_id();
				idList.add(id);
			}

			//jspで引っ張られるので削除
			notUniqueBuyProductDTOList.clear();

			//重複なしのリストを作成
			List<Integer> uniqueIdList = new ArrayList<Integer>(new HashSet<>(idList));
			session.put("uniqueIdList", uniqueIdList);

			//SQL文作成
			StringBuilder sb = new StringBuilder();
			for(int i =0; i< uniqueIdList.size(); i++){

				int uniqueId = uniqueIdList.get(i);

				String s;
				if(i ==(uniqueIdList.size() - 1)){
					s = "product_id= " + uniqueId + " ";
				}else{
					s = "product_id = " + uniqueId + " or ";
				}

				sb.append(s);
			}

			String sq =sb.toString();
			session.put("sq", sq);

			//検索開始
//			productSearchDTOList = productSearchDAO.ByProductId(sq, pages, maxProductDisplay);
//
//			System.out.println("複数検索カテゴリーなし");
//			System.out.println(keyword);
//
//			ret = SUCCESS;



			/*
			 * 複数検索カテゴリーあり
			 */
		}else if(categoryId >=1 && space > 0){

			List<ProductSearchDTO> notUniqueBuyProductDTOList = new ArrayList<ProductSearchDTO>();

			String[] searchWords = keyword.replace("|","piyopiyo").replace("_", "|_").replace("　", " ").replace("~","～").replace("%", "|%").split("[\\s]+");

			//検索ワードを作って重複ありのリストを作成
//			for(String str : searchWords){
//
//				notUniqueBuyProductDTOList = productSearchDAO.BySearchWord(str,page, maxProductDisplay);
//			}


			//重複ありのIDリストを作成
			List<Integer> idList = new ArrayList<Integer>();

			for(int i =0; i< notUniqueBuyProductDTOList.size(); i++){

				int id  =notUniqueBuyProductDTOList.get(i).getProduct_id();
				idList.add(id);
			}

			//jspで引っ張られてしまうので削除
			notUniqueBuyProductDTOList.clear();

			//重複なしのリストを作成
			List<Integer> uniqueIdList = new ArrayList<Integer>(new HashSet(idList));
			session.put("uniqueIdList, uniqueIdList);


		}
	}








}


