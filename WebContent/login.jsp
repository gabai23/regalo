<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix ="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/login-style.css">
<title>ログイン画面</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>




<!-- メイン -->

<!-- ログイン -->
<div id="main">
<div id="top">
	<p>ログイン</p>
</div>



<s:form action="LoginAction"  theme="simple">

<div class="errorMessage">
		<s:iterator value="errorMessageList">
		<s:property /><br>
		</s:iterator>
</div>
<br>
<table>
		<tr>
				<td>
					ID:
				</td>
				<td>
					<s:textfield type="text" name="userId" value="%{#session.saveId}" autofocus="autofocus"/>
				</td>
		</tr>
		<tr>
				<td>
					パスワード:
				</td>
				<td>
					<s:password name="password"/>
				</td>
		</tr>
</table>
<br>
<br>
	<!-- SaveID -->
		<div id="saveId">
				<span>次回からIDの入力を省略</span>
				<s:checkbox name="saveLogin"/>


		</div>
<br>
<!-- パスワード再設定 -->
		<div id="resetPassword">
				<span>パスワード再設定</span>
				<a href='<s:url action="GoPassWordResetAction"/>'>こちら</a>
		</div>

		<br>
<!-- ログインボタン -->
		<div id="submitButton">
				<s:submit value="ログイン"/>
		</div>

</s:form>



 <s:form action ="GoUserCreateAction">
	<s:submit value ="ユーザー登録"/>
</s:form>

 <s:form action ="GoPasswordResetAction">
	<s:submit value ="パスワード再設定"/>
</s:form>
</div>

<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>



</body>
</html>