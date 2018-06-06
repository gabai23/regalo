package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.regalo.dto.ProductSearchDTO;
import com.internousdev.regalo.util.DBConnector;

public class ProductSearchDAO {

	private ArrayList<ProductSearchDTO> searchList = new ArrayList<ProductSearchDTO>();

	//☆★全ての商品を表示★☆

	public ArrayList<ProductSearchDTO> AllProductInfo(int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info) FROM product_info LIMIT ?,? ";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info)"));
				dto.setHow_product_search("AllProductInfo");

				searchList.add(dto);

			}
			System.out.println("全件件数"+(searchList.get(0)).getProduct_type_count());

		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return searchList;
	}


	//☆★複数検索カテゴリーなし★☆

	public ArrayList<ProductSearchDTO> ByProductId(String sq, int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *, (SELECT COUNT(*) FROM product_info WHERE " + sq + ") FROM product_info WHERE "  + sq  + "LIMIT ?,?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE "+ sq +")"));
				dto.setHow_product_search("ByProductId");
				searchList.add(dto);

			}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}



	//☆★商品IDとカテゴリーIDで検索★☆

	public ArrayList<ProductSearchDTO> ByProductIdAndCategory(String sq,int category_id, int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE "+ sq + "AND category_id = ?)FROM product_info WHERE " + sq + "AND category_id = ? LIMIT ?,?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, category_id);
			ps.setInt(2, category_id);
			ps.setInt(3, pages);
			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE " + sq + "AND category_id = " + category_id + ")"));
				dto.setHow_product_search("ByProductIdAndCategory");
				searchList.add(dto);

			}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}




	//☆★検索ワードのみで検索★☆
	public ArrayList<ProductSearchDTO> BySearchWord(String search_word,int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con  =db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE product_name LIKE \'%" + search_word +"%\' OR product_name_kana LIKE \'%"+ search_word + "%\') FROM product_info WHERE  product_name LIKE \'%"+ search_word +"%\' OR product_name_kana LIKE \'%"+ search_word +"%\' LIMIT ?,?";

		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE product_name LIKE '%" + search_word +"%' OR product_name_kana LIKE '%"+ search_word +"%')"));
				dto.setHow_product_search("BySearchWord");
				searchList.add(dto);

			}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}


	//☆★カテゴリのみで検索★☆
	public ArrayList<ProductSearchDTO> ByProductCategory(int category_id, int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE category_id = ?) FROM prduct_info WHERE category_id = ? LIMIT ?, ?";

		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setInt(1, category_id);
			ps.setInt(2, category_id);
			ps.setInt(3, pages);
			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE  category_id = " + category_id + ")"));
				dto.setHow_product_search("ByProductCategory");
				searchList.add(dto);

			}
			System.out.println("カテゴリー検索件数"+(searchList.get(0)).getProduct_type_count());
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}

	//☆★カテゴリあり、検索値あり★☆
	public ArrayList<ProductSearchDTO> ByCategoryAndSearchWord(String search_word, int category_id, int pages, int max_product_display){

		DBConnector db =new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE product_name LIKE \'%"+ search_word +"%\' AND category_id = ?) FROM product_info WHERE product_name LIKE \'%"+ search_word + "%\' AND category_id = ? LIMIT ?,?";


	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, category_id);
		ps.setInt(2, category_id);
		ps.setInt(3, pages);
		ps.setInt(4, max_product_display);
		ResultSet rs = ps.executeQuery();

		while(rs.next()){
			ProductSearchDTO dto = new ProductSearchDTO();

			dto.setProduct_id(rs.getInt("product_id"));
			dto.setProduct_name(rs.getString("product_name"));
			dto.setProduct_name_kana(rs.getString("product_name_kana"));
			dto.setProduct_description(rs.getString("product_description"));
			dto.setCategory_id(rs.getInt("category_id"));
			dto.setProduct_price(rs.getInt("product_price"));
			dto.setImage_file_name(rs.getString("image_file_name"));

			dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE  product_name LIKE '%" + search_word +"%' AND category_id =" + category_id +")"));
			dto.setHow_product_search("ByCategoryAndSearchWord");
			searchList.add(dto);

		}

}catch(SQLException e){
	e.printStackTrace();
}catch(Exception e){
	e.printStackTrace();
}
	return searchList;
}


	//☆★ひらがな、カタカナ検索★☆
	public ArrayList<ProductSearchDTO> BySearchWordKana(String search_word, int pages, int max_product_display){

		DBConnector db =new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE product_name_kana LIKE \'%" + search_word +"%\') FROM product_info WHERE product_name_kana LIKE \'%"+ search_word +"%\' LIMIT ?,?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();


			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT (*) FROM product_info WHERE product_name_kana LIKE '%" + search_word + "%')"));
				dto.setHow_product_search("BySearchWordKana");
				searchList.add(dto);

			}

	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}



	//☆★カテゴリーとかなで検索★☆
	public ArrayList<ProductSearchDTO> ByCategoryAndSearchWordKana(int category_id, String search_word, int pages, int max_product_display){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE product_name_kana LIKE \'%" + search_word + "%\' AND category_id =?) FROM product_info WHERE product_name_kana LIKE \'%" + search_word + "%\' AND category_id = ? LIMIT ?, ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, category_id);
			ps.setInt(2, category_id);
			ps.setInt(3, pages);
			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductSearchDTO dto = new ProductSearchDTO();

				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_name_kana(rs.getString("product_name_kana"));
				dto.setProduct_description(rs.getString("product_description"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setImage_file_name(rs.getString("image_file_name"));

				dto.setProduct_type_count(rs.getInt("(SELECT COUNT (*) FROM product_info WHERE product_name_kana LIKE '%" + search_word + "%' AND category_id="+ category_id +")"));
				dto.setHow_product_search("ByCategoryAndSearchWordKana");
				searchList.add(dto);

			}

	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}









}








