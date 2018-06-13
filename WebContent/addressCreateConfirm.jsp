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

<title>宛先情報確認画面</title>
<style type="text/css">

body {
	height:auto;
	}

.register-name {
	text-align: center;
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

	<div class="reset" align="center">以下の内容でよろしいですか。</div>
	<br><br>

	<!-- 姓 -->


		<div class="register-name"><s:label value="姓:"/>
		<s:property value="familyName"/><s:hidden name="familyName" value="%{familyName}"/></div><br>


	<!-- 名 -->


		<div class="register-name"><s:label value="名:"/>
		<s:property value="firstName"/><s:hidden name="firstName" value="%{firstName}"/></div><br>


	<!-- 姓仮名 -->


		<div class="register-name"><s:label value="姓仮名:"/>
		<s:property value="familyNameKana"/><s:hidden name="familyNameKana" value="%{familyNameKana}"/></div><br>


	<!-- 名仮名 -->


		<div class="register-name"><s:label value="名仮名:"/>
		<s:property value="firstNameKana"/><s:hidden name="firstNameKana" value="%{firstNameKana}"/></div><br>


	<!-- 性別 -->


		<div class="register-name"><s:label value="性別:"/>
			<s:if test="sex==0">
				男性
			</s:if>

			<s:else>
				女性
			</s:else>
			<s:hidden name="sex" value="%{sex}"/></div><br>



	<!-- 住所 -->


		<div class="register-name"><s:label value="住所:"/>
		<s:property value="userAddress"/><s:hidden name="userAddress" value="%{userAddress}"/></div><br>


	<!-- 電話番号 -->


		<div class="register-name"><s:label value="電話番号:"/>
		<s:property value="telNumber"/><s:hidden name="telNumber" value="%{telNumber}"/></div><br>


	<!-- メールアドレス -->


		<div class="register-name"><s:label value="メールアドレス:"/>
		<s:property value="email"/><s:hidden name="email" value="%{email}"/></div><br>





		<div class="button">

			<s:submit value="送信"/>
		</div>


	</s:form>

	</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
