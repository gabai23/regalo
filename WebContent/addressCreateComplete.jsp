<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" href="./css/style2.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/includeFooter.css">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<!-- <meta http-equiv="refresh" content="3;URL='BuyProductConfirmAction'"> -->
<title>宛先情報完了画面</title>
<style type="text/css">

body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing:1px;
	font-size:20px;
	color:white;
	font-family:'Cinzell',serif;
	}

.container {
	position:relative;
	width:40%;
	height:400px;
	background:black;
	margin-left:30%;
	margin-right:30%;
	}

.text {
	text-align: center;
	font-size:80px;
	padding-top: 70px;
	}

/* .button { */
/*  	position:relative; */
/*  	width:200px; */
/*  	text-align:center; */
/*  	margin:0 auto; */
/* 	margin-top:30px; */
/* 	margin-bottom:280px; */
/* 	} */

/* 	h4 { */
/* 	text-align: center; */
/* 	} */

	h5 {
	margin-top:85px;
	text-align: center;
	}


</style>
</head>
<body>
	<!-- ヘッダー -->
<!-- 	<div id="menu"> -->
		<jsp:include page="includeHeader.jsp"/>
<!-- 	</div> -->

 	<div id="main">

 	<s:form action="BuyProductConfirmAction">

 		<div id="title">ADDRESS</div>

 		<div class="container">
 			<div class="text">Completed!</div>


<!-- 			<h4>宛先情報が完了しました。</h4> -->

			<h5>3秒後に決済確認画面に移動します。</h5>

	<!-- 送信ボタン -->
<!-- 			<div class="button"> -->
<%-- 				<s:submit value="決済確認画面へ"/> --%>
<!-- 			</div> -->
		</div>
	</s:form>
</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>
