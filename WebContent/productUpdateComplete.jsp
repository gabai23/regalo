<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/ProductUpdate.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="refresh" content="3;URL='StartAction'">
<title>Insert title here</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>
<div id="main">
<div id="title">
ProductUpdate</div>
<div id="container">
<div class="moji">
<h2>商品情報を変更しました。</h2>
<h3>3秒後にホームへ移動します。</h3>




		<a href='<s:url action="GoMasterAction"/>'>管理者ページ</a>
		</div>

</div></div>
	<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>

</body>
</html>