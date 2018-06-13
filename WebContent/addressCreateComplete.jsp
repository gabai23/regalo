<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/includeFooter.css">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<meta http-equiv="refresh" content="3;URL='BuyProductConfirmAction'">
<title>宛先情報完了画面</title>
<style type="text/css">

.button {
 	position:relative;
 	width:200px;
 	text-align:center;
 	margin:0 auto;
	margin-top:30px;
	margin-bottom:280px;
	}

	h2 {
	text-align: center;
	}


</style>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

 		<div id="container"></div>

 	<div id="main">


 	<s:form action="BuyProductConfirmAction">


	<h2>宛先情報が完了しました。</h2>

	<h4>3秒後に決済確認画面に移動します。</h4>

	<!-- 送信ボタン -->
		<div class="button">
		<s:submit value="決済確認画面へ"/>
		</div>
	</s:form>
	</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
