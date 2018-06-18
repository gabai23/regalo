package com.internousdev.regalo.action;

import java.sql.SQLException;

public class GoProductInsertAction{

	public String execute() throws SQLException{

		System.out.println("インサート画面へGO");

		return "success";

	}

}