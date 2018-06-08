package com.internousdev.regalo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class GoHomeAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	private static final String MASTER = "master";

	public String execute() {

		String result = SUCCESS;

		//管理者がロゴを押下した場合
		if(session.containsKey("masterFlg")) {
			if((boolean)session.get("masterFlg")){

				result = MASTER;
				return result;
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


}
