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
		String sql = "select * from user_info where user_id = ?";
		
		try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ResultSet rs = ps.executeQuery();//結果表が送られてきました！
		
		
		//行下にいって、列が存在したら→true
		if(rs.next()) {
			//ユーザー登録に使う情報をdtoに格納(setterに情報が代入される）
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
		//Connectionの取得
		DBConnector db = new DBConnector();
		
		Connection con = db.getConnection();
		//user_idカラムからの情報の取得
		String sql = "select * from user_info where user_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, userId);
		//送信かつ、結果表の取得→この場合は１列の結果表しか取得していない。
		ResultSet rs = ps.executeQuery();
		//だからifを使う→複数行あったら、whileを使う。
		if(rs.next()) {
			//DTOのインスタンス化な。スコープ判定は100％ある。
			LoginDTO dto = new LoginDTO();
				/*dtoのsetメソッドを使用。→setterな。
				LOginDTOで書いてあるsetterメソッドの実行、値の更新（代入）*/
			dto.setId(rs.getInt("id"));//結果表から。データのgetを行っているだけな。
			dto.setUserId(rs.getString("user_id"));
			dto.setPassword(rs.getString("password"));
			dto.setFamilyName(rs.getString("family_name"));
			dto.setFamilyNameKana(rs.getString("family_name_kana"));
			dto.setFirstName(rs.getString("first_name"));
			dto.setFirstNameKana(rs.getString("first_name_kana"));
			dto.setEmail(rs.getString("email"));
			
			
			//結果表のuser_idカラムからgetしてきたデータが入ってたら、の条件分岐
			if(!(rs.getString("user_id").equals(null))) {
				result = true;
			}
		}
		
		return result;
		
	}
	
	

}
