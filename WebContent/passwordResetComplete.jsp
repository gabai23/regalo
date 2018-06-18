<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" type="text/css" href="./css/includeFooter.css">
<link rel="stylesheet" href="./css/style2.css">
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<!-- <meta http-equiv="refresh" content="3;URL='GoHomeAction'"> -->
<title>パスワード再設定完了画面</title>
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
	padding-top: 75px;
	}

/* .button { */
/* 	position:relative; */
/* 	width:200px; */
/* 	text-align:center; */
/* 	margin:0 auto; */
/* 	margin-top:30px; */
/* 	margin-bottom:300px; */
/* 	} */

/* h4 { */
/* 	text-align: center; */
/* 	font-family:Verdana,Helvetica,sans-serif; */
/* 	color:white; */
/* 	} */

h5 {
	margin-top:85px;
/* 	font-color:white; */
	text-align: center;
/* 	color:white; */
	}

</style>
</head>
<body>
<!-- ヘッダー -->
<!-- <div id="menu"> -->
	<jsp:include page="includeHeader.jsp"/>
<!-- </div> -->

<div id="main">
	<div id="title">PASSWORD RESET</div>

<div class="container">

			<s:form action="GoHomeAction">

		<div class="text">Completed!</div>


<!-- 			<h4>パスワード変更が完了しました。</h4> -->

			<h5>3秒後にホーム画面に移動します。</h5>

		</s:form>
	</div>
</div>
	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>