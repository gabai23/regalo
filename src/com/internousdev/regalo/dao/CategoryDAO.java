package com.internousdev.regalo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.internousdev.regalo.dto.CategoryDTO;
import com.internousdev.regalo.util.DBConnector;

public class CategoryDAO {
	public List<CategoryDTO> getCategoryList(){
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		List<CategoryDTO> CategoryList = new ArrayList<CategoryDTO>();
		String sql = "select * from m_category";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CategoryDTO CategoryDTO = new CategoryDTO();
				CategoryDTO.setId(rs.getInt("id"));
				CategoryDTO.setCategoryId(rs.getInt("category_id"));
				CategoryDTO.setCategoryName(rs.getString("category_name"));
				CategoryDTO.setCategoryDescription(rs.getString("category_description"));
				CategoryDTO.setInsertDate(rs.getDate("insert_date"));
				CategoryDTO.setUpdateDate(rs.getDate("update_date"));
				CategoryList.add(CategoryDTO);
			}
			Iterator<CategoryDTO> iterator = CategoryList.iterator();
			if(!(iterator.hasNext())) {
				CategoryList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return CategoryList;
	}
}
