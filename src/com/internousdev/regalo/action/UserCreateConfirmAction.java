package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.UserCreateConfirmDAO;
import com.internousdev.regalo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class UserCreateConfirmAction extends ActionSupport implements SessionAware {

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String userId;
	private String password;
// 0:男性、1:女性

	private String sex;
	private String email;

	private ArrayList<String> errorMessageList = new ArrayList<>();
	private Map<String, Object> session;


//	メソッド
	public String execute() throws SQLException {
		String result = SUCCESS;
		UserCreateConfirmDAO dao = new UserCreateConfirmDAO();

		InputChecker i = new InputChecker();
		i.check(propertyName,value,minLength,maxLength,halfAlphabet,kanji,hiragana,katakana,halfNumber,halfSymbol,fullSymbol);



		return result;
	}
}