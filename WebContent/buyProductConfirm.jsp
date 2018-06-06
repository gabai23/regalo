<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buyItemConfirm画面</title>
</head>
<body>
<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<!-- 決済画面へ -->
<s:form action="BuyItemCompleteAction">
<s:submit value="決済画面"/>
</s:form>
<!-- 新規宛先登録画面へ -->
<s:form action="GoAddressCreateAction">
<s:submit value="新規宛先登録画面"/>
</s:form>

<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>