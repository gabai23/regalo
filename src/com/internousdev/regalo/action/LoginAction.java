package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.CartDAO;
import com.internousdev.regalo.dao.LoginDAO;
import com.internousdev.regalo.dto.LoginDTO;
import com.internousdev.regalo.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction  extends ActionSupport implements SessionAware{

	private static final String SETTLEMENT = "settlement";
	/*private categoryId;*/
	private String loginId;
	private String password;
	private LoginDTO loginDTO;
	private String errorMessage;
	private String errorMessageId;
	private String errorMessagePassword;
	//エラーメッセージをリストにドボン！↑の3つのerrorMessageたちをどんどんいれていく！
	private List<String> errorMessageList = new ArrayList<>();
	//ログインしているかの判定！
	private boolean saveLogin;

	private Map<String,Object> session;


	public String execute(){

		String result = ERROR;
		//daoのインスタンス化
		LoginDAO loginDAO = new LoginDAO();
		//inputcheckerのインスタンス化
		InputChecker checker = new InputChecker();
		//booleanで変数化
		boolean flg = false;

		System.out.println("LoginAction-----");
		//ID　passどっちも入力
		if((!(loginId.equals(""))) && !(password.equals(""))) {
			System.out.println("入力されてまーす");

			/*入力した情報のチェック(inputチェック)
			Listにどんどんいれていく*/
			errorMessageList = checker.check("ID", loginId, 1, 8, true, false, false, false, true, false, false);
			errorMessageList = checker.check("パスワード", password, 1, 16, true, false, false, false, true, false, false);

			try {//loginIdがあるかないかの判断
				flg = loginDAO.existsUserId(loginId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//↑のflgにはtrue or falseが入ってるのよ！


			if(flg){
				loginDTO = loginDAO.userInfo(loginId);//入力したIDよん。ctrl + クリックでメソッドへ飛ぶ

				session.put("loginDTO", loginDTO);//DTOの情報の格納
				session.put("loginFlg", true);//ログインしているかの確認（二択）
				session.put("userId", loginId);//userIdにloginIdの保持
				session.put("saveLogin", loginId);//saveLoginの方が、データの指定がしやすいね。

				/*みんながログイン成功しているかどうかをコンソールで確認するための記入。
				別になくてもいいが、やったほうが、みんながわかりやすい処置。圭一郎ならやるべきだね*/
				System.out.println("loginFlg:"+session.get("loginFlg").toString());
				System.out.println("ログイン成功！");
				result = SUCCESS;


			} else {
				errorMessage = "入力されたパスワードが異なります。";

				errorMessageList.add(errorMessage);

			}


		}
		if(loginId.equals("")){
			errorMessageId = "IDを入力してください。";
			//ここもコンソールに出すため→確認作業な
			System.out.println(errorMessageId);

			errorMessageList.add(errorMessageId);

		}
		if(password.equals("")){
			errorMessagePassword = "パスワードを入力してください。";
			//ここもコンソールに出すため→確認作業な
			System.out.println(errorMessagePassword);

			errorMessageList.add(errorMessagePassword);
		}

		//ここは、ちゃんとこのファイルが実行しているかの確認のためのコード
		System.out.println("-----LoginAction");

		CartDAO cartDAO = new CartDAO();
		if(cartDAO.isExistsCart(session.get("tempUserId").toString())){

			cartDAO.linkToLoginId(session.get("tempUserId").toString(),loginId);

		}

		if((boolean)session.get("settlement")){

			result = SETTLEMENT;

			session.put("settlement",false);
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


	public String getErrorMessage() {
		return errorMessage;
	}


	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}


	public List<String> getErrorMessageList() {
		return errorMessageList;
	}


	public void setErrorMessageList(List<String> errorMessageList) {
		this.errorMessageList = errorMessageList;
	}


	public String getErrorMessageId() {
		return errorMessageId;
	}


	public void setErrorMessageId(String errorMessageId) {
		this.errorMessageId = errorMessageId;
	}


	public String getErrorMessagePassword() {
		return errorMessagePassword;
	}


	public void setErrorMessagePassword(String errorMessagePassword) {
		this.errorMessagePassword = errorMessagePassword;
	}


	public boolean isSaveLogin() {
		return saveLogin;
	}


	public void setSaveLogin(boolean saveLogin) {
		this.saveLogin = saveLogin;
	}


}

