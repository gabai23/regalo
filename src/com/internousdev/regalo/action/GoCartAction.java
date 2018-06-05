package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class GoCartAction extends ActionSupport implements SessionAware{

//	private String categoryId;
//	private String keywords;
//	private List<MCategoryDTO> mCategoryDtoList = new ArrayList<MCategoryDTO>();
//	private Map<String, Object> session;

	public String execute() throws SQLException{

		return SUCCESS;

//		String result = ERROR;
//		String userId = null;
//		CartInfoDAO cartInfoDao = new CartInfoDAO();
//		List<CartInfoDTO> cartInfoDtoList = new ArrayList<CartInfoDTO>();
//		if(session.containsKey("loginId")) {
//			userId = String.valueOf(session.get("loginId"));
//		}else if (session.containsKey("tempUserId")) {
//			userId = String.valueOf(session.get("tempUserId"));
//		}
//		cartInfoDtoList = cartInfoDao.getCartInfoDtoList(userId);
//		Iterator<CartInfoDTO> iterator = cartInfoDtoList.iterator();
//		if(!(iterator.hasNext())) {
//			cartInfoDtoList = null;
//		}
//		session.put("cartInfoDtoList", cartInfoDtoList);
//
//		int totalPrice = Integer.parseInt(String.valueOf(cartInfoDao.getTotalPrice(userId)));
//		session.put("totalPrice", totalPrice);
//		result = SUCCESS;
//
//		if(!session.containsKey("mCategoryList")) {
//			MCategoryDAO mCategoryDao = new MCategoryDAO();
//			mCategoryDtoList = mCategoryDao.getMCategoryList();
//			session.put("mCategoryDtoList", mCategoryDtoList);
//		}
//		return result;

	}

//	public String getCategoryId() {
//		return categoryId;
//	}
//
//	public void setCategoryId(String categoryId) {
//		this.categoryId = categoryId;
//	}
//
//	public String getKeywords() {
//		return keywords;
//	}
//
//	public void setKeywords(String keywords) {
//		this.keywords = keywords;
//	}
//
//	public Map<String, Object> getSession() {
//		return session;
//	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO 自動生成されたメソッド・スタブ

	}

}
