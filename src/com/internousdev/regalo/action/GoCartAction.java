package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoCartAction extends ActionSupport implements SessionAware{

	private String categoryId;
	private String keywords;
	private Map<String, Object> session;
	private List<CartDTO> CartDtoList = new ArrayList<>();

	private int totalPrice;

	public String execute() throws SQLException{

		String result = ERROR;
		String userId = null;
		CartDAO CartDao = new CartDAO();
		/*List<CartDTO> CartDtoList = new ArrayList<CartDTO>();*/
		if(session.containsKey("userId")) {
			userId = String.valueOf(session.get("userId"));
		}else if (session.containsKey("tempUserId")) {
			userId = String.valueOf(session.get("tempUserId"));
		}

		System.out.println(userId);

		CartDtoList = CartDao.getCartDtoList(userId);

		System.out.println("カートの件数:"+CartDtoList.size());

		totalPrice = calcTotalPrice(CartDtoList);

		result = SUCCESS;

		//カートのエラーメッセージを除去
	    session.remove("checkListErrorMessageList");
	    System.out.println("カートのエラーメッセージを削除しました");


		return result;

	}

	//合計金額計算
		public int calcTotalPrice(List<CartDTO> CartDtoList) {

			int totalPrice = 0;

			for(CartDTO dto: CartDtoList) {

				totalPrice += dto.getSubtotal() * dto.getProductCount();

			}
			return totalPrice;
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

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<CartDTO> getCartDtoList() {
		return CartDtoList;
	}

	public void setCartDtoList(List<CartDTO> cartDtoList) {
		CartDtoList = cartDtoList;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}
