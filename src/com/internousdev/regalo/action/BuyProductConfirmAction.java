package com.internousdev.regalo.action;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.AddressInfoDAO;
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




//メソッド
	public String execute() throws SQLException{
		String result = ERROR;
		String userId;
		//ログインしていれば宛先情報を取得する
		if((boolean) session.get("loginFlg")){
			AddressInfoDAO addressInfoDAO = new AddressInfoDAO();
			addressInfoListDTO = addressInfoDAO.getAddressInfo(userId);

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
				settlement = 1;

				return result;

	     }

//カート情報取得
//６月５日現在これ以降未完成
		CartDAO dao = new CartDAO();
		cartList = dao.
    }
}