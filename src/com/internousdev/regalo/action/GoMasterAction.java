package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductInfoDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoMasterAction extends ActionSupport implements SessionAware {

	private ArrayList<ProductInfoDTO> productInfoDTOList;

	Map<String, Object> session;

	public String execute() throws SQLException {
		String result = ERROR;

		if (session.containsKey("masterId")) {
			ProductInfoDAO dao = new ProductInfoDAO();
			productInfoDTOList = (ArrayList<ProductInfoDTO>) dao.getProductInfo();

			result = SUCCESS;
		} else {
			result = ERROR;
		}
		return result;
	}



	public ArrayList<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}

	public void setProductInfoDTOList(ArrayList<ProductInfoDTO> ProductInfoDTOList) {
		this.productInfoDTOList = ProductInfoDTOList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}