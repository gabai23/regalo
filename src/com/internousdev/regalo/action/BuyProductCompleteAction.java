package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.BuyProductCompleteDAO;
import com.internousdev.regalo.dao.CartDeleteDAO;
import com.internousdev.regalo.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

    public class BuyProductCompleteAction extends ActionSupport implements SessionAware {

	/**
	 * カートテーブルの情報を購入履歴テーブルに保存するメソッド実行
	 * 1.カート情報取得
	 * 2.購入履歴に登録
	 * 3.カートテーブルの情報を削除する
	 *
	 */
	// userId格納
	private String userId;

	// cartInfoDTO格納List
	private ArrayList<CartDTO> cartList = new ArrayList<CartDTO>();

	// session情報格納
	public Map<String, Object> session;

	// カートの合計金額
	private int totalPrice = 0;

	//宛先ID
	private int destinationId;

    public String execute() throws SQLException  {
	 String result = ERROR;
	 /*---------------------------------------------------------
		1.カート情報取得（List型で受け取る）
	---------------------------------------------------------*/
	 BuyProductCompleteDAO buyproductComplete = new  BuyProductCompleteDAO();
	 if (session.containsKey("userId")) {
		 cartList = buyproductComplete.getCartList(session.get("userId").toString());

		 System.out.println("cartList.size():"+cartList.size());
		 /*---------------------------------------------------------
			カート情報なしの場合
		---------------------------------------------------------*/
		if (cartList.size() == 0) {
			return ERROR;
		}
		/* コンソールに処理を表示------------------------------- */
		System.out.println("----BuyItemCompleteAction:execute");
		System.out.println(cartList.get(0).getUserId());
		System.out.println(cartList.get(0).getPrice());
		System.out.println(cartList.get(0).getProductId());
		System.out.println(cartList.get(0).getProductCount());
		System.out.println("------------------------");
		/*------------------------------------------------------*/

		/*---------------------------------------------------------
			2.購入履歴に登録
		---------------------------------------------------------*/
        int i = buyproductComplete.setProductHistory(cartList, destinationId);
        System.out.println(i);
        /*---------------------------------------------------------
		カート情報ありの場合(listの数と処理件数と同じ場合)
	---------------------------------------------------------*/
	if (cartList.size() == i) {
		/*---------------------------------------------------------
		    3.カートテーブル情報を削除
		---------------------------------------------------------*/
		CartDeleteDAO delete = new CartDeleteDAO();
		delete.deleteAll(session.get("userId").toString());
		result = SUCCESS;
	}
}
       totalPrice = calcTotalPrice(cartList);
       return result;
       }

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public ArrayList<CartDTO> getCartList() {
		return cartList;
	}

	public void setCartList(ArrayList<CartDTO> cartList) {
		this.cartList = cartList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * 合計金額を計算するメソッド
	 */
	public int calcTotalPrice(ArrayList<CartDTO> cartList) {
		int totalPrice = 0;
		for (CartDTO dto : cartList) {
			totalPrice += dto.getPrice() * dto.getProductCount();
			System.out.println("合計" + totalPrice + "円");
		}
		return totalPrice;
	}




	public int getTotalprice() {
		return totalPrice;
	}

	public void setTotalprice(int totalprice) {
		this.totalPrice = totalprice;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}
    }