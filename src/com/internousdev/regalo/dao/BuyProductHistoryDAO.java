package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.regalo.dto.BuyProductHistoryDTO;
import com.internousdev.regalo.util.DBConnector;

public class BuyProductHistoryDAO {

//	購入履歴

	public ArrayList<BuyProductHistoryDTO> getProductHistory(String userId) throws SQLException {

		DBConnector db = new DBConnector();
		Connection con =db.getConnection();
		ArrayList<BuyProductHistoryDTO> buyProductHistoryDTOList = new ArrayList<BuyProductHistoryDTO>();

		String sql = "SELECT"
				+ " phi.id,"
				+ " pi.product_name,"
				+ " pi.image_file_name, "
				+ " pi.release_company,"
				+ " pi.price,"
				+ " phi.product_count,"
				+ " phi.destination_id, "
				+ " phi.regist_date"
				+ " FROM purchase_history_info phi"
				+ " LEFT JOIN product_info pi"
				+ " ON phi.user_id = pi.product_id"
				+ " WHERE phi.user_id = ? "
				+ " ORDER BY phi.regist_date DESC";


		try {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				BuyProductHistoryDTO dto = new BuyProductHistoryDTO();

				dto.setId(rs.getInt("id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setImageFileName(rs.getString("image_file_name"));
				dto.setReleaseCompany(rs.getString("release_company"));
				dto.setPrice(rs.getInt("price"));
				dto.setProductConut(rs.getInt("product_count"));
				dto.setDestinationId(rs.getInt("destination_id"));
				dto.setRegistDate(rs.getString("regist_date"));

				buyProductHistoryDTOList.add(dto);
			}

		} catch(Exception e) {
			e.printStackTrace();

		} finally {
			con.close();

		}
		return buyProductHistoryDTOList;
	}


//	購入履歴削除削除

	public int deleteHistory(String userId) throws SQLException {

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "DELETE FROM purchase_history_info WHERE user_id = ?";

		PreparedStatement ps;

		int result = 0;

		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			result = ps.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();

		}finally {
			con.close();

		}
		return result;

	}



//	購入履歴個別削除

	public int deleteOneEach(int Id) throws SQLException {

		DBConnector db = new DBConnector();

		Connection con = db.getConnection();

		String sql = "DELETE FROM purchase_history_info WHERE id = ?";

		PreparedStatement ps;

		int result2 = 0;

		try{
			ps = con.prepareStatement(sql);
			ps.setInt(1, Id);

			result2 = ps.executeUpdate();

			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result2;

	}

}


