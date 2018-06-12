package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.AddressDeleteDAO;
import com.internousdev.regalo.dao.AddressInfoDAO;
import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dto.AddressInfoDTO;
import com.internousdev.regalo.dto.CartDTO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddressDeleteAction extends ActionSupport implements SessionAware {

	private Map<String,Object> session;
	private List<AddressInfoDTO> addressList = new ArrayList<AddressInfoDTO>();
	private String message;    //削除メッセージ
	private String deleteFlg;  //削除フラグ

	private AddressDeleteDAO dao = new AddressDeleteDAO();
	private AddressInfoDAO addressInfoDAO = new AddressInfoDAO();

	private List<AddressInfoDTO> addressInfoListDTO = new ArrayList<AddressInfoDTO>();

	private int finallyTotalPrice;
	private int id;
	String userId;

	private List<CartDTO> CartList = new ArrayList<CartDTO>();

	public List<CartDTO> getCartList() {
		return CartList;
	}

	private ArrayList<AddressInfoDTO> addressInfoDTOList = new ArrayList<AddressInfoDTO>();
	public ArrayList<AddressInfoDTO> getAddressInfoDTOList() {

		return addressInfoDTOList;
	}

	public void setAddressInfoDTOList(ArrayList<AddressInfoDTO> addressInfoDTOList) {

		this.addressInfoDTOList = addressInfoDTOList;
	}

	private int totalPrice = 0;
	public List<ProductInfoDTO> notSameCategoryList = new ArrayList<ProductInfoDTO>();
	public ProductInfoDTO dto = new ProductInfoDTO();

	public String execute() throws SQLException {

		System.out.println("AddressDeleteAction:deleteFlg"+deleteFlg);
		System.out.println("AddressDeleteAction:id"+id);


		userId = (String)session.get("userId");
		String result = SUCCESS;

		if(deleteFlg.equals("1")) {
			this.deleteAll();    //全て削除する

		}else if(deleteFlg.equals("2")) {
			this.deletePart();  //選択したものを削除する
		}

		//ログインユーザーのカート情報を表示
		CartDAO cartDAO = new CartDAO();
		CartList = cartDAO.getCartDtoList(userId);

		if((boolean) session.get("loginFlg")) {
			AddressInfoDAO addressInfoDAO = new AddressInfoDAO();
			addressInfoDTOList.addAll(addressInfoDAO.getAddressInfo(session.get("userId").toString()));

		} else {
			return ERROR;
		}

		if(CartList.size() == 0) {
			return "other";
		}

		for(CartDTO dto : CartList) {
			setTotalPrice(getTotalPrice() + dto.getPrice());
		}

		for(int i=0; i<CartList.size(); i++) {
			finallyTotalPrice += CartList.get(i).getSubtotal();
		}

		if(addressInfoDTOList.size() > 0) {
			result = SUCCESS;
		}else {
			result = "address";
		}

		return result;
	}

	//全削除メソッド
	public String deleteAll() throws SQLException {

		String user_id = session.get("userId").toString();
		System.out.println("全件削除");

		int res = dao.deleteAllAddress(user_id);
		String result = ERROR;

		if(res > 0) {
			result = "address";
			addressList = null;
			System.out.println(res + "件削除しました");

		}else if(res == 0) {
			System.out.println("削除できませんでした");

		}
		addressInfoListDTO = addressInfoDAO.getAddressInfo(session.get("userId").toString());
		return result;
	}

	//選択削除メソッド
	public String deletePart() throws SQLException {
		System.out.println("選択削除");
		int res = dao.deletePartAddress(id);
		addressList = addressInfoDAO.getAddressInfo(userId);

		String result = SUCCESS;

		if(res > 0) {
			System.out.println(res + "件削除しました");

		}else if(res == 0) {
			System.out.println("削除できませんでした");
			result = ERROR;
		}
		addressInfoListDTO = addressInfoDAO.getAddressInfo(session.get("userId").toString());
		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<AddressInfoDTO> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<AddressInfoDTO> addressList) {
		this.addressList = addressList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(String deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public AddressDeleteDAO getDao() {
		return dao;
	}

	public void setDao(AddressDeleteDAO dao) {
		this.dao = dao;
	}

	public AddressInfoDAO getAddressInfoDAO() {
		return addressInfoDAO;
	}

	public void setAddressInfoDAO(AddressInfoDAO addressInfoDAO) {
		this.addressInfoDAO = addressInfoDAO;
	}

	public int getFinallyTotalPrice() {
		return finallyTotalPrice;
	}

	public void setFinallyTotalPrice(int finallyTotalPrice) {
		this.finallyTotalPrice = finallyTotalPrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<ProductInfoDTO> getNotSameCategoryList() {
		return notSameCategoryList;
	}

	public void setNotSameCategoryList(List<ProductInfoDTO> notSameCategoryList) {
		this.notSameCategoryList = notSameCategoryList;
	}

	public ProductInfoDTO getDto() {
		return dto;
	}

	public void setDto(ProductInfoDTO dto) {
		this.dto = dto;
	}

	public void setCartDtoList(List<CartDTO> CartList) {
		this.CartList = CartList;
	}

	public List<AddressInfoDTO> getAddressInfoListDTO() {
		return addressInfoListDTO;
	}

	public void setAddressInfoListDTO(List<AddressInfoDTO> addressInfoListDTO) {
		this.addressInfoListDTO = addressInfoListDTO;
	}
}

