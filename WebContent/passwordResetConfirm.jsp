<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PasswordResetConfirm画面</title>
</head>
<body>
	<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>

	<h3>以下の内容でよろしいですか。</h3>

	<table>
		<tr>
			<th>ユーザーID:</th>
			<td><s:property value="userId" escape="false" /></td>
		</tr>
		<tr>
			<th>パスワード:</th>
			<td><s:property value="passCon1" escape="false" /></td>
		</tr>
		<tr>
			<th>確認パスワード:</th>
			<td><s:property value="passCon2" escape="false" /></td>
		</tr>
	</table>

	<!-- 送る -->
	<s:hidden name="userId" />
	<s:hidden name="password1" />
	<s:hidden name="password2" />

	<s:if test="userId.equals('null')">エラー<a href="<s:url action="HomeAction"/>">ホームに戻る</a>
	</s:if>

	<s:else>
		<div id="button">
			<s:form action="GoPasswordResetAction">
				<s:submit value="訂正"/>
			</s:form>

			<s:form action="PasswordResetCompleteAction">
				<s:submit value="送信"/>
			</s:form>
		</div>
	</s:else>

	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>
</body>
</html>
