package com.internousdev.regalo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

	/*2018/06/08　午前　圭一郎*/

public class GoLoginAction extends ActionSupport implements SessionAware{
	
	//session
	private Map<String,Object> session;
	//ログインしているかの判定
	private boolean loginFlg;
	//ログインページにレッツゴー！
	public String execute(){
		
		String result = ERROR;
		
		if(session.containsKey("loginFlg")){
			
			loginFlg = (boolean) session.get("loginFlg");
			//ログインしていなければ
			if(loginFlg != true){
				//ログイン画面に飛ぶ！
				result= ERROR;
			
			/*既にログイン済み↓
			商品購入画面に飛ぶどー！*/
			}else{
				
				result = SUCCESS;
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
