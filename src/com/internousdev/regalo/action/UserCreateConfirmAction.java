package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

	private List<String> familyNameErorMessageList = new ArrayList<>();
	private List<String> firstNameErorMessageList = new ArrayList<>();
	private List<String> familyNameKanaErorMessageList = new ArrayList<>();
	private List<String> firstNameKanaErorMessageList = new ArrayList<>();
	private List<String> userIdErorMessageList = new ArrayList<>();
	private List<String> passwordErorMessageList = new ArrayList<>();
	private List<String> emailErorMessageList = new ArrayList<>();

	private Map<String, Object> session;


//	メソッド
	public String execute() throws SQLException {
		String result = ERROR;
		UserCreateConfirmDAO dao = new UserCreateConfirmDAO();


		InputChecker i = new InputChecker();

		/* 以下booleanは使いたい文字型をtrueにする
		 * halfAlphabet：半角英字
		 * kanji：漢字
		 * hiragana：ひらがな
		 * katakana：カタカナ
		 * halfNumber：半角数字
		 * halfSymbol：半角記号
		 * fullSymbol：全角記号
		*errorList（任意のList） = check(ユーザーID, userId, 1, 8, true, false, false, false, true, false, false);
		*/

		System.out.println(familyName);

		familyNameErorMessageList = i.check("姓",familyName,1,16,true,true,true,false,false,false,false);
		firstNameErorMessageList = i.check("名", firstName, 1, 16, true, true, true, false, false, false, false);
		familyNameKanaErorMessageList= i.check("姓ふりがな", familyNameKana, 1, 16, false, false, true, false, false, false, false);
		firstNameKanaErorMessageList= i.check("名ふりがな", firstNameKana, 1, 16, false, false, true, false, false, false, false);
		userIdErorMessageList= i.check("ログインID", userId, 1, 8, true, false, false, false, false, false, false);
		passwordErorMessageList= i.check("パスワード", password, 1, 16, true, false, false, false, false, false, false);
		emailErorMessageList= i.check("メールアドレス", email, 14, 32, true, false, false, false, false, true, false);


//		エラー確認
		System.out.println(familyNameErorMessageList.size());
//        System.out.println(String.valueOf(familyNameErorMessageList.get(0)));

        System.out.println(firstNameErorMessageList.size());
//        System.out.println(String.valueOf(firstNameErorMessageList.get(0)));

        System.out.println(familyNameKanaErorMessageList.size());
//        System.out.println(String.valueOf(familyNameKanaErorMessageList.get(0)));

        System.out.println(firstNameKanaErorMessageList.size());
//        System.out.println(String.valueOf(firstNameKanaErorMessageList.get(0)));

        System.out.println(userIdErorMessageList.size());
//        System.out.println(String.valueOf(userIdErorMessageList.get(0)));

        System.out.println(passwordErorMessageList.size());
//        System.out.println(String.valueOf(passwordErorMessageList.get(0)));

        System.out.println(emailErorMessageList.size());
//        System.out.println(String.valueOf(emailErorMessageList.get(0)));

		if(familyNameErorMessageList.size()==0
		&& firstNameErorMessageList.size()==0
		&& familyNameKanaErorMessageList.size()==0
		&& firstNameKanaErorMessageList.size()==0
		&& userIdErorMessageList.size()==0
		&& passwordErorMessageList.size()==0
		&& emailErorMessageList.size()==0){
			result = SUCCESS;
			return result;
		}



		return result;
	}


	public String getFamilyName() {
		return familyName;
	}


	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getFamilyNameKana() {
		return familyNameKana;
	}


	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}


	public String getFirstNameKana() {
		return firstNameKana;
	}


	public void setFirstNameKana(String firstNameKana) {
		this.firstNameKana = firstNameKana;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public List<String> getFamilyNameErorMessageList() {
		return familyNameErorMessageList;
	}


	public void setFamilyNameErorMessageList(List<String> familyNameErorMessageList) {
		this.familyNameErorMessageList = familyNameErorMessageList;
	}


	public List<String> getFirstNameErorMessageList() {
		return firstNameErorMessageList;
	}


	public void setFirstNameErorMessageList(List<String> firstNameErorMessageList) {
		this.firstNameErorMessageList = firstNameErorMessageList;
	}


	public List<String> getFamilyNameKanaErorMessageList() {
		return familyNameKanaErorMessageList;
	}


	public void setFamilyNameKanaErorMessageList(List<String> familyNameKanaErorMessageList) {
		this.familyNameKanaErorMessageList = familyNameKanaErorMessageList;
	}


	public List<String> getFirstNameKanaErorMessageList() {
		return firstNameKanaErorMessageList;
	}


	public void setFirstNameKanaErorMessageList(List<String> firstNameKanaErorMessageList) {
		this.firstNameKanaErorMessageList = firstNameKanaErorMessageList;
	}


	public List<String> getUserIdErorMessageList() {
		return userIdErorMessageList;
	}


	public void setUserIdErorMessageList(List<String> userIdErorMessageList) {
		this.userIdErorMessageList = userIdErorMessageList;
	}


	public List<String> getPasswordErorMessageList() {
		return passwordErorMessageList;
	}


	public void setPasswordErorMessageList(List<String> passwordErorMessageList) {
		this.passwordErorMessageList = passwordErorMessageList;
	}


	public List<String> getEmailErorMessageList() {
		return emailErorMessageList;
	}


	public void setEmailErorMessageList(List<String> emailErorMessageList) {
		this.emailErorMessageList = emailErorMessageList;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



}