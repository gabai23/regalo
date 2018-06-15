<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix ="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/login-style.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link type="text/css" href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">




<title>ログイン画面</title>
</head>
<body>
 <jsp:include page="includeHeader.jsp"/>
<!-- メイン -->


<!-- ログイン -->
<div id="main">

	<!-- ヘッダー 黒いところ-->
<div id="title">LOGIN</div>
	<div id="container">

			<s:form action="LoginAction"  theme="simple">

				<div class="errorMessage">
					<s:iterator value="idErrorMessageList">
					<s:property /><br>
					</s:iterator>
					<s:iterator value="passwordErrorMessageList">
					<s:property /><br>
					</s:iterator>
				</div>
				<br>

				<table>
					<tr>
							<td>
								<i class="fas fa-user  fa-2x fa-spin icon"></i>
							</td>
							<td>
								<s:textfield type="text" name="userId" value="%{#session.saveId}" autofocus="autofocus" placeholder="ID" />
							</td>
					</tr>

					<tr>
							<td>
								<i class="fas fa-lock  fa-2x fa-spin icon"></i>
							</td>
							<td>
								<s:password name="password" placeholder="PASSWORD" />
							</td>
					</tr>
				</table>
				<br>
				<!-- SaveID -->
				<div id="saveId">
						<s:checkbox name="saveLogin"/>
						<span class="mozi">ID保存</span>
				</div>

				<br>

				<!-- ログインボタン -->
				<div id="submitButton">
						<s:submit value="LOGIN"/>
				</div>

			</s:form>



			<div class="link">
		       <div id="space"><span class="mozi">会員登録は<a href='<s:url action="GoUserCreateAction"/>'>こちら</a></span></div>

			  <div> <span class="mozi">パスワードを忘れた方は<a href='<s:url action="GoPasswordResetAction"/>'>こちら</a></span></div>
		  	</div>

	</div>
</div>

<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>



</body>
</html>