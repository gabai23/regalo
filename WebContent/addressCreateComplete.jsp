<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/includeFooter.css">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
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

 	<s:form action="BuyProductConfirmAction">

	<h2>宛先情報が完了しました。</h2>

	<!-- 送信ボタン -->
		<div class="button">
		<s:submit value="決済確認画面へ"/>
		</div>
	</s:form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
