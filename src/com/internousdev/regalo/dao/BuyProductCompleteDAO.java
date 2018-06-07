package com.internousdev.regalo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.regalo.dto.CartDTO;
import com.internousdev.regalo.util.DBConnector;

public class BuyProductCompleteDAO {
	private DBConnector dbConnector = new DBConnector();

	private Connection con = dbConnector.getConnection();

	public ArrayList<CartDTO> cartList = new ArrayList<CartDTO>();

	//カートの中身を購入履歴に登録する
	public ArrayList<CartDTO> getCartList(String userId) throws SQLException {

	String sql = "SELECT * FROM cart_info WHERE user_id=?";
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {

			CartDTO dto = new CartDTO();

			dto.setUserId(rs.getString("user_id"));
			dto.setProductId(rs.getInt("product_id"));
			dto.setProductCount(rs.getInt("product_count"));
			dto.setPrice(rs.getInt("product_price"));
			dto.setUpdateDate(rs.getDate("update_date"));
			dto.setRegistDate(rs.getDate("insert_date"));

			cartList.add(dto);

		}
	} catch(SQLException e) {
		e.printStackTrace();

	} finally {
		con.close();

	}
	return cartList;

	}


//購入情報保存
public int setProductHistory(List<CartDTO> cartList) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();



	int ret = 0;

	try {
		for(int i = 0; i < cartList.size(); i++) {

			String sql = "INSERT INTO purchase_history_info(user_id, product_id, product_count, price, regist_date, update_date) VALUES(?, ?, ?, ?, NOW(), NOW())";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1,  cartList.get(i).getUserId());
			ps.setInt(2, cartList.get(i).getProductId());
			ps.setInt(3,  cartList.get(i).getProductCount());
			ps.setInt(4, cartList.get(i).getPrice());


			ret += ps.executeUpdate();
		}

	} catch(SQLException e) {
		e.printStackTrace();

	} finally {
		con.close();

	}
	return ret;
}

}


