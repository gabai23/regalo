package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.ProductDeleteDAO;
import com.internousdev.regalo.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductDeleteAction extends ActionSupport implements SessionAware{

	public Map<String, Object> session;
	private String id;
	private String product_id;
	private String product_name;
	private String product_name_kana;
	private String price;
	private String image_file_name;
	private String release_company;
	private String product_description;
	private String errorMessage;
	private String dMessage;

	ArrayList<ProductInfoDTO> productInfoDTOList = new ArrayList<ProductInfoDTO>();
	ArrayList<ProductInfoDTO> productInfoIdList = new ArrayList<ProductInfoDTO>();



	@SuppressWarnings("unused")
	private String delete(String product_id) throws SQLException {

		String result = SUCCESS;

		System.out.println(product_id);

		int count = 0;

		ProductDeleteDAO dao = new ProductDeleteDAO();

		count += dao.productDelete(Integer.parseInt(product_id));

		if (count > 0) {
			this.dMessage = "削除できました。";
			return SUCCESS;
		}
		return result;
	}

	/**
	 * sessionを取得します。
	 * @return session
	 */
	public Map<String,Object> getSession() {
	    return session;
	}

	/**
	 * sessionを設定します。
	 * @param session session
	 */
	public void setSession(Map<String,Object> session) {
	    this.session = session;
	}

	/**
	 * idを取得します。
	 * @return id
	 */
	public String getId() {
	    return id;
	}

	/**
	 * idを設定します。
	 * @param id id
	 */
	public void setId(String id) {
	    this.id = id;
	}

	/**
	 * product_idを取得します。
	 * @return product_id
	 */
	public String getProduct_id() {
	    return product_id;
	}

	/**
	 * product_idを設定します。
	 * @param product_id product_id
	 */
	public void setProduct_id(String product_id) {
	    this.product_id = product_id;
	}

	/**
	 * product_nameを取得します。
	 * @return product_name
	 */
	public String getProduct_name() {
	    return product_name;
	}

	/**
	 * product_nameを設定します。
	 * @param product_name product_name
	 */
	public void setProduct_name(String product_name) {
	    this.product_name = product_name;
	}

	/**
	 * product_name_kanaを取得します。
	 * @return product_name_kana
	 */
	public String getProduct_name_kana() {
	    return product_name_kana;
	}

	/**
	 * product_name_kanaを設定します。
	 * @param product_name_kana product_name_kana
	 */
	public void setProduct_name_kana(String product_name_kana) {
	    this.product_name_kana = product_name_kana;
	}

	/**
	 * priceを取得します。
	 * @return price
	 */
	public String getPrice() {
	    return price;
	}

	/**
	 * priceを設定します。
	 * @param price price
	 */
	public void setPrice(String price) {
	    this.price = price;
	}

	/**
	 * image_file_nameを取得します。
	 * @return image_file_name
	 */
	public String getImage_file_name() {
	    return image_file_name;
	}

	/**
	 * image_file_nameを設定します。
	 * @param image_file_name image_file_name
	 */
	public void setImage_file_name(String image_file_name) {
	    this.image_file_name = image_file_name;
	}

	/**
	 * release_companyを取得します。
	 * @return release_company
	 */
	public String getRelease_company() {
	    return release_company;
	}

	/**
	 * release_companyを設定します。
	 * @param release_company release_company
	 */
	public void setRelease_company(String release_company) {
	    this.release_company = release_company;
	}

	/**
	 * product_descriptionを取得します。
	 * @return product_description
	 */
	public String getProduct_description() {
	    return product_description;
	}

	/**
	 * product_descriptionを設定します。
	 * @param product_description product_description
	 */
	public void setProduct_description(String product_description) {
	    this.product_description = product_description;
	}

	/**
	 * deleteFlgを取得します。
	 * @return deleteFlg
	 */

	/**
	 * errorMessageを取得します。
	 * @return errorMessage
	 */
	public String getErrorMessage() {
	    return errorMessage;
	}

	/**
	 * errorMessageを設定します。
	 * @param errorMessage errorMessage
	 */
	public void setErrorMessage(String errorMessage) {
	    this.errorMessage = errorMessage;
	}

	/**
	 * dMessageを取得します。
	 * @return dMessage
	 */
	public String getdMessage() {
	    return dMessage;
	}

	/**
	 * dMessageを設定します。
	 * @param dMessage dMessage
	 */
	public void setdMessage(String dMessage) {
	    this.dMessage = dMessage;
	}






	}



