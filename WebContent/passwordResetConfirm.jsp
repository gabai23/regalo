<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />

<title>パスワード再設定確認画面</title>

<script>
function gogoGoPasswordResetAction(){
	document.getElementById("form").action="GoPasswordResetAction";
}

function goPasswordResetCompleteAction(){
	document.getElementById("form").action="PasswordResetCompleteAction";
}
</script>

<style type="text/css">

body {
	height:auto;
	color:white;
	}

table {
	position: absolute;

	top:50%;
	left:50%;

	-webkit-transform: translate(-50%,-50%);
	-moz-transform: translate(-50%,-50%);
	-ms-transform: translate(-50%,-50%);
	-o-transform: translate(-50%,-50%);
	transform: translate(-50%,-50%);
	color:white;
	clear:both;
	}

.member_form_title {
	float:left;
	}

.button1 {
	text-align: center;
	margin-top: 200px;
	}

.button2 {
	margin-top:10px;
	text-align: center;
	}

</style>

</head>
<body>
	<!-- ヘッダー -->
	<div id="menu">
		<jsp:include page="includeHeader.jsp"/>
	</div>

	<div id="main">

		<div id="title">PASSWORD RESET</div>

		<div id="container">

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

