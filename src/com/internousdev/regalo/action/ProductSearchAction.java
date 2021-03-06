package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com. internousdev.regalo.dao.ProductSearchDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.internousdev.regalo.util.ToHiragana;
import com.opensymphony.xwork2.ActionSupport;

public class ProductSearchAction extends ActionSupport implements SessionAware {


	private String searchWord;

	private String keyword;

	private int categoryId;

	private ProductSearchDAO productSearchDAO = new ProductSearchDAO();

	private List<ProductInfoDTO> productInfoList = new ArrayList<ProductInfoDTO>();

	private ToHiragana toHiragana =new ToHiragana();

	private String[] searchWords;

	private Map<String,Object> session;

	private ArrayList<String> messageList = new ArrayList<String>();

	private ArrayList<String> errorMessageList = new ArrayList<String>();

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

			List<ProductInfoDTO> notUniqueBuyProductDTOList = new ArrayList<ProductInfoDTO>();

		String[] searchWords = keyword.replace("|","piyopiyo").replace("_", "|_").replace("　", " ").replace("~","～").replace("%", "|%").split("[\\s]+");

			//検索ワードを作って重複ありのリストを作成
			for(String str : searchWords){

			notUniqueBuyProductDTOList = productSearchDAO.BySearchWord(str);

			}

			//重複ありのIDリストを作成
			List<Integer> idList = new ArrayList<Integer>();

			for(int i=0; i< notUniqueBuyProductDTOList.size(); i++){

				int id= notUniqueBuyProductDTOList.get(i).getProductId();
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
			productInfoList = productSearchDAO.ByProductId(sq
//					, pages, maxProductDisplay
					);

			System.out.println("複数検索カテゴリーなし");
			System.out.println(keyword);

			session.put("keyword", keyword);
			messageList.add("で検索");

			ret = SUCCESS;

		}
//		else if(productInfoList.size()<=0){
//
//					messageList.add("検索結果がありません");





			/*
			 * 複数検索カテゴリーあり
			 */

		 else if(categoryId >=1 && space > 0){

			List<ProductInfoDTO> notUniqueBuyProductDTOList = new ArrayList<ProductInfoDTO>();

			String[] searchWords = keyword.replace("|","piyopiyo").replace("_", "|_").replace("　", " ").replace("~","～").replace("%", "|%").split("[\\s]+");

			//検索ワードを作って重複ありのリストを作成
			for(String str : searchWords){

				notUniqueBuyProductDTOList = productSearchDAO.BySearchWord(str
//						,page, maxProductDisplay
						);
			}


			//重複ありのIDリストを作成
			List<Integer> idList = new ArrayList<Integer>();

			for(int i =0; i< notUniqueBuyProductDTOList.size(); i++){

				int id  =notUniqueBuyProductDTOList.get(i).getProductId();
				idList.add(id);
			}

			//jspで引っ張られてしまうので削除
			notUniqueBuyProductDTOList.clear();

			//重複なしのリストを作成
			List<Integer> uniqueIdList = new ArrayList<Integer>(new HashSet<>(idList));
			session.put("uniqueIdList", uniqueIdList);

			//SQL文作成
			StringBuilder sb = new StringBuilder();
			for(int i = 0; i< uniqueIdList.size(); i++){

				int uniqueId = uniqueIdList.get(i);

				String s;
				if(i == (uniqueIdList.size() - 1)){
					s = "product_id = " + uniqueId + " ";
				}else{
					s = "product_id = " + uniqueId + " or ";
				}
				sb.append(s);
			}

			String sq = sb.toString();
			session.put("sq", sq);

			//検索開始
			productInfoList = productSearchDAO.ByProductId(sq
//					,pages ,maxProductDisplay
					);

			System.out.println("複数検索カテゴリーあり");
			System.out.println(keyword);

			session.put("keyword", keyword);
			messageList.add("で検索");

			ret = SUCCESS;

			/*
			 * 全件検索、カテゴリ、検索値なし
			 */

		}else if(categoryId == 1 && keyword.isEmpty()){

			System.out.println("全件検索、カテゴリ、検索値なし");
			System.out.println(keyword);

			//全件をListに格納
			setProductInfoList(productSearchDAO.AllProductInfo(
//					pages, max_product_display
					));



			ret = SUCCESS;

		}

		/*
		 * カテゴリあり、検索値なし
		 */
		else if(categoryId > 1 && keyword.isEmpty()){

			setProductInfoList(productSearchDAO.ByProductCategory(categoryId
//					,pages,maxProductDisplay
					));

			System.out.println("カテゴリあり、検索値なし");
			System.out.println(keyword);

			ret  = SUCCESS;
		}

		/*
		 * カテゴリなし、検索値あり
		 */
		else if(categoryId == 1 && !(keyword.isEmpty())){

			setProductInfoList(productSearchDAO.BySearchWord(keyword
//					, pages, max_product_display
					));

			System.out.println("カテゴリなし、検索値あり");
			System.out.println(keyword);

			session.put("keyword", keyword);
			messageList.add("で検索");

			ret = SUCCESS;

		}

		/*
		 * カテゴリあり、検索値あり
		 */
	else if(categoryId != 1 && !(keyword.isEmpty())){

		System.out.println("カテゴリあり、検索値あり");
		System.out.println(keyword);

		setProductInfoList(productSearchDAO.ByCategoryAndSearchWord(keyword,categoryId
//				,pages,maxProductDisplay
						));

		session.put("keyword", keyword);
		messageList.add("で検索");



		ret = SUCCESS;
	}






		/*
		 * ひらがな、カタカナ検索
		 */
		else if(categoryId == 1 && (keyword.matches("^[\\u3040-\\u30FF]+$") || keyword.matches("^[||u30A0-\\u30FF]+$"))){

			keyword = toHiragana.toZenkakuHiragana(keyword);

			setProductInfoList(productSearchDAO.BySearchWordKana(keyword
//					,pages,maxProductDisplay
					));

			System.out.println("productInfoList:"+productInfoList.size());

			System.out.println("ひらがな、カタカナ検索");

			System.out.println(keyword);

			session.put("keyword", keyword);
			messageList.add("で検索");

			ret = SUCCESS;

		}else if(categoryId > 1 && (keyword.matches("^[\\3040-\\u30FF]+$") || keyword.matches("^[||u30A0-\\u30FF]+$"))){

			keyword = toHiragana.toZenkakuHiragana(keyword);

			setProductInfoList(productSearchDAO.ByCategoryAndSearchWordKana(categoryId, keyword
//					, pages, maxItemDisplay
					));

			System.out.println("カテゴリーあり、ひらがな、カタカナ検索");
			System.out.println(keyword);

			session.put("keyword", keyword);
			messageList.add("で検索");

			ret = SUCCESS;

		}




		else{



			ret = ERROR;


			return ret;
		}











//		//--------------------------ページング決定----------------------------//
//				//商品種類数
//				ProductCount = (productInfoList.get(0)).getProductTypeCount();
//				/*itemCount = (itemSearchDTOList.size());*/
//
//				//最大ページ数
//				int maxPages = productCount / maxProductDisplay;
//
//				//itemCountがdisplayCountの倍数より多いときは1足す
//				if(productCount % maxProductDisplay != 0) {
//					maxPages += 1;
//				}
//
//				//総ページ数をリストに格納
//				ArrayList<Integer> pageList = new ArrayList<Integer>();
//
//				for(int i = 1; i <= maxPages; i++){
//					pageList.add(i);
//				}
//
//				System.out.println("itemCount"+ProductCount);
//				System.out.println("maxPages"+maxPages);
//				System.out.println("pageList.size"+pageList.size());
//
//				session.put("searchResultPageList", pageList);
//
//			//-------------------------ページングここまで---------------------------//
//

		//商品種類数
//		productCount = (productInfoList.get(0).getProduct_type_count();
		/*productCount = (productInfoList.size());*/

		//最大ページ数
//		int maxPages = productCount / maxProductDisplay;

		//productCountがdisplaycountの倍数より多いときは1を足す
//		if(productCount % maxProductDisplay !=0){
//			maxPages +=1;
//		}

		//総ページ数をリストに格納
//		ArrayList<Integer> pageList=new ArrayList<Integer>();
//
//		for(int i = 1; i <= maxPages; i++){
//			pageList.add(i);
//		}
//
//		System.out.println("productCount"+productCount);
//		System.out.println("maxPages"+maxPages);
//		System.out.println("pageList.size"+pageList.size());
//
//		session.put("searchResultPageList", pageList);
//
		//-----------------------ページングここまで------------------------------------//

		keyword = getSearchWord();
		/*session.put("keyword", keyword);
		messageList.add("で検索");*/

		session.put("productInfoList", productInfoList);


		System.out.println("productInfoList:"+productInfoList.size());

		if(productInfoList.size()<=0){

			errorMessageList.add("検索結果がありません");

			System.out.println(messageList.size());

			ret = SUCCESS;


		}

		return ret;


	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public ProductSearchDAO getProductSearchDAO() {
		return productSearchDAO;
	}

	public void setProductSearchDAO(ProductSearchDAO productSearchDAO) {
		this.productSearchDAO = productSearchDAO;
	}

	public List<ProductInfoDTO> getProductInfoList() {
		return productInfoList;
	}

	public void setProductInfoList(List<ProductInfoDTO> productInfoList) {
		this.productInfoList = productInfoList;
	}

	public ToHiragana getToHiragana() {
		return toHiragana;
	}

	public void setToHiragana(ToHiragana toHiragana) {
		this.toHiragana = toHiragana;
	}

	public String[] getSearchWords() {
		return searchWords;
	}

	public void setSearchWords(String[] searchWords) {
		this.searchWords = searchWords;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<String> getMessageList() {
		return messageList;
	}

	public void setMessageList(ArrayList<String> messageList) {
		this.messageList = messageList;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public ArrayList<String> getErrorMessageList() {
		return errorMessageList;
	}

	public void setErrorMessageList(ArrayList<String> errorMessageList) {
		this.errorMessageList = errorMessageList;
	}









}


