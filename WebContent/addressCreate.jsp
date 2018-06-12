<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
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

.register {
	text-align: center;
	}

</style>
</head>

<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	<div id="main">

	<p class="titlefont">宛先登録</p>

	<div id="container"></div>

	<s:form action="AddressCreateConfirmAction" theme="simple">


	<div class="input">


	<!-- 姓 -->
	<div class="register">
		<s:if test="!#session.familyNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>


		<div class="name"><s:label value="姓"/></div>
		<div class="box"><s:textfield name="familyName" class="txt" /></div>
	</div>



	<!-- 名 -->
	<div class="register">
		<s:if test="!#session.firstNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<s:label value="名"/>
			<s:textfield name="firstName" class="txt" /><br>

	</div>

	<!-- 姓ふりがな -->
	<div class="register">
		<s:if test="!#session.familyNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<s:label value="姓ふりがな"/>
			<s:textfield name="familyNameKana" class="txt" /><br>

	</div>

	<!-- 名ふりがな -->
	<div class="register">
		<s:if test="!#session.firstNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<s:label value="名ふりがな"/>
			<s:textfield name="firstNameKana" class="txt" /><br>

	</div>

	<!-- 性別 -->
	<div class="register">

		<s:label value="性別"/>

		<s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" />



	</div>

	<!-- 住所 -->
	<div class="register">
		<s:if test="!#session.userAddressErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.userAddressErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>


			<s:label value="住所"/>
			<s:textfield name="userAddress" class="txt" /><br>

	</div>

	<!-- 電話番号 -->
	<div class="register">
		<s:if test="!#session.telNumberErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.telNumberErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<s:label value="電話番号"/>
			<s:textfield name="telNumber" class="txt" /><br>

	</div>


	<!-- メールアドレス -->
	<div class="register">
		<s:if test="!#session.emailErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.emailErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<s:label value="メールアドレス"/>
			<s:textfield name="email" class="txt" placeholder="半角英数字" /><br>

	</div>


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
