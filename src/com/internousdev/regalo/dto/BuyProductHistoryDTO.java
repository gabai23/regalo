package com.internousdev.regalo.dto;

public class BuyProductHistoryDTO {


//	ID
	private int id;

//	ゆーざーID
	private int userId;

//	商品ID
	private int productId;

//	個数
	private int productCount;

//	金額
	private int price;

//	宛先情報ID
	private int destinationId;

//	登録日
	private String registDate;

//	更新日
	private String update;

//	会社情報
	private String releaseCompany;

	private String imageFileName;

	private String productName;

//	ゲッターセッター
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductCount() {
		return productCount;
	}
	public void setProductConut(int productCount) {
		this.productCount = productCount;
	}

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public int getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}

	public String getReleaseCompany() {
		return releaseCompany;
	}
	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}

	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

}
