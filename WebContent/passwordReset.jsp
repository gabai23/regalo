<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>PasswordReset画面</title>
</head>
<body>
	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<s:form action="PasswordResetConfirmAction" theme="simple">

	<!-- ログインID -->
	<table>
	<tr>
		<th>ログインID:</th>
		<td><s:textfield name="userId" size="8"/></td>
		<td>
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
		</td>
	</tr>

	<!-- パスワード -->
	<tr>
		<th>パスワード:</th>
		<td><input type="text" name="password1" size="8"><td>
<%-- 		<s:if test="!(errorPass.equals(''))"> --%>
<%-- 		<s:property value="errorPass"/> --%>
<%-- 		</s:if> --%>
		<s:if test="!ErrorPasswordList1.isEmpty()">
			<s:iterator value="ErrorPasswordList1">
				<s:property />
			</s:iterator>
		</s:if>
	</tr>

	<!-- 確認パスワード -->
	<tr>
		<th>確認パスワード:</th>
		<td><input type="text" name="password2" size="8"><td>
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
	</tr>
	</table>

	<!-- 送信ボタン -->

		<s:submit value="パスワード再設定画面へ"/>
	</s:form>

	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>
