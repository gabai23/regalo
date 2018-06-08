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
			dto.setPrice(rs.getInt("price"));
			dto.setUpdateDate(rs.getDate("update_date"));
			dto.setRegistDate(rs.getDate("regist_date"));


			/*
			 * ランクアップ機能
			 */

			//ユーザー累計金額更新
			int productCount = dto.getProductCount();
			int price = dto.getPrice();

			int totalPrice = productCount * price;

			boolean flg = false;

			flg = setTotalPrice(totalPrice, userId);

			if(flg ){
				System.out.println("BuyProductCompleteDAO-----");
				System.out.println("ユーザー累計購入金額更新しました");
				System.out.println("userId:"+userId+"  totalPrice:"+totalPrice);
				System.out.println("-----BuyProductCompleteDAO");
			}

			//ユーザーランク確認
			int rank;
			rank = getRank(userId);

			//ユーザー累計金額確認
			int totalCountFromUserInfo;
			totalCountFromUserInfo = getTotalPrice(userId);

			//シルバーランクにランクアップ
			if(rank == 0 && totalCountFromUserInfo >= 750000 && totalCountFromUserInfo < 2000000){
				flg = setRank(1,userId);

				if(flg) {
					System.out.println("BuyProductCompleteDAO-----");
					System.out.println("会員ランク更新しました");
					System.out.println("userId:"+userId+"  rank:シルバー");
					System.out.println("-----BuyProductCompleteDAO");
				}
			}

			//ゴールドランクにランクアップ
			if(rank == 1 && totalCountFromUserInfo >= 2000000){
				flg = setRank(2,userId);

				if(flg) {
					System.out.println("BuyProductCompleteDAO-----");
					System.out.println("会員ランク更新しました");
					System.out.println("userId:"+userId+"  rank:シルバー");
					System.out.println("-----BuyProductCompleteDAO");
				}
			}

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
public int setProductHistory(List<CartDTO> cartList, int destinationId) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();



	int ret = 0;

	try {
		for(int i = 0; i < cartList.size(); i++) {

			String sql = "INSERT INTO purchase_history_info(user_id, product_id, product_count, price, destination_id, regist_date, update_date) VALUES(?, ?, ?, ?, ?, NOW(), NOW())";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1,  cartList.get(i).getUserId());
			ps.setInt(2, cartList.get(i).getProductId());
			ps.setInt(3,  cartList.get(i).getProductCount());
			ps.setInt(4, cartList.get(i).getPrice());
			ps.setInt(5, destinationId);

			ret += ps.executeUpdate();
		}

	} catch(SQLException e) {
		e.printStackTrace();

	} finally {
		con.close();

	}
	return ret;
}

//ユーザー累計購入金額確認
public int getTotalPrice(String userId) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();

	int totalCountFromUserInfo = 0;

	String sql = "SELECT total_price FROM user_info WHERE user_id = ?";

	try {
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, userId);

		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			totalCountFromUserInfo = rs.getInt("total_price");
		}


	} catch(Exception e) {
		e.printStackTrace();

	} finally {
		con.close();
	}

	return totalCountFromUserInfo;
}

//ユーザー累計購入金額更新
public boolean setTotalPrice(int totalPrice, String userId) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();

	boolean flg = false;

	String sql = "UPDATE user_info SET total_price = total_price + ? WHERE user_id = ?";

	try {
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, totalPrice);
		ps.setString(2, userId);

		int i = ps.executeUpdate();

		if(i > 0){
			flg = true;
		}

	} catch(Exception e) {
		e.printStackTrace();

	} finally {
		con.close();
	}

	return flg;
}

//会員ランク確認
public int getRank(String userId) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();

	int rank = 0;

	String sql = "SELECT rank FROM user_info WHERE user_id = ?";

	try {
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, userId);

		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			rank = rs.getInt("rank");
		}


	} catch(Exception e) {
		e.printStackTrace();

	} finally {
		con.close();
	}

	return rank;
}

//会員ランク更新
public boolean setRank(int rank, String userId) throws SQLException {

	DBConnector db = new DBConnector();

	Connection con = db.getConnection();

	boolean flg = false;

	String sql = "UPDATE user_info SET rank = ? WHERE user_id = ?";

	try {
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, rank);
		ps.setString(2, userId);

		int i = ps.executeUpdate();

		if(i > 0){
			flg = true;
		}

	} catch(Exception e) {
		e.printStackTrace();

	} finally {
		con.close();
	}

	return flg;
}

}


