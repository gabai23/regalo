package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.regalo.util.DBConnector;

public class ProductDeleteDAO {

	//商品削除

	public int productDelete(int product_id) throws SQLException{

		DBConnector dbConnector = new DBConnector();

		Connection connection = dbConnector.getConnection();

		String sql ="DELETE FROM product_info WHERE product_id=?";

		PreparedStatement preparedStatement;

		int result = 0;
		try{
			preparedStatement =connection.prepareStatement(sql);
			preparedStatement.setInt(1,product_id);
			result = preparedStatement.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return result;
	}




}
