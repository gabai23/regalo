package com.internousdev.regalo.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.regalo.dao.BuyProductHistoryDAO;
import com.internousdev.regalo.dto.BuyProductHistoryDTO;
import com.opensymphony.xwork2.ActionSupport;

public class GoBuyProductHistoryAction extends ActionSupport implements SessionAware{

	public Map<String, Object> session;

	private BuyProductHistoryDAO buyProductHistoryDAO = new BuyProductHistoryDAO();

	public ArrayList<BuyProductHistoryDTO> historyList	= new ArrayList<BuyProductHistoryDTO>();

	//削除フラグ
	private String deleteFlg;

	//削除メッセージ
	private String message;

	//個別削除ID取得
	private int id;

	//checkBoxの値
	private List<String> chooseList;






	//購入履歴取得
	public String execute() throws SQLException {



		//ログインしていなければログインに飛ばす
		if(!session.containsKey("userId")) {
			return ERROR;
		}

		String result = SUCCESS;

		//sessionからuserId取得
		String userId = (String) session.get("userId");

		if(deleteFlg == null) {

			//購入履歴表示
			historyList = buyProductHistoryDAO.getProductHistory(userId);

			Iterator<BuyProductHistoryDTO> iterator = historyList.iterator();

			if(!(iterator.hasNext())) {
				historyList = null;

			}

		} else if(deleteFlg.equals("1")) {

			//全て削除
			delete();

		} else if(deleteFlg.equals("2")) {

			//個別削除
			deleteOneEach(id);

			historyList = buyProductHistoryDAO.getProductHistory(userId);



		}


		return result;
	}

	//全件削除
	public void delete() throws SQLException {

		String user_id = session.get("userId").toString();

		int res = buyProductHistoryDAO.deleteHistory(user_id);

		if(res > 0) {
			historyList = null;
			setMessage("注文履歴を全て削除しました");

		}

	}

	//個別削除
	public void deleteOneEach(int id) throws SQLException {

		id = this.id;

		buyProductHistoryDAO.deleteOneEach(id);

	}


	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public BuyProductHistoryDAO getBuyProductHistoryDAO() {
		return buyProductHistoryDAO;
	}

	public void setBuyProductHistoryDAO(BuyProductHistoryDAO buyProductHistoryDAO) {
		this.buyProductHistoryDAO = buyProductHistoryDAO;
	}

	public ArrayList<BuyProductHistoryDTO> getHistoryList() {
		return historyList;
	}

	public void setHistoryList(ArrayList<BuyProductHistoryDTO> historyList) {
		this.historyList = historyList;
	}

	public String getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(String deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<String> getChooseList() {
		return chooseList;
	}

	public void setChooseList(List<String> chooseList) {
		this.chooseList = chooseList;
	}




}
