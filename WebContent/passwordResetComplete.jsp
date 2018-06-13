<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" type="text/css" href="./css/includeFooter.css">
<link rel="stylesheet" href="./css/style.css">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<meta http-equiv="refresh" content="3;URL='HomeAction'">
<title>パスワード再設定完了画面</title>
<style type="text/css">

	body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing:1px;
	font-size:20px;
	color:black;
	}

	.button {
	position:relative;
	width:200px;
	text-align:center;
	margin:0 auto;
	margin-top:30px;
	margin-bottom:300px;
	}

	h3 {
	text-align: center;
	font-family:Verdana,Helvetica,sans-serif;
	}

</style>
</head>
<body>

	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<div id="main">

	<s:form action="GoHomeAction">


	<div id="container"></div>

	<h3>パスワード変更が完了しました。</h3>

	<h4>3秒後にホーム画面に移動します。</h4>

	<!-- 送信ボタン -->
	<div class="button">
		<s:submit value="ホーム画面へ" />
		</div>
	</s:form>
</div>

<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>