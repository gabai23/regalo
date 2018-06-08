<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddressCreateConfirm画面</title>

<script>
function gogoGoPasswordResetAction(){
	document.getElementById("form").action="GoAddressCreateAction";
}

function goPasswordResetCompleteAction(){
	document.getElementById("form").action="AddressCreateCompleteAction";
}

</script>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	<s:form action="GoAddressCreateAction" id="form">

	<h2>以下の内容で登録します</h2>

<table>
	<!-- 姓 -->

	<tr>
		<th scope="row"><s:label value="姓"/></th>
		<td><s:property value="familyName"/><s:hidden name="familyName" value="%{familyName}"/></td>
	</tr>

	<!-- 名 -->

	<tr>
		<th scope="row"><s:label value="名"/></th>
		<td><s:property value="firstName"/><s:hidden name="firstName" value="%{firstName}"/></td>
	</tr>

	<!-- 姓ふりがな -->

	<tr>
		<th scope="row"><s:label value="姓ふりがな"/></th>
		<td><s:property value="familyNameKana"/><s:hidden name="familyNameKana" value="%{familyNameKana}"/></td>
	</tr>

	<!-- 名ふりがな -->

	<tr>
		<th scope="row"><s:label value="名ふりがな"/></th>
		<td><s:property value="firstNameKana"/><s:hidden name="firstNameKana" value="%{firstNameKana}"/></td>
	</tr>

	<!-- 性別 -->

	<tr>
		<th scope="row"><s:label value="性別"/></th>
		<td><s:property value="sex"/><s:hidden name="sex" value="%{sex}"/></td>
	</tr>

	<!-- 住所 -->

	<tr>
		<th scope="row"><s:label value="住所"/></th>
		<td><s:property value="userAddress"/><s:hidden name="userAddress" value="%{userAddress}"/></td>
	</tr>

	<!-- 電話番号 -->

	<tr>
		<th scope="row"><s:label value="電話番号"/></th>
		<td><s:property value="telNumber"/><s:hidden name="telNumber" value="%{telNumber}"/></td>
	</tr>

	<!-- メールアドレス -->

	<tr>
		<th scope="row"><s:label value="メールアドレス"/></th>
		<td><s:property value="email"/><s:hidden name="email" value="%{email}"/></td>
	</tr>

	</table>


		<div id="button">
			<s:submit value="訂正" onclick="goGoAddressCreateAction();"/>

			<s:submit value="送信"  onclick="goAddressCreateCompleteAction();"/>
		</div>


	</s:form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>
