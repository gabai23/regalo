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
<!-- <meta http-equiv="refresh" content="3;URL='StartAction'"> -->
<title>商品情報入力完了</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>
<div id="main">
<div id="title">
ProductUpdate</div>
<div id="container">
<div class="moji-box">
<div class="moji">
<span>商品情報を変更しました。</span><br></div>
<div class="moji">
<a href='<s:url action="GoMasterAction"/>'>管理者ページ</a><br></div>
<div class="moji">
<span>3秒後にホームへ移動します。</span><br></div>





		</div>

</div></div>
	<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>

</body>
</html>