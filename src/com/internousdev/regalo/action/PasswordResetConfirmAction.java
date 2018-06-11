package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.regalo.dao.PasswordResetCompleteDAO;
import com.internousdev.regalo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class PasswordResetConfirmAction extends ActionSupport {

	private String userId = "";      //ユーザーID
	private String password1;   //パスワード
	private String password2;   //確認パスワード

	private String passCon1;    //パスワードを*で暗号化（パスワード）
	private String passCon2;    //パスワードを*で暗号化（確認パスワード）

	private String errorId = "";        //IDエラー
	private String errorPass = "";      //パスワードエラー
	private String errorRePass = "";    //確認用パスワードエラー
	private String errorMessagePassword = "";   //エラーメッセージパスワード
	private String errorMessageId = "";   //エラーメッセージID

	int i;

	public List<String> ErrorUserIdList = new ArrayList<String>();
	public List<String> ErrorPasswordList1 = new ArrayList<String>();
	public List<String> ErrorReconfirmPassList = new ArrayList<String>();

	public String execute() {

		System.out.println("userId"+userId);

		String result = ERROR;
		InputChecker inputChecker = new InputChecker();

		//フォームの入力内容をInputCheckerを使用しチェックする

		ErrorUserIdList = inputChecker.check("ユーザーID",userId,1,8,true,false,false,true,false,false,false);
		ErrorPasswordList1 = inputChecker.check("パスワード",password1,1,16,true,false,false,true,false,false,false);
		ErrorReconfirmPassList = inputChecker.check("確認用パスワード",password2,1,16,true,false,false,true,false,false,false);

		if(
				ErrorUserIdList.size() == 0 &&
				ErrorReconfirmPassList.size() ==0

				){

			result = SUCCESS;

		} else {

			for(i=0; i < ErrorUserIdList.size(); i++) {
				errorId = errorId + ErrorUserIdList.get(i);
			}

			for(i=0; i < ErrorPasswordList1.size(); i++) {
				errorPass = errorPass + ErrorPasswordList1.get(i);
			}

			for(i=0; i < ErrorReconfirmPassList.size(); i++) {
				errorRePass = errorRePass + ErrorReconfirmPassList.get(i);
			}

		}

		passCon1 = "";
		if(password1.length() > 0) {
			for(int i = 0; i < password1.length(); i++) {
				passCon1 += "*";
			}
		}

		passCon2 = "";
		if(password2.length() > 0) {
			for(int i = 0; i < password2.length(); i++) {
				passCon2 += "*";
			}
		}


		//パスワードと確認パスワードが入力されていて一致しなかったらエラーメッセージを出す

		if(!(password1.equals(password2))) {
			errorMessagePassword += "入力されたパスワードが異なります。";
			result = ERROR;
		}

//		if(!(password1.equals("") && password2.equals(""))) {
//		}


		if((userId != "") && (password1 != "")){

			PasswordResetCompleteDAO dao = new PasswordResetCompleteDAO();
			boolean check = dao.passwordConfirm(userId);


			//ユーザーIDが正しくなかったらエラーメッセージを出す
			if(!check) {
				errorMessageId += "ログインIDが異なります。";
				result = ERROR;
			}
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

	public String getPassCon1() {
		return passCon1;
	}

	public void setPassCon1(String passCon1) {
		this.passCon1 = passCon1;
	}

	public String getPassCon2() {
		return passCon2;
	}

	public void setPassCon2(String passCon2) {
		this.passCon2 = passCon2;
	}

	public String getErrorId() {
		return errorId;
	}

	public void setErrorId(String errorId) {
		this.errorId = errorId;
	}

	public String getErrorPass() {
		return errorPass;
	}

	public void setErrorPass(String errorPass) {
		this.errorPass = errorPass;
	}

	public String getErrorRePass() {
		return errorRePass;
	}

	public void setErrorRePass(String errorRePass) {
		this.errorRePass = errorRePass;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public List<String> getErrorUserIdList() {
		return ErrorUserIdList;
	}

	public void setErrorUserIdList(List<String> errorUserIdList) {
		ErrorUserIdList = errorUserIdList;
	}

	public List<String> getErrorPasswordList1() {
		return ErrorPasswordList1;
	}

	public void setErrorPasswordList1(List<String> errorPasswordList1) {
		ErrorPasswordList1 = errorPasswordList1;
	}

	public List<String> getErrorReconfirmPassList() {
		return ErrorReconfirmPassList;
	}

	public void setErrorReconfirmPassList(List<String> errorReconfirmPassList) {
		ErrorReconfirmPassList = errorReconfirmPassList;
	}

	public String getErrorMessagePassword() {
		return errorMessagePassword;
	}

	public void setErrorMessagePassword(String errorMessagePassword) {
		this.errorMessagePassword = errorMessagePassword;
	}

	public String getErrorMessageId() {
		return errorMessageId;
	}

	public void setErrorMessageId(String errorMessageId) {
		this.errorMessageId = errorMessageId;
	}


}
