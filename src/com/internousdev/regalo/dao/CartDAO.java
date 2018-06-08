package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.regalo.dto.CartDTO;
import com.internousdev.regalo.util.DBConnector;

public class CartDAO {

	public List<CartDTO> getCartDtoList(String loginId) {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		List<CartDTO> CartDtoList = new ArrayList<CartDTO>();

		String sql="select"
		+ " ci.id as id,"
		+ " ci.user_id as user_id,"
		+ " ci.temp_user_id as temp_user_id,"
		+ " ci.product_id as product_id,"
		+ " sum(ci.product_count) as product_count,"
		+ " pi.price as price,"
		+ " pi.regist_date as regist_date,"
		+ " pi.update_date as update_date,"
		+ " pi.product_name as product_name,"
		+ " pi.product_name_kana as product_name_kana,"
		+ " pi.product_description as product_description,"
		+ " pi.category_id as category_id,"
		+ " pi.image_file_path as image_file_path, "
		+ " pi.image_file_name as image_file_name, "
		+ " pi.release_date as release_date,"
		+ " pi.release_company as release_company,"
		+ " pi.status as status,"
		+ " (sum(ci.product_count) * pi.price) as subtotal"
		+ " FROM cart_info as ci"
		+ " LEFT JOIN product_info as pi"
		+ " ON ci.product_id = pi.product_id"
		+ " WHERE ci.user_id = ?"
		+ " group by product_id";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				CartDTO CartDTO = new CartDTO();
				CartDTO.setId(resultSet.getInt("id"));
				CartDTO.setUserId(resultSet.getString("user_id"));
				CartDTO.setTempUserId(resultSet.getString("temp_user_id"));
				CartDTO.setProductId(resultSet.getInt("product_id"));
				CartDTO.setProductCount(resultSet.getInt("product_count"));
				CartDTO.setPrice(resultSet.getInt("price"));
				CartDTO.setRegistDate(resultSet.getDate("regist_date"));
				CartDTO.setUpdateDate(resultSet.getDate("update_date"));
				CartDTO.setProductName(resultSet.getString("product_name"));
				CartDTO.setProductNameKana(resultSet.getString("product_name_kana"));
				CartDTO.setProductDescription(resultSet.getString("product_description"));
				CartDTO.setCategoryId(resultSet.getInt("category_id"));
				CartDTO.setImageFilePath(resultSet.getString("image_file_path"));
				CartDTO.setImageFileName(resultSet.getString("image_file_name"));
				CartDTO.setReleaseDate(resultSet.getDate("release_date"));
				CartDTO.setReleaseCompany(resultSet.getString("release_company"));
				CartDTO.setStatus(resultSet.getString("status"));
				CartDTO.setSubtotal(resultSet.getInt("subtotal"));
				CartDtoList.add(CartDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return CartDtoList;
	}

	public int getTotalPrice(String userId) {
		int totalPrice = 0;
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		String sql = "select sum(product_count * price) as total_price from cart_info where user_id=? group by user_id";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				totalPrice = resultSet.getInt("total_price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalPrice;
	}

	public int regist(String userId, String tempUserId, int productId, String productCount, int price) {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "insert into cart_info(user_id, temp_user_id, product_id, product_count, price, regist_date)"
				+ " values (?, ?, ?, ?, ?, now())";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, tempUserId);
			preparedStatement.setInt(3, productId);
			preparedStatement.setString(4, productCount);
			preparedStatement.setInt(5, price);

			count = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}



	public boolean isExistsCart(String tempUserId) {

		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		boolean flg = false;
		String sql = "SELECT COUNT(*) FROM cart_info where temp_user_id=?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, tempUserId);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()){
				count = rs.getInt("COUNT(*)");
			}


			System.out.println("CartDAO:"+count);

			if(count > 0){
				flg = true;
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flg;

	}

	public int linkToLoginId(String tempUserId, String loginId) {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "update cart_info set user_id=?, temp_user_id = null where temp_user_id=?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setString(2, tempUserId);
			count = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
