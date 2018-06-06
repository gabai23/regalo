package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class AddressCreateConfirmAction extends ActionSupport implements SessionAware {

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private List<String> sexList = new ArrayList<String>();
	private String sex;


	private static final String MALE = "男性";
	private static final String FEMALE ="女性";
	private String defaultSexValue = MALE;
	private String email;
	private String telNumber;
	private String zip11;
	private String addr11;


	private List<String> familyNameErrorMessageList = new ArrayList<String>();
	private List<String> firstNameErrorMessageList = new ArrayList<String>();
	private List<String> familyNameKanaErrorMessageList = new ArrayList<String>();
	private List<String> firstNameKanaErrorMessageList = new ArrayList<String>();
	private List<String> emailErrorMessageList = new ArrayList<String>();
	private List<String> telNumberErrorMessageList = new ArrayList<String>();
	private List<String> zip11ErrorMessageList = new ArrayList<String>();
	private List<String> addr11ErrorMessageList = new ArrayList<String>();

	private String categoryId;
	private Map<String,Object> session;
	public String execute() {

		String result = ERROR;

		InputChecker inputChecker = new InputChecker();

		//フォームの入力内容をInputCheckerを使用しチェックする

		familyNameErrorMessageList = inputChecker.check("姓",familyName,1,16,true,true,true,false,false,false,true);
		firstNameErrorMessageList = inputChecker.check("名",firstName,1,16,true,true,true,false,false,false,true);
		familyNameKanaErrorMessageList = inputChecker.check("姓ふりがな",familyNameKana,1,16,false,false,true,false,false,false,false);
		firstNameKanaErrorMessageList = inputChecker.check("名ふりがな",firstNameKana,1,16,false,false,true,false,false,false,false);
		zip11ErrorMessageList = inputChecker.check("郵便番号",zip11,7,7,false,false,false,false,true,false,false);
		addr11ErrorMessageList = inputChecker.check("住所",addr11,15,50,false,true,true,true,true,true,true);
		telNumberErrorMessageList = inputChecker.check("電話番号",telNumber,10,13,false,false,false,true,false,false,false);
		emailErrorMessageList = inputChecker.check("メールアドレス",email,18,32,true,false,false,false,true,false,false);

		if(familyNameErrorMessageList.size()==0
		&& firstNameErrorMessageList.size()==0
		&& familyNameKanaErrorMessageList.size()==0
		&& firstNameKanaErrorMessageList.size()==0
		&& emailErrorMessageList.size()==0
		&& telNumberErrorMessageList.size()==0
		&& zip11ErrorMessageList.size()==0
		&& addr11ErrorMessageList.size()==0){

		result = SUCCESS;

		} else {
			session.put("familyNameErrorMessageList",familyNameErrorMessageList);
			session.put("firstNameErrorMessageList",firstNameErrorMessageList);
			session.put("familyNameKanaErrorMessageList",familyNameKanaErrorMessageList);
			session.put("firstNameKanaErrorMessageList",firstNameKanaErrorMessageList);
			session.put("emailErrorMessageList",emailErrorMessageList);
			session.put("telNumberErrorMessageList",telNumberErrorMessageList);
			session.put("zip11ErrorMessageList",zip11ErrorMessageList);
			session.put("addr11ErrorMessageList",addr11ErrorMessageList);

			result = ERROR;
		}
		sexList.add(MALE);
		sexList.add(FEMALE);

		return result;

	}

	public String getDefaultSexValue() {
		return defaultSexValue;
	}

	public void setDefaultSexValue(String defaultSexValue) {
		this.defaultSexValue = defaultSexValue;
	}

	public List<String> getSexList() {
		return sexList;
	}

	public void setSexList(List<String> sexList) {
		this.sexList = sexList;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void getTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String  getZip11() {
		return zip11;
	}

	public void setZip11(String zip11) {
		this.zip11 = zip11;
	}

	public String getAddr11() {
		return addr11;
	}

	public void setAddr11(String addr11) {
		this.addr11 = addr11;
	}

	public List<String> getFamilyNameErrorMessageList() {
		return familyNameErrorMessageList;
	}

	public void setFamilyNameErrorMessageList(List<String> familyNameErrorMessageList) {
		this.familyNameErrorMessageList = familyNameErrorMessageList;
	}

	public List<String> getFirstNameErrorMessageList() {
		return firstNameErrorMessageList;
	}

	public void setFirstNameErrorMessageList(List<String> firstNameErrorMessageList) {
		this.firstNameErrorMessageList = firstNameErrorMessageList;
	}

	public List<String> getFamilyNameKanaErrorMessageList() {
		return familyNameKanaErrorMessageList;
	}

	public void setFamilyNameKanaErrorMessageList(List<String> familyNameKanaErrorMessageList) {
		this.familyNameKanaErrorMessageList = familyNameKanaErrorMessageList;
	}

	public List<String> getFirstNameKanaErrorMessageList() {
		return firstNameKanaErrorMessageList;
	}

	public void setFirstNameKanaErrorMessageList(List<String> firstNameKanaErrorMessageList) {
		this.firstNameKanaErrorMessageList = firstNameKanaErrorMessageList;
	}

	public List<String> getEmailErrorMessageList() {
		return emailErrorMessageList;
	}

	public void setEmailErrorMessageList(List<String> emailErrorMessageList) {
		this.emailErrorMessageList = emailErrorMessageList;
	}

	public List<String> getTelNumberErrorMessageList() {
		return telNumberErrorMessageList;
	}

	public void setTelNumberErrorMessageList(List<String> telNumberErrorMessageList) {
		this.telNumberErrorMessageList = telNumberErrorMessageList;
	}

	public List<String> getZip11ErrorMessageList() {
		return zip11ErrorMessageList;
	}

	public void setZip11ErrorMessageList(List<String> zip11ErrorMessageList) {
		this.zip11ErrorMessageList = zip11ErrorMessageList;
	}

	public List<String> getAddr11ErrorMessageList() {
		return addr11ErrorMessageList;
	}

	public void setAddr11ErrorMessageList(List<String> addr11ErrorMessageList) {
		this.addr11ErrorMessageList = addr11ErrorMessageList;
	}

	public Map<String,Object> getSession() {
		return session;
	}

	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
}



























