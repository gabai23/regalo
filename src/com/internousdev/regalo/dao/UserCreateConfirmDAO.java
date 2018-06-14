package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.regalo.util.DBConnector;

public class UserCreateConfirmDAO {
	public DBConnector db = new DBConnector();
	public Connection con = null;






//ConfirmActionで、同じIdが存在するかチェックするために使うメソッドです

	public boolean existsUserId(String userId) throws SQLException {
		boolean result = false;
		Connection con = db.getConnection();

		String sql = "SELECT * FROM user_info WHERE user_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				result = true;

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			con.close();

		}
		return result;
	}
}