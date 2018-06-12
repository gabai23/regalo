package com.internousdev.regalo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;


public class GoLoginAction extends ActionSupport implements SessionAware{

	//session
	private Map<String,Object> session;
	
	private boolean loginFlg;
	
	public String execute(){
		//エラー→home サクセス→ログイン画面
		String result = ERROR;

		if(session.containsKey("loginFlg")){
			
			loginFlg = (boolean) session.get("loginFlg");

			//ログインしていなければ
			if(loginFlg != true){
				
				result= SUCCESS;


			}else{


			}
		}


		return result;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public boolean isLoginFlg() {
		return loginFlg;
	}
	public void setLoginFlg(boolean loginFlg) {
		this.loginFlg = loginFlg;
	}


}
