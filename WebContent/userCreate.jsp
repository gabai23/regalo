<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/userCreate-style.css">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<title>新規登録画面</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>
<!-- メイン -->
<div id="main">

		<div id="title">User</div>
		<br>

		<div id="container">
		<div class="register_box">

				<div class="error" align="center">
								</div>
				<br>
				<div class="member_form">

					<s:form action="UserCreateConfirmAction" theme="simple"
						id="userCreate">

<div class="member_form_all">
						<span class="member_form_title">姓</span>
						<span class="member_form_text">
							<s:textfield type="text" name="familyName" value="%{familyName}"
							placeholder="姓"/>
						</span>
					<span class="mandatory">
					<s:if test="familyNameErorMessageList.size()>0">
						<span class="mandatory"><s:iterator value="familyNameErorMessageList">
							<s:property />
						</s:iterator>
						</span>
					</s:if>
					</span>
</div>
						<br>
						<div class="member_form_all">
						<span class="member_form_title">名</span>
						<z class="member_form_text">
							<s:textfield type="text" name="firstName" value="%{firstName}"
							placeholder="名"/>
							<br>

					<span class="mandatory">
					<s:if test="firstNameErorMessageList.size()>0">
						<s:iterator value="firstNameErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>
						</div>
						</div>
						<br>
<div class="member_form_text">
						<span class="member_form_title">姓ふりがな</span>

							<s:textfield type="text" name="familyNameKana"
								value="%{familyNameKana}"
								placeholder="姓ふりがな" />
							<br>

					<span class="mandatory">
					<s:if test="familyNameKanaErorMessageList.size()>0">
						<s:iterator value="familyNameKanaErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>
						</div>
						<br>
						<span class="member_form_title">名ふりがな</span>
						<div class="member_form_text">
							<s:textfield type="text" name="firstNameKana"
								value="%{firstNameKana}"
								placeholder="名ふりがな"/>
							<br>

					<span class="mandatory">
					<s:if test="firstNameKanaErorMessageList.size()>0">
						<s:iterator value="firstNameKanaErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>
					</div>
						<br>
						<span class="member_form_title">regaloID</span>
						<div class="member_form_text">
							<s:textfield type="text" name="userId" value="%{userId}"
								placeholder="半角英数字" />
							<br>
						</div>
					<span class="mandatory">
					<s:if test="userIdErorMessageList.size()>0">
											<s:iterator value="userIdErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>

						<br>
						<span class="member_form_title">パスワード</span>
						<div class="member_form_text">
							<s:password name="password" value="%{password}"
								placeholder="半角英数字" />
							<br>
						</div>
					<span class="mandatory">
					<s:if test="passwordErorMessageList.size()>0">
						<s:iterator value="passwordErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>


						<br>
						<span class="member_form_title">性別</span>
						<div class="member_form_radio">
							<s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" />
							<br>
						</div>


						<br>
						<span class="member_form_title">メールアドレス</span>
						<div class="member_form_text">
							<s:textfield type="text" name="email" value="%{email}" />
							<br>
						</div>

					<span class="mandatory"><s:if test="emailErorMessageList.size()>0">
						<s:iterator value="emailErorMessageList">
							<s:property />
						</s:iterator>
					</s:if>
					</span>

						<div class="member_btn">
							<button type="submit" class="">登 録 情 報 を 確 認</button>
						</div>
						<br>
					</s:form>
				</div>

		</div>
</div>
</div>

<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>
</body>
</html>