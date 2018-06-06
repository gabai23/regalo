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

 <s:form action ="LoginAction">
 	<s:textfield name="loginId"/>
	<s:password name="password"/>
 
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