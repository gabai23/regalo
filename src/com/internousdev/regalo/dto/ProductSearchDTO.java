package com.internousdev.regalo.dto;

public class ProductSearchDTO {

	//ID
	private int id;

	//商品ID
	private int product_id;

	//商品名

	private String product_name;

	//商品名かな
	private String product_name_kana;

	//商品詳細
	private String product_description;

	//カテゴリーID
	private int category_id;

	//商品価格
	private int product_price;

	//購入数
	private int product_count;

	//画像ファイル
	private String  image_file_name;

	//合計金額
	private int total_price;

	//支払い方法
	private String pay;

	//在庫
	private int product_stock;

	//購入後の在庫数
	private int total_count;

	//検索結果の商品種類数
	private int product_type_count;

	//検索方法
	private String how_product_search;







	//セッターゲッター

	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}

	public int getProduct_id(){
		return product_id;
	}
	public void setProduct_id(int product_id){
		this.product_id=product_id;
	}

	public String getProduct_name(){
		return product_name;
	}
	public void setProduct_name(String product_name){
		this.product_name=product_name;
	}

	public String getProduct_name_kana(){
		return product_name_kana;
	}
	public void setProduct_name_kana(String product_name_kana){
		this.product_name_kana=product_name_kana;
	}

	public String getProduct_description(){
		return product_description;
	}
	public void setProduct_description(String product_description){
		this.product_description=product_description;
	}

	public int getCategory_id(){
		return category_id;
	}
	public void setCategory_id(int category_id){
		this.category_id=category_id;
	}

	public int getProduct_price(){
		return product_price;
	}
	public void setProduct_price(int product_price){
		this.product_price=product_price;
	}

	public int getProduct_count(){
		return product_count;
	}
	public void setProduct_count(int product_count){
		this.product_count=product_count;
	}

	public String getImage_file_name(){
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name){
		this.image_file_name=image_file_name;
	}

	public int getTotal_price(){
		return total_price;
	}
	public void setTotal_price(int total_price){
		this.total_price=total_price;
	}

	public  String getPay(){
		return pay;
	}
	public void setPay(String pay){
		this.pay=pay;
	}

	public int getProduct_stock(){
		return product_stock;
	}
	public void setProduct_stock(int product_stock){
		this.product_stock=product_stock;
	}

	public int getTotal_count(){
		return total_count;
	}
	public void setTotal_count(int total_count){
		this.total_count=total_count;
	}

	public int getProduct_type_count(){
		return product_type_count;
	}
	public void setProduct_type_count(int product_type_count){
		this.product_type_count=product_type_count;
	}

	public String getHow_product_search(){
		return how_product_search;
	}
	public void setHow_product_search(String how_product_search){
		this.how_product_search=how_product_search;
	}







}
