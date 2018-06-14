package com.internousdev.regalo.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CategoryDAO;
import com.internousdev.regalo.dto.CategoryDTO;
import com.opensymphony.xwork2.ActionSupport;

//一番初めに読み込むアクション
public class StartAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	private List<CategoryDTO> categoryList = new ArrayList<>();

	public String execute() {

		String result = SUCCESS;

		RandomStringUtils random = new RandomStringUtils();


		try {

			if(!(session.containsKey("tempUserId"))) {

				//ログインフラグ生成
				session.put("loginFlg", false);

				//ゲストユーザー用IDを生成
				@SuppressWarnings("static-access")
				String tempUserId = random.randomAlphabetic(10);
				session.put("tempUserId", tempUserId);

				System.out.println("StartAction-----");
				System.out.println(session.get("loginFlg").toString());
				System.out.println("tempUserId:" + tempUserId);
				System.out.println("-----StartAction");

				//ランク0からスタート
				session.put("rank", 0);

			}

			//カテゴリリストを取得
			CategoryDAO categoryDAO = new CategoryDAO();

			categoryList = categoryDAO.getCategoryList();

			session.put("categoryList", categoryList);

		} catch(Exception e) {
			e.printStackTrace();
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
