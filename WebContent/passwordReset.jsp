<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="">
<meta name="keywords" content="" />
<title>パスワード再設定画面</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- 半角英数字入力のアラートを出す -->
<script type="text/javascript">
	function checkForm($this) {
		var str = $this.value;
		if (str.match(/[^A-Z^a-z0-9]+/)) {
			alert('半角英数で入力してください');
			$this.value = "";
		}
	}
</script>

<style type="text/css">

body {
	height:auto;
	color: white;


	}

table.vertical-list-table {
	width: 90%;
	text-align: center;
	color:white;
	}

table.horizontal-list-table th {
	width: 30%;
	padding: 10px;
	font-weight: bold;
	font-size: 0.8em;
	text-align: center;
	vertical-align: top;
	}

table.horizontal-list-table, th, td {
	width : 30%;
	}


.member_form_title {
	float:left;
	}

.box{
/*  position: absolute; */

/* 	top:50%; */
/* 	left:50%; */

/* 	-webkit-transform: translate(-50%,-50%); */
/* 	-moz-transform: translate(-50%,-50%); */
/* 	-ms-transform: translate(-50%,-50%); */
/* 	-o-transform: translate(-50%,-50%); */
/* 	transform: translate(-50%,-50%); */
/* 	clear:both; */
 	}

.error {
	float:right;
	}

.error-message {
	float:right;
	}

.button {
	text-align: center;
	margin-bottom:40px;
	clear:both;

	}




</style>
</head>
<body>
	<!-- ヘッダー -->
		<div id="menu">
			<jsp:include page="includeHeader.jsp"/>
		</div>

	<div id="main">

			<s:form action="PasswordResetConfirmAction" theme="simple">

			<div id="title">PASSWORD RESET</div>

		<div id="container">


		<table>
			<!-- ユーザーID -->

			<tr>
				<th><span class="member_form_title">ユーザーID</span></th>
				<td>
					<div class="box">
						<s:textfield name="userId" size="20%"  placeholder="半角英数字"/>
					</div>
				</td>
				<td>
					<div class="error">
						<s:if test="!(errorId.equals(''))">
							<s:property value="errorId"/>
						</s:if>
						<s:elseif test="!errorMessageId.isEmpty()">
							<s:property value="errorMessageId"/>
						</s:elseif>
					</div>
				</td>
				<td>
					<div class="error-message">
						<s:if test="ErrorUserIdList.length > 0">
							<s:iterator value="ErrorUserIdList">
							<s:property />
							</s:iterator>
						</s:if>
					</div>
				</td>
			</tr>

			<!-- 現在のパスワード -->

			<tr>
				<th><span class="member_form_title">現在のパスワード</span></th>
				<td>
					<div class="box">
						<s:textfield name="password" size="20%"  placeholder="半角英数字"/>
					</div>
					<td>
						<div class="error">
							<s:if test="!(errorPassword.equals(''))">
								<s:property value="errorPassword"/>
							</s:if>
						</div>
					</td>
					<td>
						<div class="error-message">
							<s:if test="ErrorPasswordList.length > 0">
								<s:iterator value="ErrorPasswordList">
								<s:property />
								</s:iterator>
							</s:if>
						</div>
					</td>
			</tr>

			<!-- 新しいパスワード -->

			<tr>
				<th><span class="member_form_title">新しいパスワード</span></th>
				<td>
					<div class="box">
						<s:textfield name="password1" size="20%" placeholder="半角英数字"/>
					</div>
				<td>
					<div class="error">
						<s:if test="!ErrorPasswordList1.isEmpty()">
							<s:iterator value="ErrorPasswordList1">
							<s:property />
							</s:iterator>
						</s:if>
					</div>
				</td>
			</tr>

		<!-- 確認パスワード -->

			<tr>
				<th><span class="member_form_title">確認パスワード</span></th>
				<td>
					<div class="box">
						<s:textfield name="password2" size="20%" placeholder="半角英数字"/>
					</div>
				</td>
				<td>
					<div class="error">
						<s:if test="!(password1.equals(password2))">
						<s:property value="errorMessagePassword"/>
						</s:if>
					</div>
				</td>
				<td>
					<div class="error-message">
						<s:if test="ErrorReconfirmPassList.size()>0">
							<s:iterator value="ErrorReconfirmPassList">
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
				</div>
		</div>
	</s:form>
</div>



	<!-- フッター -->
		<jsp:include page="includeFooter.jsp"/>

</body>
</html>

