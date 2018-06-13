package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductInfoDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoProductDetailAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	private List<ProductInfoDTO> productInfoList = new ArrayList<>();

	private List<ProductInfoDTO> relationList = new ArrayList<>();

	private List<ProductInfoDTO> relationInfoList = new ArrayList<>();

	private int productId;

	private int categoryId;

	public String execute() {

		String result = SUCCESS;

		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		//商品リスト
		productInfoList = productInfoDAO.getProductInfoByProductId(productId);

		session.put("productInfoList", productInfoList);

		//関連商品リスト
		relationList = productInfoDAO.getProductInfoByCategoryId(productInfoList.get(0).getCategoryId());

		//Iteratorの宣言
		Iterator<ProductInfoDTO> iterator = relationList.iterator();

		//関連商品3つまで表示
		for(int i = 0; i < 3; i++) {

			if(iterator.hasNext()) {

				ProductInfoDTO dto = (ProductInfoDTO)iterator.next();

				//表示商品と一致しないものを取得
				if(productId != dto.getProductId()) {

					//関連商品DTOに格納
					relationInfoList.add(dto);

				} else {
					i--;
					continue;

				}
			}
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

	public List<ProductInfoDTO> getRelationList() {
		return relationList;
	}

	public void setRelationList(List<ProductInfoDTO> relationList) {
		this.relationList = relationList;
	}

	public List<ProductInfoDTO> getRelationInfoList() {
		return relationInfoList;
	}

	public void setRelationInfoList(List<ProductInfoDTO> relationInfoList) {
		this.relationInfoList = relationInfoList;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}





}
