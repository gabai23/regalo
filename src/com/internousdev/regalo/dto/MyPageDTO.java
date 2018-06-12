package com.internousdev.regalo.dto;

public class MyPageDTO {

/*-------------------会員情報テーブル--------------------------*/

/*
 *  ユーザーID
 *	パスワード
 *	姓
 *	名
 *	姓かな
 *	名かな
 */

 	private String userId;
 	private String password;
	private String familyName;
	private String firstName;
 	private String familyNameKana;
 	private String firstNameKana;


/*
 *  性別
 *  メールアドレス
 *  登録日
 *  更新日
 */
	private boolean sex;
	private String email;
// 	private String regist_date;
// 	private String update_date;


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

	public boolean getSex() {
		return sex;
	}
	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

//	public String getRegist_date() {
//		return regist_date;
//	}
//	public void setRegist_date(String regist_date) {
//		this.regist_date = regist_date;
//	}
//
//	public String getUpdate_date() {
//		return update_date;
//	}
//	public void setUpdate_date(String update_date) {
//		this.update_date = update_date;
//	}

}
