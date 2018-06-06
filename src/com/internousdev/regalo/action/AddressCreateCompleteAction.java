package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.AddressInfoDAO;
import com.internousdev.regalo.dto.AddressInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddressCreateCompleteAction extends ActionSupport implements SessionAware {

	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String zip11;
	private String addr11;
	private String telNumber;
	private String email;

	public Map<String,Object> session;

	public String execute() throws SQLException {

		String result = ERROR;

		AddressInfoDTO addressInfoDTO = new AddressInfoDTO();

		addressInfoDTO.setUserId(session.get("userId").toString());
		addressInfoDTO.setFamilyName(familyName);
		addressInfoDTO.setFirstName(firstName);
		addressInfoDTO.setFamilyNameKana(familyNameKana);
		addressInfoDTO.setFirstNameKana(firstNameKana);
		addressInfoDTO.setZip11(zip11);
		addressInfoDTO.setAddr11(addr11);
		addressInfoDTO.setTelNumber(telNumber);
		addressInfoDTO.setEmail(email);

		AddressInfoDAO addressInfoDAO = new AddressInfoDAO();
		if(addressInfoDAO.registerAddress(addressInfoDTO)) {

			result = SUCCESS;
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

	public String getZip11() {
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

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
