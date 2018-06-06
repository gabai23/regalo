package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.regalo.dto.LoginDTO;
import com.internousdev.regalo.util.DBConnector;

public class LoginDAO {
	
	private LoginDTO dto = new LoginDTO();
	
	public LoginDTO userInfo(String userId) {
		
		DBConnector db = new DBConnector();
		
		Connection con = db.getConnection();
		
		String sql = "select * from where user_id = ?";
		
		try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, userId);
		
		ResultSet rs = ps.executeQuery();
		
		
		
		if(rs.next()) {
			
			dto.setId(rs.getInt("id"));
			dto.setUserId(rs.getString("user_id"));
			dto.setPassword(rs.getString("password"));
			dto.setFamilyName(rs.getString("family_name"));
			dto.setFamilyNameKana(rs.getString("family_name_kana"));
			dto.setFirstName(rs.getString("first_name"));
			dto.setFirstNameKana(rs.getString("first_name_kana"));
			dto.setEmail(rs.getString("email"));
			
		}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public boolean existsUserId(String userId) throws SQLException {
		
		boolean result = false;
		
		DBConnector db = new DBConnector();
		
		Connection con = db.getConnection();
		
		String sql = "select * from where user_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, userId);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			
			LoginDTO dto = new LoginDTO();
			
			dto.setId(rs.getInt("id"));
			dto.setUserId(rs.getString("user_id"));
			dto.setPassword(rs.getString("password"));
			dto.setFamilyName(rs.getString("family_name"));
			dto.setFamilyNameKana(rs.getString("family_name_kana"));
			dto.setFirstName(rs.getString("first_name"));
			dto.setFirstNameKana(rs.getString("first_name_kana"));
			dto.setEmail(rs.getString("email"));
			
			if(!(rs.getString("user_id").equals(null))) {
				result = true;
			}
		}
		
		return result;
		
	}
	
	

}
