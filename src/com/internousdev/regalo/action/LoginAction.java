package com.internousdev.regalo.action;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction  extends ActionSupport implements SessionAware{
	
	private categoryId;
	private String loginId;
	private String password;
	private boolean savedLoginId;
	
	private List<MCategoryDTO> mcategoryDtoList = new ArrayList<MCategoryDTO>();
	private List<String> loginIdErrorMessageList= new ArrayList<String>;
	private List<String> passwordErrorMesageList = new ArrayList<String>;
	
	private Map<String,Object> session;
	private Map<String,Object> session;
	
	public String execute(){
		
		Stirng result = ERROR;
		
		if(savedLoginId == true){
			session.put("savedLoginId",true);
			session.put("loginId",loginId);
		}else{
			session.put("savedLoginId",false);
			session.remove("loginId",loginId);
		}
		//ここはなかさんが作成済み。
		InputChecker inputChecker = new InputChecker();
		
		loginIdErrorMessageList = inputChecker.doCheck();//引数はあとで
		passwordErrorMessageList = inoutChecker.doCheck();//引数はあとで
		
		//errorが１つでもあれば
		if(loginIdErrorMessageList.size()!=0
			&&passwordErrorMessageList.size()!=0){
			session.put("loginIdErrorMessageList",loginErrorMessageList);
			session.put("passowordErrorMessageList", passowordErrorMessageList);
			session.put("logined",0);
		}
		
		if(!session.containskey("mCategoryList")){
			McategoryDAO mcDao = new McategoryDAO();
			mCategoryDtoList = mcDao.getgetMcategoryList();
			session.put("mCategoryDtoList",mCategoryDtoList);
		}
		//	zyunちゃんのインスタンス化→じゅんちゃんを待つ。
		UserInfoDAO userInfoDao = new UserInfoDao();
		if(userInfoDao.isExistsUserInfo(loginId,passoword)){
			UserInfoDTO userInfoDTO = userInfoDao.getUserInfo(loginId,password);
			session.put("loginId",userInfoDTO.getUserId());
			
			int count = 0;
			//かまっちゃんのクラスのインスタンス化
			CartDAO cartDao = new CartDAO();
			
			
			
		}
		
		
		
	}
}
