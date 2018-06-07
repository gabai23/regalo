<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/includeHeader.css">
</head>
<body>
	<div id="header">
		<!-- GoHomeActionつけろ -->
		<div id="headerLogo">
			<a href='<s:url action="GoHomeAction"/>'>Regolo</a>
		</div>

		<div id="headerSearch">
			<s:form action="ProductSearchAction" theme="simple">
				<select>
					<option>全てのカテゴリー</option>
					<option>カテゴリー1</option>
					<option>カテゴリー2</option>
					<option>カテゴリー3</option>
				</select>

				<s:textfield/>
				<button type="submit">検索</button>
			</s:form>
		</div>

		<s:if test="#session.loginFlg == false">
		<div id="headerLogin">
			<s:form action="GoLoginAction">
				<button type="submit">ログイン</button>
			</s:form>
		</div>
		</s:if>

		<s:if test="#session.loginFlg == true">
		<div id="headerLogout">
			<s:form action="LogoutAction">
				<button type="submit">ログアウト</button>
			</s:form>
		</div>
		</s:if>


		<div id="headerCart">
			<s:form action="GoCartAction">
				<button type="submit">カート</button>
			</s:form>
		</div>

		<div id="headerMypage">
			<s:form action="GoMyPageAction">
				<button type="submit">マイページ</button>
			</s:form>
		</div>
	</div>
</body>
</html>