package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.regalo.dto.AddressInfoDTO;
import com.internousdev.regalo.util.DBConnector;

public class AddressInfoDAO {

	DBConnector db = new DBConnector();
	Connection con = null;

	public boolean registerAddress(AddressInfoDTO addressInfoDTO) throws SQLException {

		int updateCount = 0;
		boolean result = false;

		String sql = "INSERT INTO destination_info(user_id, family_name, first_name, family_name_kana, first_name_kana, user_address, tel_number, email, postal_code FROM destination_info WHERE user_id = ?";

		//DBから取得した値をaddressInfoListDTOの変数に格納

		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, addressInfoDTO.getUserId());
			ps.setString(2, addressInfoDTO.getFamilyName());
			ps.setString(3, addressInfoDTO.getFirstName());
			ps.setString(4, addressInfoDTO.getFamilyNameKana());
			ps.setString(5, addressInfoDTO.getFirstNameKana());
			ps.setString(6, addressInfoDTO.getAddr11());
			ps.setString(7, addressInfoDTO.getTelNumber());
			ps.setString(8, addressInfoDTO.getEmail());
			ps.setString(9, addressInfoDTO.getZip11());

			updateCount = ps.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			con.close();
		}

		if(updateCount == 1) {
			result = true;
		}
		return result;
	}

	public ArrayList<AddressInfoDTO> getAddressInfo(String userId) throws SQLException {

		ArrayList<AddressInfoDTO> addressInfoList = new ArrayList<AddressInfoDTO>();


		String sql = "SELECT id, family_name, first_name, family_name_kana, first_name_kana, user_address, tel_number, email, pastel_code FROM destination_info WHERE user_id = ?";


		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,userId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {


				AddressInfoDTO addressInfoDTO = new AddressInfoDTO();

				//addressInfoDTOに格納した値をaddressInfoDTOListに格納
				addressInfoDTO.setId(rs.getInt("id"));
				addressInfoDTO.setFamilyNameKana(rs.getString("family_name"));
				addressInfoDTO.setFirstName(rs.getString("first_name"));
				addressInfoDTO.setFamilyNameKana(rs.getString("family_name_kana"));
				addressInfoDTO.setFirstNameKana(rs.getString("first_name"));
				addressInfoDTO.setEmail(rs.getString("email"));
				addressInfoDTO.setTelNumber(rs.getString("tel_number"));
				addressInfoDTO.setZip11(rs.getString("pastal_code"));
				addressInfoDTO.setAddr11(rs.getString("user_address"));
				addressInfoList.add(addressInfoDTO);

			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return addressInfoList;


	}
}
