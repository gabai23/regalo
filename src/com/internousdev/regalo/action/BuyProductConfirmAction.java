package com.internousdev.regalo.action;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.AddressInfoDAO;
import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dto.AddressInfoDTO;
import com.internousdev.regalo.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;



public class BuyProductConfirmAction extends ActionSupport implements SessionAware {
//変数
	private Map<String, Object> session;
	private int totalPrice =0;
	private int productCount;
	private int settlement;
	private List<CartDTO> cartList = new ArrayList<CartDTO>();
	private ArrayList<AddressInfoDTO> addressInfoListDTO = new ArrayList<AddressInfoDTO>();
	String userId;



//メソッド
	public String execute() throws SQLException{
		String result = ERROR;

		//ログインしていれば宛先情報を取得する
		if((boolean) session.get("loginFlg")){
			AddressInfoDAO addressInfoDAO = new AddressInfoDAO();
			addressInfoListDTO = addressInfoDAO.getAddressInfo(session.get("userId").toString());

		//宛先情報があれば
			if(addressInfoListDTO.size() > 0) {

				result = SUCCESS;
				//ログインしているが宛先情報がなければ
			} else {

				result ="DESTINATION";
				return result;
			}

		//ログインしていなければ
		}else if(!(boolean)session.get("loginFlg")){

				result = ERROR;
				session.put("settlement", true);

				return result;

	     }

//カート情報取得
//６月６日現在これ以降未完成、、、メソッドとtotalPrice確認する
		CartDAO dao = new CartDAO();
		cartList = dao.getCartDtoList(session.get("userId").toString());
		System.out.println(cartList.size());
				if(cartList.size() > 0) {
					result = SUCCESS;
				}

				for(CartDTO dto: cartList) {
					totalPrice += dto.getPrice() * dto.getProductCount();

				}

				return result;

    }
	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getProductCount() {
		return productCount;
	}


	public void setproductCount(int productCount) {
		this.productCount = productCount;
	}


	public List<CartDTO> getCartList() {
		return cartList;
	}


	public void setCartList(List<CartDTO> cartList) {
		this.cartList = cartList;
	}


	public int getSettlement() {
		return settlement;
	}


	public void setSettlement(int settlement) {
		this.settlement = settlement;
	}


	public ArrayList<AddressInfoDTO> getAddressInfoListDTO() {
		return addressInfoListDTO;
	}


	public void setAdressInfoListDTO(ArrayList<AddressInfoDTO> addressInfoListDTO) {
		this.addressInfoListDTO = addressInfoListDTO;
	}
}