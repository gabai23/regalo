package com.internousdev.regalo.action;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
public class BuyItemCompleteAction extends ActionSupport {
	public Map<String,Object>session;
public String execute() {
	return SUCCESS;
}
}
