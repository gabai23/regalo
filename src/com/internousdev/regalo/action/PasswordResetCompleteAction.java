package com.internousdev.regalo.action;

import java.sql.SQLException;

import com.internousdev.regalo.dao.PasswordResetCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class PasswordResetCompleteAction extends ActionSupport {

	private String userId;        //ユーザーID
	private String password1;     //パスワード
	private String password2;     //確認パスワード
	private String errorMessage;  //エラーメッセージ

	public String execute() throws SQLException {

		String result = ERROR;

		PasswordResetCompleteDAO dao = new PasswordResetCompleteDAO();

		int check = 0;

		check = dao.PasswordReset(password1,userId);

		if(check > 0) {
			result = SUCCESS;
		}

		return result;

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

}

