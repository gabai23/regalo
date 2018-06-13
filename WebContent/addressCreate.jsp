<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="./css/style.css">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<title>宛先情報入力画面</title>
<style type="text/css">

body {
	height:auto;
	clear:right;
	}

.titlefont{
	text-align: center;
	font-size:30px;
/* 	font-family: 'メイリオ', Meiryo,sans-serif; */
/*  	font-style:oblique; */
	clear:right;
	}

.register {
	margin-left: 70px;
	}

.box{
	text-align: center;
	clear:right;
	}

.box1 {
	text-align: center;
	margin-top: 30px;
	}


.button {
  	text-align: center;
  	margin-top: 30px;
  	clear:right;
 	}

.register {
	text-align: center;
	clear:right;
	}

/* .register-name { */
/* 	position: absolute; */
/* 	left: 0; */
/* 	} */


.error-message {
	float:right;
	margin-top: 20px;
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
<!-- 	<div class="register"> -->
		<s:if test="!#session.familyNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

<%-- 		<div class="register-name"><s:label value="姓"/></div> --%>
		<div class="box">
			<span><s:label value="姓:"/></span><s:textfield name="familyName" class="txt" size="20%" placeholder="1文字以上16文字以下" /><br>
		</div>

<!-- 	</div> -->



	<!-- 名 -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.firstNameErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<div class="box">
			<span><s:label value="名:"/></span><s:textfield name="firstName" class="txt" size="20%" placeholder="1文字以上16文字以下" /><br>
		</div>
<!-- 	</div> -->

	<!-- 姓仮名 -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.familyNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.familyNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<div class="box">
			<span><s:label value="姓仮名:"/></span><s:textfield name="familyNameKana" class="txt" size="20%" placeholder="1文字以上16文字以下"/><br>
		</div>
<!-- 	</div> -->

	<!-- 名仮名 -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.firstNameKanaErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.firstNameKanaErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<div class="box">
			<span><s:label value="名仮名:"/></span><s:textfield name="firstNameKana" class="txt" size="20%" placeholder="1文字以上16文字以下"/><br>
		</div>
<!-- 	</div> -->

	<!-- 性別 -->
	<div class="register">

		<div class="box1">

		<span><s:label value="性別:"/></span><s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" /><br>

		</div>

	</div>

	<!-- 住所 -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.userAddressErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.userAddressErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>


			<div class="box">
			<span><s:label value="住所:"/></span><s:textfield name="userAddress" class="txt" size="20%" placeholder="15文字以上50文字以下"/><br>
		</div>
<!-- 	</div> -->

	<!-- 電話番号 -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.telNumberErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.telNumberErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<div class="box">
			<span><s:label value="電話番号:"/></span><s:textfield name="telNumber" class="txt" size="20%" placeholder="10文字以上13文字以下"/><br>
		</div>
<!-- 	</div> -->


	<!-- メールアドレス -->
<!-- 	<div class="register"> -->
		<s:if test="!#session.emailErrorMessageList.isEmpty()"><br>
		<div class="error">
			<div class="error-message">
				<s:iterator value="#session.emailErrorMessageList"><s:property /><br></s:iterator>
			</div>
		</div>
		</s:if>

			<div class="box">
			<span><s:label value="メールアドレス:"/></span><s:textfield name="email" class="txt" placeholder="半角英数字" /><br>
		</div>
	</div>


<!-- 	</div> -->

	<!-- 送信ボタン -->
	<div class="button">
		<s:submit value="確認画面へ" class="button-layout"/>
	</div>
	</s:form>

	</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
