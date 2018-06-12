<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<title>AddressCreate画面</title>
<style type="text/css">

body {
	height:auto;
	}

.main{
	height:auto;
	}

.button-layout{
	margin-left: 10px;
	margin-right: 10px;
	text-align:center;
	}

.box{
	text-align: center;
	}

.titlefont{
	text-align: center;
	font-size:30px;
	}

.button-center {
 	text-align: center;
 	margin-top: 30px;
	}

</style>
</head>

<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	<div id="main">

	<p class="titlefont">宛先登録</p>

	<s:form action="AddressCreateConfirmAction" theme="simple">

	<!-- 姓エラー -->

<%-- 	<s:if test="!#session.familyNameErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.familyNameErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>

	<!-- 名エラー -->

<%-- 	<s:if test="!#session.firstNameErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.firstNameErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>


	<!-- 姓ふりがなエラー -->

<%-- 	<s:if test="!#session.familyNameKanaErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.familyNameKanaErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>


	<!-- 名ふりがなエラー -->

<%-- 	<s:if test="!#session.firstNameKanaErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.firstNameKanaErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>


	<!-- メールアドレスエラー -->

<%-- 	<s:if test="!#session.emailErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.emailErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>


	<!-- 電話番号エラー -->

<%-- 	<s:if test="!#session.telNumberErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.telNumberErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>

	<!-- 住所エラー -->

<%-- 	<s:if test="!#session.userAddressErrorMessageList.isEmpty()"> --%>
<!-- 		<div class="error"> -->
<!-- 			<div class="error-message"> -->
<%-- 				<s:iterator value="#session.userAddressErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</s:if> --%>

	<div class="box">
	<table>

	<!-- 姓 -->
		<s:if test="!#session.familyNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

		<tr>
			<th scope="row"><s:label value="姓"/></th>
			<td><s:textfield name="familyName" class="txt" /></td>
<!-- 			<div class="form-text">姓【半角英語、漢字、ひらがな】</div> -->
		</tr>

	<!-- 名 -->
		<s:if test="!#session.firstNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>
		<tr>
			<th scope="row"><s:label value="名"/></th>
			<td><s:textfield name="firstName" class="txt" /><br></td>
		</tr>

	<!-- 姓ふりがな -->
		<s:if test="!#session.familyNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>
		<tr>
			<th scope="row"><s:label value="姓ふりがな"/></th>
			<td><s:textfield name="familyNameKana" class="txt" /><br></td>
		</tr>

	<!-- 名ふりがな -->
		<s:if test="!#session.firstNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>
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
		<s:if test="!#session.userAddressErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.userAddressErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

		<tr>
			<th scope="row"><s:label value="住所"/></th>
			<td><s:textfield name="userAddress" class="txt" /><br></td>
		</tr>

	<!-- 電話番号 -->
		<s:if test="!#session.telNumberErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.telNumberErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>
		<tr>
			<th scope="row"><s:label value="電話番号"/></th>
			<td><s:textfield name="telNumber" class="txt" /><br></td>
		</tr>


	<!-- メールアドレス -->
		<s:if test="!#session.emailErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.emailErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>
		<tr>
			<th scope="row"><s:label value="メールアドレス"/></th>
			<td><s:textfield name="email" class="txt" /><br></td>
		</tr>

	</table>
	</div>

	<!-- 送信ボタン -->
	<div class="button-center">
		<s:submit value="確認画面へ" class="button-layout"/>
	</div>
	</s:form>

	</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
