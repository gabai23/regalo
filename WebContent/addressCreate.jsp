<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style2.css">
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<title>宛先情報入力画面</title>
<style type="text/css">

body {
	height:auto;
	clear:both;
	}

.container{
	position:relative;
	width:40%;
	height:750px;
	background:black;
	margin-left : 30%;
	margin-right: 30%;
/* 	padding-top: 50px; */
}

table {
	position: absolute;
	top:50%;
	left:50%;
	text-align:center;
	color:gray;
	clear:both;

 	-webkit-transform: translate(-50%,-50%);
 	-moz-transform: translate(-50%,-50%);
 	-ms-transform: translate(-50%,-50%);
 	-o-transform: translate(-50%,-50%);
 	transform: translate(-50%,-50%);
	}

/* #wrapper{ */
/* 	width:65%; */
/* 	height:200px; */
/* 	padding-top:280px; */
/* 	padding-bottom:120px; */
/* 	padding-left:5%; */
/* 	padding-right:10%; */
/* 	background:white; */
/* 	margin-left:10%; */
/* 	margin-right:10%; */
/* 	}  */

.member_form_title {
/* 	margin:20px; */
	float:left;
	}

/* .error { */
/* 	float:right; */
/* 	} */

.error-message {
	text-align: left;
	color:red;
	}

.box{
	margin:20px;
	}

.check {
/* 	text-align: center; */
/* 	margin-top: 30px; */
	clear:both;
	}

.button {
  	text-align: center;
  	padding-top: 675px;
  /* 	margin-top: 485px; */
/*   	margin-top: 480px; */
/*   	clear:both; */
 	}

</style>
</head>

<body>
<!-- ヘッダー -->
<!-- <div id="menu"> -->
	<jsp:include page="includeHeader.jsp"/>
<!-- </div> -->

<div id="main">
	<div id="title">ADDRESS</div>
	<div class="container">
<!-- 		<div id="wrapper"> -->
	<s:form action="AddressCreateConfirmAction" theme="simple">

		<table>

		<!-- 姓 -->
		<tr>
			<td><span class="member_form_title">姓</span></td>
			<td>
				<div class="box">
					<s:textfield name="familyName" class="txt" size="20%" placeholder="1文字以上16文字以下" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.familyNameErrorMessageList.isEmpty()">
						<s:iterator value="#session.familyNameErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>

		<!-- 名 -->
		<tr>
			<td>
				<span class="member_form_title">名</span></td>
			<td>
				<div class="box">
					<s:textfield name="firstName" class="txt" size="20%" placeholder="1文字以上16文字以下"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.firstNameErrorMessageList.isEmpty()">
						<s:iterator value="#session.firstNameErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>

		<!-- 姓仮名 -->
		<tr>
			<td><span class="member_form_title">姓仮名</span></td>
			<td>
				<div class="box">
					<s:textfield name="familyNameKana" class="txt" size="20%" placeholder="1文字以上16文字以下"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.familyNameKanaErrorMessageList.isEmpty()">
						<s:iterator value="#session.familyNameKanaErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>


		<!-- 名仮名 -->
		<tr>
			<td><span class="member_form_title">名仮名</span></td>
			<td>
				<div class="box">
					<s:textfield name="firstNameKana" class="txt" size="20%" placeholder="1文字以上16文字以下"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.firstNameKanaErrorMessageList.isEmpty()">
						<s:iterator value="#session.firstNameKanaErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>

		<!-- 性別 -->
		<tr>
			<td><span class="member_form_title">性別</span></td>
			<td>
				<div class="check">
					<s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" />
				</div>
			</td>
		</tr>

		<!-- 住所 -->
		<tr>
			<td><span class="member_form_title">住所</span></td>
			<td>
				<div class="box">
					<s:textfield name="userAddress" class="txt" size="20%" placeholder="15文字以上50文字以下"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.userAddressErrorMessageList.isEmpty()">
						<s:iterator value="#session.userAddressErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>


		<!-- 電話番号 -->
		<tr>
			<td><span class="member_form_title">電話番号</span></td>
			<td>
				<div class="box">
					<s:textfield name="telNumber" class="txt" size="20%" placeholder="10文字以上13文字以下"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.telNumberErrorMessageList.isEmpty()">
						<s:iterator value="#session.telNumberErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>

		<!-- メールアドレス -->
		<tr>
			<td><span class="member_form_title">メールアドレス</span></td>
			<td>
				<div class="box">
					<s:textfield name="email" class="txt" placeholder="半角英数字" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="error-message">
					<s:if test="!#session.emailErrorMessageList.isEmpty()">
						<s:iterator value="#session.emailErrorMessageList">
						<s:property />
						</s:iterator>
					</s:if>
				</div>
			</td>
		</tr>
		</table>


	<!-- 送信ボタン -->
		<div class="button">
			<s:submit value="確認"/>
			<s:submit value="戻る"/>
		</div>
	</s:form>
<!-- 	</div> -->
	</div>
</div>
	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>
