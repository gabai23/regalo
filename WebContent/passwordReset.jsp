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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- 半角英数字入力のアラートを出す -->
<script type="text/javascript">
	function checkForm($this) {
		var str = $this.value;
		if (str.match(/[^A-Z^a-z0-9]+/)) {
			alert('半角英数で入力してください');
			$this.value = "";
		}
	}
</script>

<title>PasswordReset画面</title>
<style type="text/css">

body {
	height:auto;
	}

.main{
	height:auto;
	}

.button-layout{
	margin-left: 10px;
	margin-right: 10px;
	text-align:center;
	}

/* .box{ */
/* 	text-align: center; */
/* 	} */

.button {
	text-align: center;
	margin-top: 120px;
	}

table {
	text-align: center;
	}


</style>
</head>
<body>
	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<div class="main">

	<s:form action="PasswordResetConfirmAction" theme="simple">

	<div class="box">
	<!-- ユーザーID -->


		<div class="form-text">ユーザーID</div>
		<s:textfield name="userId" size="8"  placeholder="半角英数字"/><br><br>
		<s:if test="!(errorId.equals(''))">
			<s:property value="errorId"/>
		</s:if>
		<s:elseif test="!errorMessageId.isEmpty()">
			<s:property value="errorMessageId"/>
		</s:elseif>
		<s:if test="ErrorUserIdList.length > 0">
			<s:iterator value="ErrorUserIdList">
				<s:property />
			</s:iterator>
		</s:if>

	<!-- パスワード -->

		<div class="form-text">パスワード</div>
		<s:textfield name="password1" size="8" placeholder="半角英数字"/><br><br>
<%-- 		<s:if test="!(errorPass.equals(''))"> --%>
<%-- 		<s:property value="errorPass"/> --%>
<%-- 		</s:if> --%>
		<s:if test="!ErrorPasswordList1.isEmpty()">
			<s:iterator value="ErrorPasswordList1">
				<s:property />
			</s:iterator>
		</s:if>


	<!-- 確認パスワード -->

		<div class="form-text">確認パスワード</div>
		<s:textfield name="password2" size="8" placeholder="半角英数字"/><br><br>
<%-- 		<s:if test="!(errorRePass.equals(''))"> --%>
<%-- 			<s:property value="errorRePass"/> --%>
<%-- 		</s:if> --%>



		<s:if test="!(password1.equals(password2))">
		<s:property value="errorMessagePassword"/>
		</s:if>
		<s:if test="ErrorReconfirmPassList.size()>0">
			<s:iterator value="ErrorReconfirmPassList">
				<s:property />
			</s:iterator>
		</s:if>


	</div>

	<!-- 送信ボタン -->
	<div class="button">
		<s:submit value="パスワード再設定画面へ"/>
	</div>
		</s:form>

	</div>
	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>
