<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="">
<title>MyPage</title>

</head>
<body>
<jsp:include page="includeHeader.jsp">

<h3>会員登録情報</h3>

	<s:iterator value="myPageList">

		<tr>
			<th>氏名</th>
			<td>
				<p>
					<s:property value="familyName"/>
					<s:property value="firstName"/>
					<s:property value="familyNameKana"/>
					<s:property value="firstNameKana"/>
				</p>
			</td>
		<tr>

		<tr>
			<th>性別</th>
			<td>
				<p>
					<s:if test="sex==0">男性</s:if>
					<s:else>女性</s:else>
				</p>
			</td>
		</tr>

		<tr>
			<th>メールアドレス</th>
			<td>
				<s:property value="email"/>
			</td>
		</tr>

		<tr>
			<td>ID</td>
			<td>
				<s:property value="userId"/>
			</td>
		</tr>

		<tr>
			<td>パスワード</td>
			<td>
				<s:property value="password"/>
			</td>
		</tr>


	</s:iterator>


	<s:form action="GoBuyProductHistoryAction">
		<s:submit value="購入履歴" />
	</s:form>


	<jsp:include page="includeFooter.jsp"/>



</body>
</html>