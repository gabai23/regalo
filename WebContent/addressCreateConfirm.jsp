<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />

<title>AddressCreateConfirm画面</title>
<style type="text/css">

body {
	height:auto;
	}

.main{
	height:auto;
	}

.button {
 	position:relative;
 	width:200px;
 	text-align:center;
 	margin:0 auto;
	margin-top:30px;
	margin-bottom:280px;
	}


</style>

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

	<div id="main">

	<s:form action="AddressCreateCompleteAction" id="form">

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
		<td>
			<s:if test="sex==0">
				男性
			</s:if>

			<s:else>
				女性
			</s:else>
			<s:hidden name="sex" value="%{sex}"/>
		</td>
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


		<div class="button">

			<s:submit value="送信"/>
		</div>


	</s:form>

	</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
