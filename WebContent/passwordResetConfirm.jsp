<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />

<title>PasswordResetConfirm画面</title>

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
	}

.form-text {
	text-align: center;
	}

.button1 {
	text-align: center;
	margin-bottom: 20px;
	}

.button2 {
	text-align: center;
	}

</style>

</head>
<body>
	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<div id="main">

		<div id="container"></div>

	<div class="reset" align="center">以下の内容でよろしいですか。</div>
	<br><br>
	<s:form action="GoPasswordResetAction" id="form">

		<div class="form-text">ユーザーID:
		<s:property value="userId" escape="false" /></div><br><br>

		<div class="form-text">パスワード:
		<s:property value="passCon1" escape="false" /></div><br><br>


		<div class="form-text">確認パスワード:
		<s:property value="passCon2" escape="false" /></div><br><br>



	<!-- 送る -->
	<s:hidden name="userId" />
	<s:hidden name="password1" />
	<s:hidden name="password2" />

	<s:if test="userId.equals('null')">エラー<a href="<s:url action="HomeAction"/>">ホームに戻る</a>
	</s:if>

	<s:else>
		<div class="button1">
			<s:submit value="訂正" onclick="goGoPasswordResetAction();"/>
		</div>

		<div class="button2">
			<s:submit value="送信"  onclick="goPasswordResetCompleteAction();"/>
		</div>
	</s:else>
	</s:form>
</div>
	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>
</body>
</html>

