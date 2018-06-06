<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規登録画面</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>
<!-- メイン -->
<div id="main">
		<br> <br>
		<div class="title">ユーザ新規登録</div>
		<br>
		<div class="register_box">
			<div class="member">
				<div class="error" align="center">
					<s:iterator value="errorMessageList">
						<s:div>
							<s:property />
						</s:div>
					</s:iterator>
				</div>
				<br>
				<div class="member_form">

					<s:form action="UserCreateConfirmAction" theme="simple"
						id="userCreate">

						<span class="member_form_title">姓</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="familyName" value="%{familyName}" />
						</div>

						<br>
						<span class="member_form_title">名</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="firstName" value="%{firstName}" />
							<br>
						</div>

						<br>
						<span class="member_form_title">姓ふりがな</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="familyNameKana"
								value="%{familyNameKana}" />
							<br>
						</div>

						<br>
						<span class="member_form_title">名ふりがな</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="firstNameKana"
								value="%{firstNameKana}" />
							<br>
						</div>

						<br>
						<span class="member_form_title">regaloID</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="userId" value="%{userId}"
								placeholder="半角英数字" />
							<br>
						</div>

						<br>
						<span class="member_form_title">パスワード</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:password name="password" value="%{password}"
								placeholder="半角英数字" />
							<br>
						</div>

						<br>
						<span class="member_form_title">性別</span>
						<span class="hissu">必須</span>
						<div class="member_form_radio">
							<s:radio name="sex" list="#{'0': '男性　　', '1': '女性'}" value="0" />
							<br>
						</div>

						<br>
						<span class="member_form_title">メールアドレス</span>
						<span class="hissu">必須</span>
						<div class="member_form_text">
							<s:textfield type="text" name="email" value="%{email}" />
							<br>
						</div>


						<div class="member_btn">
							<button type="submit" class="">登 録 情 報 を 確 認</button>
						</div>
						<br>
					</s:form>
				</div>
			</div>
		</div>
	</div>

<%-- <s:form action="UserCreateConfirmAction"> --%>
<%-- <s:submit value="確認画面へ"/> --%>
<%-- </s:form> --%>

<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>
</body>
</html>