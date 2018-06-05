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

	public ArrayList<ProductSearchDTO> allProductInfo(int pages, int maxProductDisplay){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info) FROM product_info LIMIT ?,? ";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, maxProductDisplay);
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
				dto.setHow_product_search("allProductInfo");

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

	public ArrayList<ProductSearchDTO> ByProductId(String sq, int pages, int maxProductDisplay){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *, (SELECT COUNT(*) FROM product_info WHERE " + sq + ") FROM product_info WHERE "  + sq  + "LIMIT ?,?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pages);
			ps.setInt(2, maxProductDisplay);
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

	public ArrayList<ProductSearchDTO> ByProductIdAndCategory(String sq,int category_id, int pages, int maxProductDisplay){

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "SELECT *,(SELECT COUNT(*) FROM product_info WHERE "+ sq + "AND category_id = ?)FROM product_info WHERE " + sq + "AND category_id = ? LIMIT ?,?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ps.setInt(2, categoryId);
			ps.setInt(3, pages);
			ps.setInt(4, maxItemDisplay);
			ResultSet rs = ps.executeQuery();




	}




}


