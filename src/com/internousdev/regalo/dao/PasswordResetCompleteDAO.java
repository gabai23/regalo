package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.regalo.util.DBConnector;
import com.internousdev.regalo.util.DateUtil;


public class PasswordResetCompleteDAO {

	//パスワード再設定メソッド

	public int PasswordReset(String password1, String userId, String password) throws SQLException {

		DBConnector dbConnector = new DBConnector();

		Connection connection = dbConnector.getConnection();

		DateUtil dateUtil = new DateUtil();

		int check=0;

		String sql = "UPDATE user_info SET password = ?, update_date = ? WHERE user_id=? and password = ?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, password1);
			preparedStatement.setString(2, dateUtil.getDate());
			preparedStatement.setString(3, userId);
			preparedStatement.setString(4, password);

			check = preparedStatement.executeUpdate();

			System.out.println("新しいパスワード"+password1);
			System.out.println("現在のパスワード"+password);

			System.out.println(check);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			connection.close();
		}

		return check;
	}

	public boolean passwordConfirm(String userId, String password){
		boolean result = false;

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		//ユーザーID、現在のパスワードから検索
		String sql = "SELECT count(*) as count FROM user_info WHERE user_id = ? and password = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,userId);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				if(rs.getInt("count") > 0){
					result = true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();

		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int passwordInsert(String userId, String password) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		int check = 0;

		//ユーザーID、パスワードで検索しパスワードを書き換え
		String sql = "UPDATE user_info SET password = ? WHERE user_id = ? and password = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, userId);
			check = ps.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();

		} catch(SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

}
