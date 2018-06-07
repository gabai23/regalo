package com.internousdev.regalo.action;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ProductSearchAction extends ActionSupport implements SessionAware {


	private String searchWord;

	private String keyword;

	private String categoryId;

	private ItemSearchDAO itemSearchDAO = new ItemSearchDAO();

	private List







	public String execute(){
		return SUCCESS;
	}


}


