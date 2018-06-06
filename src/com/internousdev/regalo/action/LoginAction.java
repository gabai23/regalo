package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.LoginDAO;
import com.internousdev.regalo.dto.LoginDTO;
import com.internousdev.regalo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction  extends ActionSupport implements SessionAware{
	
	/*private categoryId;*/
	private String loginId;
	private String password;
	private LoginDTO loginDTO;
	private String errorMessage;
	private List<String> errorMessageList = new ArrayList<>();
	/*private boolean savedLoginId;*/
	
/*	private List<MCategoryDTO> mcategoryDtoList = new ArrayList<MCategoryDTO>();
	private List<String> loginIdErrorMessageList= new ArrayList<String>;
	private List<String> passwordErrorMesageList = new ArrayList<String>;*/
	
	private Map<String,Object> session;
	
	
	public String execute(){
		
		String result = ERROR;
		//daoのインスタンス化
		LoginDAO loginDAO = new LoginDAO();
		//inputcheckerのインスタンス化
		InputChecker checker = new InputChecker(); 
		
		boolean flg = false;
		
		if((!(loginId.equals(""))) && !(password.equals(""))) {
			
			errorMessageList = checker.check("ID", loginId, 1, 8, true, false, false, false, true, false, false);
			
			try {
				flg = loginDAO.existsUserId(loginId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(flg){
				loginDTO = loginDAO.userInfo(loginId);
				
				session.put("loginDTO", loginDTO);
				session.put("loginFlg", true);
				result = SUCCESS;
				
			} else {
				errorMessage = "入力されたパスワードが異なります。";
				
				errorMessageList.add(errorMessage);
				
			}
			
			
		} else if(loginId.equals("")){
			String errorMessageId = "IDを入力してください。";
			
			errorMessageList.add(errorMessageId);
			
		} else if(password.equals("")){
			String errorMessagePassword = "パスワードを入力してください。";
			
			errorMessageList.add(errorMessagePassword);
		}
		
		
		
		
		return result;
		
		
	}


	public String getLoginId() {
		return loginId;
	}


	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public LoginDTO getLoginDTO() {
		return loginDTO;
	}


	public void setLoginDTO(LoginDTO loginDTO) {
		this.loginDTO = loginDTO;
	}
		
		
}

