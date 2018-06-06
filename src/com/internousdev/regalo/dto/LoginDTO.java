package com.internousdev.regalo.dto;

public class LoginDTO {
	
	//圭一郎　2018/06/05　ログイン認証DTO→DAOに行く前にdistractして格納
	
	private int id;
	private String userId;
	private String password;
	private String familyName;
	private String firstName;
	private String familyNameKane;
	private int sex;
	private String email;
	private String status;
	private int logined
	private Date registDate;
	private Date updateDate;
	
	//getter setterの設定　圭一郎は諦めない
	public int getInt(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	
	public String getUserId(){
		return userId;
	}
	public void setUserId(String userId){
		this.userId = userId;
    }
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getFamilyName(){
		return familyName;
	}
	public void setFamilyName(String familyName){
		this.familyName = familyName;
	}
	public String getFirstName(){
		return firstName;
	}
	public void setFirstName(String firstName){
		this.firstName= firstName;
	}
	public int getSex(){
		return sex;
	}
	public void setSex(int sex){
		this.sex = sex;
	}
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status= status;
	}
	public int getLogined(){
		return logined;
	}
	public void setLogined(int logined){
		this.logined = logined;
	}
	public Date getRegistDate(){
		return registDate;
	}
	public void setResistDate(String resistDate){
		this.registDate = registDate;
    }
	
	public Date getUpdateDate(){
		return updateDate;
	}
}
