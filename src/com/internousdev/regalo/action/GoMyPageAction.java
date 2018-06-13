package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.MyPageDAO;
import com.internousdev.regalo.dto.MyPageDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoMyPageAction extends ActionSupport implements SessionAware{

//		ユーザーID格納
		private String userId;

//		ログイン情報を格納
		private Map<String, Object> session;

//		マイページ情報格納DTO
		private ArrayList<MyPageDTO> myPageList = new ArrayList<MyPageDTO>();

//		エラーメッセジ
		private String message;


	public String execute() {
		System.out.println();
		String result = ERROR;

/*---------------セッション情報取得---------------------*/
		if (!(session.containsKey("userId"))) {

			result = ERROR;

		}




/*----------------ユーザー情報取得----------------------*/
		if ( session.containsKey("userId")) {
			userId = session.get("userId").toString();

			MyPageDAO dao = new MyPageDAO();

/*---------------------------------------------------------
    ユーザー情報をリストで受け取り
    リストにデータが入っていたらSUCCESS
---------------------------------------------------------- */
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
