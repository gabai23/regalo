<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style2.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />

<title>パスワード再設定確認画面</title>

<script>
function goGoPasswordResetAction(){
	document.getElementById("form").action="GoPasswordResetAction";
}

function goPasswordResetCompleteAction(){
	document.getElementById("form").action="PasswordResetCompleteAction";
}
</script>

<style type="text/css">

body {
	height:auto;
	clear:both;
	color:gray;
	}

.container {
	position:relative;
	width:40%;
	height:600px;
	background:black;
	margin-left : 30%;
	margin-right: 30%;
/* 	padding-top: 50px; */
	}

table {
	position: absolute;
	top:50%;
	left:50%;
	text-align:center;
/* 	color:gray; */
	clear:both;

 	-webkit-transform: translate(-50%,-50%);
 	-moz-transform: translate(-50%,-50%);
 	-ms-transform: translate(-50%,-50%);
	-o-transform: translate(-50%,-50%);
 	transform: translate(-50%,-50%);
	}

.reset {
	padding-top: 160px;
	}

.member_form_title {
	margin:20px;
	float:left;
	}

.register {
	margin: 20px;
	clear:both;
	}

.button1 {
	position:relative;
	text-align: center;
	width:200px;
	padding-top: 185px;
	}

/* .button2 { */
/* 	margin-top:10px; */
/* 	text-align: center; */
/* 	} */

</style>

</head>
<body>
	<!-- ヘッダー -->
<!-- 	<div id="menu"> -->
		<jsp:include page="includeHeader.jsp"/>
<!-- 	</div> -->

	<div id="main">

		<div id="title">PASSWORD RESET</div>

		<div class="container">

	<div class="reset" align="center">以下の内容でよろしいですか。</div>
	<br><br>
	<s:form action="GoPasswordResetAction" id="form">

	<table>

	<!-- ユーザーID -->
	<tr>
		<td><span class="member_form_title">ユーザーID</span></td>
		<td>
			<div class="register">
				<s:property value="userId" escape="false" />
			</div>
		</td>
	</tr>

	<!-- 現在のパスワード -->
	<tr>
		<td><span class="member_form_title">現在のパスワード</span></td>
		<td>
			<div class="register">
				<s:property value="passCon" escape="false" />
			</div>
		</td>
	</tr>

	<!-- 確認パスワード -->
	<tr>
		<td><span class="member_form_title">現在のパスワード</span></td>
		<td>
			<div class="register">
				<s:property value="passCon2" escape="false" />
			</div>
	</table>

	<!-- 送る -->
	<s:hidden name="userId" />
	<s:hidden name="password" />
	<s:hidden name="password1" />
	<s:hidden name="password2" />

<%-- 		<s:if test="userId==null">エラー<a href="<s:url action="HomeAction"/>">ホームに戻る</a> --%>
<%-- 		</s:if> --%>

		<s:else>
			<div class="button1">
				<s:submit value="訂正" onclick="goGoPasswordResetAction();"/>
<!-- 			</div> -->

<!-- 			<div class="button2"> -->
				<s:submit value="完了"  onclick="goPasswordResetCompleteAction();"/>
			</div>
		</s:else>
	</s:form>
	</div>
</div>
	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>
</body>
</html>

