package com.internousdev.regalo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware{
	//Objectはいろいろ入るのよ。
	private Map<String,Object> session;

	//Logoutはsessionに保存してあるuserのIdを消して、loginFlgの判定をfalseにするだけ。
	//2018/06/07　圭一郎　完成間近。

	public String execute(){

		System.out.println("-----LogoutAction");

		//keyの指定してuserIdの削除。
		session.remove("userId");
		//loginしているかの判定はfalseの更新だけでよい。
		session.put("loginFlg", false);

		if(session.containsKey("masterFlg")) {
			session.put("masterFlg", false);
		}

		//home.jspに戻りまーす！
		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
