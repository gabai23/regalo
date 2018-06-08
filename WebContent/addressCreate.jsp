<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddressCreate画面</title>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	宛先登録

	<s:form action="AddressCreateConfirmAction" theme="simple">

	<!-- 姓エラー -->

	<s:if test="!(#session.familyNameErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>

	<!-- 名エラー -->

	<s:if test="!(#session.firstNameErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>


	<!-- 姓ふりがなエラー -->

	<s:if test="!(#session.familyNameKanaErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>


	<!-- 名ふりがなエラー -->

	<s:if test="!(#session.firstNameKanaErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>


	<!-- メールアドレスエラー -->

	<s:if test="!(#session.emailErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.emailErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>


	<!-- 電話番号エラー -->

	<s:if test="!(#session.telNumberErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.telNumberErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>

	<!-- 住所エラー -->

	<s:if test="!(#session.userAddressErrorMessageList.isEmpty())">
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.userAddressErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
	</s:if>

	<table>

	<!-- 姓 -->
		<tr>
			<th scope="row"><s:label value="姓"/></th>
			<td><s:textfield name="familyName" class="txt" /></td>
		</tr>


	<!-- 名 -->
		<tr>
			<th scope="row"><s:label value="名"/></th>
			<td><s:textfield name="firstName" class="txt" /><br></td>
		</tr>

	<!-- 姓ふりがな -->
		<tr>
			<th scope="row"><s:label value="姓ふりがな"/></th>
			<td><s:textfield name="familyNameKana" class="txt" /><br></td>
		</tr>

	<!-- 名ふりがな -->
		<tr>
			<th scope="row"><s:label value="名ふりがな"/></th>
			<td><s:textfield name="firstNameKana" class="txt" /><br></td>
		</tr>

	<!-- 性別 -->
		<%-- <tr>
			<th scope="row"><s:label value="性別"/></th>
			<td><s:textfield name="sexList" class="txt" /><br></td>
		</tr> --%>
		<tr>
		<th scope="row"><s:label value="性別"/></th>

			<td><s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" /></td>


		</tr>

	<!-- 住所 -->
		<tr>
			<th scope="row"><s:label value="住所"/></th>
			<td><s:textfield name="userAddress" class="txt" /><br></td>
		</tr>

	<!-- 電話番号 -->
		<tr>
			<th scope="row"><s:label value="電話番号"/></th>
			<td><s:textfield name="telNumber" class="txt" /><br></td>
		</tr>

	<!-- メールアドレス -->
		<tr>
			<th scope="row"><s:label value="メールアドレス"/></th>
			<td><s:textfield name="email" class="txt" /><br></td>
		</tr>
	</table>

	<!-- 送信ボタン -->
		<s:submit value="確認画面へ"/>
	</s:form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
