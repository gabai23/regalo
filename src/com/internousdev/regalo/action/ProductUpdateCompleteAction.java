package com.internousdev.regalo.action;


import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductUpdateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductUpdateCompleteAction extends ActionSupport implements SessionAware{





	public Map<String, Object> session;
	private ProductUpdateCompleteDAO ProductUpdateCompleteDAO = new ProductUpdateCompleteDAO();


	//商品ID
	private int productId;

	//商品名
	private String productName;

	//商品名かな
	private String productNameKana;

	//商品詳細
	private String productDescription;

	//カテゴリID
	private int categoryId;

	//価格
	private int price;

	//画像ファイルパス
	private String imageFilePath;

	//画像ファイル名
	private String newImageFileName;

	//販売年月
	private Date releaseDate;

	//販売会社
	private String releaseCompany;

	//ステータス
	private int status;

	//登録日
	private Date registDate;

	//更新日
	private Date updateDate;



	public String execute() throws SQLException, ParseException {

		String result = SUCCESS;

		int count;

		count = ProductUpdateCompleteDAO.buyProductInfo(

				Integer.parseInt(session.get("productId").toString()),
				session.get("productName").toString(),
				session.get("productNameKana").toString(),
				session.get("productDescription").toString(),
				Integer.parseInt(session.get("categoryId").toString()),
				Integer.parseInt(session.get("price").toString()),
				session.get("imageFilePath").toString(),
				session.get("imageFileName").toString()

				);

		if(count == 0) {
			result = ERROR;
		}

		return result;
	}



	public Map<String, Object> getSession() {
		return session;
	}



	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



	public ProductUpdateCompleteDAO getProductUpdateCompleteDAO() {
		return ProductUpdateCompleteDAO;
	}



	public void setProductUpdateCompleteDAO(ProductUpdateCompleteDAO productUpdateCompleteDAO) {
		ProductUpdateCompleteDAO = productUpdateCompleteDAO;
	}



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductNameKana() {
		return productNameKana;
	}



	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}



	public String getProductDescription() {
		return productDescription;
	}



	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}



	public int getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getImageFilePath() {
		return imageFilePath;
	}



	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}



//	public String getImageFileName() {
//		return imageFileName;
//	}
//
//
//
//	public void setImageFileName(String imageFileName) {
//		this.imageFileName = imageFileName;
//	}
//


	public String getNewImageFileName() {
	    return newImageFileName;
	}




	public void setNewImageFileName(String newImageFileName) {
	    this.newImageFileName = newImageFileName;
	}



	public Date getReleaseDate() {
		return releaseDate;
	}



	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}



	public String getReleaseCompany() {
		return releaseCompany;
	}



	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public Date getRegistDate() {
		return registDate;
	}



	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}







}



