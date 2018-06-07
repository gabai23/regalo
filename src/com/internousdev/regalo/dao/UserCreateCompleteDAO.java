package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.internousdev.regalo.dto.LoginDTO;
import com.internousdev.regalo.util.DBConnector;





public class UserCreateCompleteDAO {
	public DBConnector db = new DBConnector();
	public Connection con = null;


//	メソッド
	public boolean registerUser(LoginDTO ｌoginDTO) throws SQLException {
		boolean result = false;
		int updateCount = 0;

		String sql = "INSERT INTO user_info(user_id, password, family_name, first_name, family_name_kana, first_name_kana, sex, email, regist_date) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, NOW())";

		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ｌoginDTO.getUserId());
			ps.setString(2, ｌoginDTO.getPassword());
			ps.setString(3, ｌoginDTO.getFamilyName());
			ps.setString(4, ｌoginDTO.getFirstName());
			ps.setString(5, ｌoginDTO.getFamilyNameKana());
			ps.setString(6, ｌoginDTO.getFirstNameKana());
			ps.setBoolean(7,ｌoginDTO.isSex());
			ps.setString(8, ｌoginDTO.getEmail());

			System.out.println(ｌoginDTO.getFirstName());

			updateCount = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			con.close();

		}

		if (updateCount == 1) {
			result = true;

		}

		return result;
	}

	public int update(String password, String userId) {
		int result = 0;
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		String sql = "UPDATE user_info SET password = ? WHERE user_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, userId);
			int i = ps.executeUpdate();

			if (i > 0) {
				System.out.println(i + "件変更されました。");
				result = i;

			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return result;

	}


}