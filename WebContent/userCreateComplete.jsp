<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>完了画面</title>
</head>
<body>
ユーザー登録が完了しました。
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>
<s:form action="GoHomeAction">
<s:submit value="ホーム画面へ"/>
</s:form>

<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>
</body>
</html>