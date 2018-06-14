<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<!-- <meta http-equiv="refresh" content="3;URL='StartAction'"> -->
<title>商品購入画面</title>
<style type="text/css">

.moji-box{
	color:white;
		margin:0 auto;
	text-align:center;
	padding-top:50px;
	padding-bottom:25px;
	margin-left:2.5%;
	margin-right:2.5%;
	margin-bottom:25px;
/* 	font-size:20px; */
}

.moji1{
font-size:80px;
}



.moji2{
/* 	padding-top:50px; */
/* 	padding-bottom:25px; */
	margin-left:2.5%;
	margin-right:2.5%;
	margin-bottom:25px;
	font-size:20px;
}

</style>
</head>
<body>
<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<div id="main">
<div id=title>Purchase</div>
<div id="container">



<div class="moji-box">
<div class ="moji1">
<span>Thank you!</span><br></div>
<div class="moji2"><span>購入手続きが完了しました。</span></div>
<div class="moji2"><span>3秒後にHOME画面に移動します。</span><br></div>
</div>

</div></div>

<!-- フッダー -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>