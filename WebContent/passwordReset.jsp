<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PasswordReset画面</title>
</head>
<body>
	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<!-- ログインID -->
	<table>
	<tr>
		<th>ログインID:</th>
		<td><input type="text" name="userId" size="8"></td>
		<s:if test="!(errorId.equals(''))">
		<s:property value="errorId"/>
		</s:if>
	</tr>

	<!-- パスワード -->
	<tr>
		<th>パスワード:</th>
		<td><input type="text" name="password1" size="8"><td>
		<s:if test="!(errorPass.equals(''))">
		<s:property value="errorPass"/>
		</s:if>
	</tr>

	<!-- 確認パスワード -->
	<tr>
		<th>確認パスワード:</th>
		<td><input type="text" name="password2" size="8"><td>
		<s:if test="!(errorRePass.equals(''))">
		<s:property value="errorRePass"/>
		</s:if>
	</tr>
	</table>

	<!-- 送信ボタン -->
	<s:form action="PasswordResetConfirmAction">
		<s:submit value="パスワード再設定画面へ"/>
	</s:form>

	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>
