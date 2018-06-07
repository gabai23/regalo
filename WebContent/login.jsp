<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix ="s" uri="/struts-tags" %> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン画面</title>
</head>
<body>

<s:iterator value="errorMessageList">
	<s:property />
</s:iterator>
 <s:form action ="LoginAction">
 	<span>ID:</span>
 	<!-- ↓ここのvalue値にsessionで保持されたIDをいれちまってる。次回からID入力せずにすむ -->
 	<s:textfield name="loginId" value="%{#session.saveLogin}" autofocus="autofocus"/>
 	
 	<br><!-- ただの改行や圭一郎。 -->
 	
 	<span>パスワード:</span>
	<s:password name="password"/>
	
	<div id="saveId">
		<span>次回からIDの入力を省略</span>
		<s:checkbox name="saveLogin"/>
	</div>
 
 <s:submit value ="ログインしてくれ！！！"/>
</s:form>


 <s:form action ="GoUserCreateAction">
	<s:submit value ="ユーザー登録やな"/>
</s:form>

 <s:form action ="GoPasswordResetAction">
	<s:submit value ="パスワード再設定なんよ"/>
</s:form>





</body>
</html>