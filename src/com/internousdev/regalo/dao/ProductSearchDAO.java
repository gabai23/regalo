package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.regalo.dto.ProductInfoDTO;
import com.internousdev.regalo.util.DBConnector;

public class ProductSearchDAO {

	private ArrayList<ProductInfoDTO> searchList = new ArrayList<ProductInfoDTO>();

	//☆★全ての商品を表示★☆

	public ArrayList<ProductInfoDTO> AllProductInfo(
//			int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setInt(1, pages);
//			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info)"));*/
				dto.setHowProductSearch("AllProductInfo");

				searchList.add(dto);

			}

		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return searchList;
	}


	//☆★複数検索カテゴリーなし★☆

	public ArrayList<ProductInfoDTO> ByProductId(String sq
//			, int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE "  + sq;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setInt(1, pages);
//			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE "+ sq +")"));*/
				dto.setHowProductSearch("ByProductId");
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

	public ArrayList<ProductInfoDTO> ByProductIdAndCategory(String sq,int category_id
//			, int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE " + sq + "AND category_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, category_id);
			/*ps.setInt(2, category_id);*/
//			ps.setInt(3, pages);
//			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE " + sq + "AND category_id = " + category_id + ")"));*/
				dto.setHowProductSearch("ByProductIdAndCategory");
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
	public ArrayList<ProductInfoDTO> BySearchWord(String search_word
//			,int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con  =db.getConnection();

		String sql = "SELECT * FROM product_info WHERE  product_name LIKE \'%"+ search_word +"%\' OR product_name_kana LIKE \'%"+ search_word +"%\'";

		try{
			PreparedStatement ps =con.prepareStatement(sql);
//			ps.setInt(1, pages);
//			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE product_name LIKE '%" + search_word +"%' OR product_name_kana LIKE '%"+ search_word +"%')"));*/
				dto.setHowProductSearch("BySearchWord");
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
	public ArrayList<ProductInfoDTO> ByProductCategory(int category_id
//			, int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE category_id = ?";

		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ps.setInt(1, category_id);
			/*ps.setInt(2, category_id);*/
//			ps.setInt(3, pages);
//			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE  category_id = " + category_id + ")"));*/
				dto.setHowProductSearch("ByProductCategory");
				searchList.add(dto);

			}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
		return searchList;
	}

	//☆★カテゴリあり、検索値あり★☆
	public ArrayList<ProductInfoDTO> ByCategoryAndSearchWord(String search_word, int category_id
//			, int pages, int max_product_display
			){

		DBConnector db =new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE product_name LIKE \'%"+ search_word + "%\' AND category_id = ?";


	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, category_id);
		/*ps.setInt(2, category_id);*/
//		ps.setInt(3, pages);
//		ps.setInt(4, max_product_display);
		ResultSet rs = ps.executeQuery();

		while(rs.next()){
			ProductInfoDTO dto = new ProductInfoDTO();

			dto.setProductId(rs.getInt("product_id"));
			dto.setProductName(rs.getString("product_name"));
			dto.setProductNameKana(rs.getString("product_name_kana"));
			dto.setProductDescription(rs.getString("product_description"));
			dto.setCategoryId(rs.getInt("category_id"));
			dto.setPrice(rs.getInt("price"));
			dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

			/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT(*) FROM product_info WHERE  product_name LIKE '%" + search_word +"%' AND category_id =" + category_id +")"));*/
			dto.setHowProductSearch("ByCategoryAndSearchWord");
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
	public ArrayList<ProductInfoDTO> BySearchWordKana(String search_word
//			, int pages, int max_product_display
			){

		DBConnector db =new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE product_name_kana LIKE \'%"+ search_word +"%\' ";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setInt(1, pages);
//			ps.setInt(2, max_product_display);
			ResultSet rs = ps.executeQuery();


			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT (*) FROM product_info WHERE product_name_kana LIKE '%" + search_word + "%')"));*/
				dto.setHowProductSearch("BySearchWordKana");
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
	public ArrayList<ProductInfoDTO> ByCategoryAndSearchWordKana(int category_id, String search_word
//			, int pages, int max_product_display
			){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT * FROM product_info WHERE product_name_kana LIKE \'%" + search_word + "%\' AND category_id = ?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, category_id);
			/*ps.setInt(2, category_id);*/
//			ps.setInt(3, pages);
//			ps.setInt(4, max_product_display);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				ProductInfoDTO dto = new ProductInfoDTO();

				dto.setProductId(rs.getInt("product_id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setCategoryId(rs.getInt("category_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilePath(rs.getString("image_file_path") + "/" +rs.getString("image_file_name"));

				/*dto.setProduct_type_count(rs.getInt("(SELECT COUNT (*) FROM product_info WHERE product_name_kana LIKE '%" + search_word + "%' AND category_id="+ category_id +")"));*/
				dto.setHowProductSearch("ByCategoryAndSearchWordKana");
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








