package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dao.CartDeleteDAO;
import com.internousdev.regalo.dto.CartDTO;
import com.opensymphony.xwork2.ActionSupport;

public class CartDeleteAction extends ActionSupport implements SessionAware{


	/*private Collection<String> checkList;*/
	private List<String> checkList;
	private String categoryId;
	private String productId;

	private String sex;
	private List<String> sexList = new ArrayList<String>();
/*	private static final String MALE = "男性";
	private static final String FEMALE = "女性";
	private String defaultSexValue = MALE;*/

	private String productName;
	private String productNameKana;
	private String imageFilePath;
	private String imageFileName;
	private String price;
	private String releaseCompany;
	private String releaseDate;
	private String productCount;
	private String subtotal;

	private List<CartDTO> CartDtoList = new ArrayList<>();

	private int totalPrice;

	private Map<String, Object> session;

	public String execute() {


		String result=ERROR;
		CartDAO CartDAO = new CartDAO();
		CartDeleteDAO CartDeleteDAO = new CartDeleteDAO();
		int count = 0;
		List<String> checkListErrorMessageList = new ArrayList<String>();

		//チェックボックスが空なら
//		if(checkList==null){
//			checkListErrorMessageList.add("チェックされていません。");
//			session.put("checkListErrorMessageList", checkListErrorMessageList);
//
//			result = ERROR;
//		}
		if(checkList.isEmpty()) {
			checkListErrorMessageList.add("チェックされていません。");
			session.put("checkListErrorMessageList", checkListErrorMessageList);

			result = ERROR;
		}

		//チェックボックスあり
		else {

			//カート情報削除
			for(String id:checkList) {
				count += CartDeleteDAO.delete(id);
			}

			if(count > 0) {
				System.out.println("カート情報削除成功");
				result=SUCCESS;

			} else {
				System.out.println("カート情報削除失敗");
			}


			/*if(count <= 0) {
				checkListErrorMessageList.add("チェックされていません。");
				session.put("checkListErrorMessageList", checkListErrorMessageList);
				return ERROR;

			}else */

				/*sexList.add(MALE);
				sexList.add(FEMALE);*/
		}

		//カート情報取得
		String userId = null;

		if(session.containsKey("userId")) {
			userId = String.valueOf(session.get("userId"));

		}else if (session.containsKey("tempUserId")) {
			userId = String.valueOf(session.get("tempUserId"));
		}

		CartDtoList = CartDAO.getCartDtoList(userId);

		//合計金額
		totalPrice = calcTotalPrice(CartDtoList);

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




	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public List<String> getSexList() {
		return sexList;
	}

	public void setSexList(List<String> sexList) {
		this.sexList = sexList;
	}

/*	public String getDefaultSexValue() {
		return defaultSexValue;
	}

	public void setDefaultSexValue(String defaultSexValue) {
		this.defaultSexValue = defaultSexValue;
	}*/

	/*public Collection<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(Collection<String> checkList) {
		this.checkList = checkList;
	}*/



	public String getProductId() {
		return productId;
	}

	public List<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(List<String> checkList) {
		this.checkList = checkList;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}


	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductNameKana() {
		return productNameKana;
	}

	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getReleaseCompany() {
		return releaseCompany;
	}

	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getProductCount() {
		return productCount;
	}

	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}

	public String getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(String subtotal) {
		this.subtotal = subtotal;
	}
	public Map<String, Object> getSession() {
	return session;
}

	@Override
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
