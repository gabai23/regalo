package com.internousdev.regalo.action;

import java.sql.SQLException;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ItemInsertCompleteAction extends ActionSupport implements SessionAware{

	public String execute() throws SQLException{

		String result = SUCCESS;

		return result;

	}

}
