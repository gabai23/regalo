package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductInfoDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoProductListAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	private List<ProductInfoDTO> productInfoList = new ArrayList<>();

	public String execute() {

		String result = SUCCESS;

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		productInfoList = productInfoDAO.getProductInfo();

		for(int i=0; i < productInfoList.size(); i++){
		System.out.println(productInfoList.get(i).getProductName());
		}

		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<ProductInfoDTO> getProductInfoList() {
		return productInfoList;
	}

	public void setProductInfoList(List<ProductInfoDTO> productInfoList) {
		this.productInfoList = productInfoList;
	}




}
