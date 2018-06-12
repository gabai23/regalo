package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductDeleteDAO;
import com.internousdev.regalo.dao.ProductInfoDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;


public class DeleteOrUpdateAction extends ActionSupport implements SessionAware {

	public Map<String, Object> session;
	private String productId;
	private String deleteFlg;
	private String changeFlg;
	private String dMessage;
	private ArrayList<ProductInfoDTO> productInfoDTOList;




	public String execute() throws SQLException {

		String result = ERROR;


	//		削除
		if (deleteFlg != null) {
			System.out.println("削除");
			result = this.delete(productId);
			ProductInfoDAO dao = new ProductInfoDAO();
			productInfoDTOList = (ArrayList<ProductInfoDTO>) dao.getProductInfo();
			System.out.println(productInfoDTOList.size());
		}

	//	商品情報変更
		if (changeFlg != null) {
			System.out.println(changeFlg);
			result = this.update(productId);
		}




		return result;
	}



//	商品削除
	private String delete(String product_id) throws SQLException {

		String result = SUCCESS;

		System.out.println(product_id+"aaaa");

		int count = 0;

		ProductDeleteDAO dao = new ProductDeleteDAO();

		count += dao.productDelete(Integer.parseInt(product_id));

		if (count > 0) {
			this.dMessage = "削除できました。";
//			return SUCCESS;
		}
		return result;
	}


//	商品情報変更
	private String update(String product_id) throws NumberFormatException, SQLException {

		System.out.println(product_id);

		System.out.println("チェック→" + product_id);


		return "masterChange";

	}



	public String getProductId() {
		return productId;
	}



	public void setProductId(String productId) {
		this.productId = productId;
	}



	public String getDeleteFlg() {
		return deleteFlg;
	}



	public void setDeleteFlg(String deleteFlg) {
		this.deleteFlg = deleteFlg;
	}



	public String getChangeFlg() {
		return changeFlg;
	}



	public void setChangeFlg(String changeFlg) {
		this.changeFlg = changeFlg;
	}



	public String getdMessage() {
		return dMessage;
	}



	public void setdMessage(String dMessage) {
		this.dMessage = dMessage;
	}



	public Map<String, Object> getSession() {
		return session;
	}


	public ArrayList<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}


	public void setProductInfoDTOList(ArrayList<ProductInfoDTO> productInfoDTOList) {
		this.productInfoDTOList = productInfoDTOList;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}







}
