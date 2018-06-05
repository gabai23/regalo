package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoCartAction extends ActionSupport implements SessionAware{

	private String categoryId;
	private String keywords;
	private List<MCategoryDTO> mCategoryDtoList = new ArrayList<MCategoryDTO>();
	private Map<String, Object> session;

	public String execute() throws SQLException{

		return SUCCESS;

		String result = ERROR;
		String userId = null;
		CartDAO CartDao = new CartDAO();
		List<CartDTO> CartDtoList = new ArrayList<CartDTO>();
		if(session.containsKey("loginId")) {
			userId = String.valueOf(session.get("loginId"));
		}else if (session.containsKey("tempUserId")) {
			userId = String.valueOf(session.get("tempUserId"));
		}

		CartDtoList = CartDao.getCartDtoList(userId);
		Iterator<CartDTO> iterator = CartDtoList.iterator();
		if(!(iterator.hasNext())) {
			CartDtoList = null;
		}
		session.put("CartDtoList", CartDtoList);

		int totalPrice = Integer.parseInt(String.valueOf(CartDao.getTotalPrice(userId)));
		session.put("totalPrice", totalPrice);
		result = SUCCESS;

		if(!session.containsKey("mCategoryList")) {
			MCategoryDAO mCategoryDao = new MCategoryDAO();
			mCategoryDtoList = mCategoryDao.getMCategoryList();
			session.put("mCategoryDtoList", mCategoryDtoList);
		}
		return result;

	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

	}

}
