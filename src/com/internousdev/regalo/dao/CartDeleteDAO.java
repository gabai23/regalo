package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.regalo.util.DBConnector;

public class CartDeleteDAO {

	public int delete(String id) {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "delete from cart_info where id=?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);

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

	public int deleteAll(String userId) {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		int count = 0;
		String sql = "delete from cart_info where user_id=?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userId);

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

	//カートの中身を全て削除
//	public void deleteCartAll(String userId) {
//
//		DBConnector db = new DBConnector();
//		Connection con = db.getConnection();
//
//		String sql = "DELETE FROM cart_info WHERE user_id = ?";
//
//		try {
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, userId);
//
//			ps.executeUpdate();
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//
//		}
//
//		try {
//			con.close();
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//	}

	//カートの中身を1つずつ削除
//	public void deleteCartOneEach(String userId, int itemId) {
//
//		DBConnector db = new DBConnector();
//		Connection con = db.getConnection();
//
//		String sql = "DELETE FROM cart_info WHERE user_id = ? AND item_id = ?";
//
//		try {
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, userId);
//			ps.setInt(2, itemId);
//
//			ps.executeUpdate();
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//
//		}
//
//		try {
//			con.close();
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//
//		}
//	}

}
