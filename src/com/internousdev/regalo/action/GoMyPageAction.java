package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.MyPageDAO;
import com.internousdev.regalo.dto.MyPageDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoMyPageAction extends ActionSupport implements SessionAware{

		private String userId;

		private Map<String, Object> session;

		private ArrayList<MyPageDTO> myPageList = new ArrayList<MyPageDTO>();

		private String message;


	public String execute() {


		if (!(session.containsKey("user_id"))) {

			setMessage("ログインしてください");

		}
		String result = ERROR;

		if ( session.containsKey("user_Id")) {
			userId = session.get("user_Id").toString();

			MyPageDAO dao = new MyPageDAO();


			myPageList = dao.getUserInfo(userId);

			if (myPageList.size() > 0) {
				result = SUCCESS;
			}
		}


		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

	public ArrayList<MyPageDTO> getMyPageList() {
		return myPageList;
	}
	public void setMyPageList(ArrayList<MyPageDTO> myPageList) {
		this.myPageList = myPageList;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}
