<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<div id ="header"><div id ="pr">
</div>
</div>
<div id="main">
<div id="top">
<p>BuyItemComplete</p>
</div>
<p>購入手続きが完了しました。</p>
<a href='<s:url action="MyPageAction"/>'>マイページ</a><span>から購入履歴の確認が可能です。</span>
<p>Homeへ戻る場合はこちら<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>

<%-- <s:form action="GoHomeAction"><s:submit value = "進む"/> --%>
<%-- </s:form> --%>


</div>
<div id="footer">
<div id="pr">
</div>
</div>
</body>
</html>