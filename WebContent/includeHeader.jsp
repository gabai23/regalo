<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/includeHeader.css">
<link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">
</head>
<body>
	<div id="header">
		<!-- GoHomeActionつけろ -->
		<div id="headerLogo"><div class=aaa">
			<a class="headerA" href='<s:url action="GoHomeAction"/>'>Regalo</a></div>
		</div>

		<div class="right-list">
		<ul >
		<div id="liContainer" class="clearfix">
		<li><div id="headerLogin">
			<s:form action="GoLoginAction">
				<button class="button1" type="submit">LOGIN</button>
			</s:form>
		</div></li>
		<li><div id="headerLogout">
			<s:form action="LogoutAction">
				<button class="button1" type="submit">LOGOUT</button>
			</s:form>
		</div></li>

		<li><div id="headerCart">
			<s:form action="GoCartAction">
				<button class="button1" type="submit">CART</button>
			</s:form>
		</div></li>

		<li><div id="headerMypage">
			<s:form action="GoMyPageAction">
				<button class="button1" type="submit">MY PAGE</button>
			</s:form></div></li></div></ul>
			</div><br>
		<div id="headerSearch">
			<s:form action="ProductSearchAction" theme="simple">
				<select name="categoryId">
					<option value=1>ALL  ITEM</option>
					<option value=2>FOOD</option>
					<option value=3>WINE</option>
					<option value=4>ACCESSORIES</option>
					<option value=5>WATCH</option>
				</select>
				<s:textfield name="searchWord"/>
				<button  class="button1" type="submit">SEARCH</button>
			</s:form></div></div>
</body>
</html>