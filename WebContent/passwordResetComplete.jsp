<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>PasswordResetComplete画面</title>
</head>
<body>
	<s:form action="BuyProductConfirmAction">

	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<h3>パスワード変更が完了しました。</h3>

	<!-- 送信ボタン -->
		<s:submit value="決済確認画面へ"/>
	</s:form>

<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
