package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dto.CartDTO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class CartInsertAction extends ActionSupport implements SessionAware{

	private int productId;
	private String productName;
	private String productNameKana;
	private String imageFilePath;
	private String imageFileName;
	private int price;
	private String productCount;

//	private int productCount;
	private String releaseCompany;
	private Date releaseDate;
	private String productDescription;

	private String categoryId;

	private Map<String, Object> session;

	private List<CartDTO> CartDtoList = new ArrayList<>();

	private int totalPrice;

	@SuppressWarnings("unchecked")
	public String execute() {

		String result=ERROR;
		String userId = null;
		String tempUserId = null;

		List<ProductInfoDTO> productInfoDTOList = new ArrayList<>();

		if(session.containsKey("userId")) {
			userId = String.valueOf(session.get("userId"));
		}
		if (!(session.containsKey("userId")) && session.containsKey("tempUserId")) {
			userId = String.valueOf(session.get("tempUserId"));
			tempUserId = String.valueOf(session.get("tempUserId"));

		}
//		productCount = String.valueOf((productCount.split(" ,",0))[0]);

		productInfoDTOList = (List<ProductInfoDTO>)session.get("productInfoList");

		productId = (productInfoDTOList.get(0)).getProductId();

		price = (productInfoDTOList.get(0)).getPrice();


		/*Iterator<ProductInfoDTO> it = productInfoDTO.iterator();
		while(it.hasNext()) {
			ProductInfoDTO e = it.next();

		}*/

		CartDAO CartDao = new CartDAO();
		int count = CartDao.regist(userId,tempUserId,productId,productCount,price);
		if(count > 0) {
			result=SUCCESS;
		}
		/*List<CartDTO> CartDtoList = new ArrayList<CartDTO>();*/
		CartDtoList = CartDao.getCartDtoList(userId);
		/*Iterator<CartDTO> iterator = CartDtoList.iterator();
		if(!(iterator.hasNext())) {
			CartDtoList = null;
		}*/
		/*session.put("CartDtoList", CartDtoList);*/
		/*int totalPrice = Integer.parseInt(String.valueOf(CartDao.getTotalPrice(userId)));
		session.put("totalPrice", totalPrice);*/

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


	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}


	public String getProductCount() {
		return productCount;
	}

	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}

	public String getReleaseCompany() {
		return releaseCompany;
	}
	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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