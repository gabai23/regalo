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

	<!-- 姓 -->

	<table>
		<tr>
			<td>
				<span class="member_form_title">姓</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="familyName" value="%{familyName}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">名</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="firstName" value="%{firstName}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">姓ふりがな</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="familyNameKana" value="%{familyNameKana}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">名ふりがな</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="firstNameKana" value="%{firstNameKana}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">メールアドレス</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="email" value="%{email}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">電話番号</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="telNumber" value="%{telNumber}"/>
				</div>
			</td>
		</tr>

		<tr>
			<td>
				<span class="member_form_title">郵便番号</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="zip11" value="%{zip11}"/>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="member_form_title">住所</span>
				<span class="mandatory">必須</span>
			</td>
			<td>
				<div class="member_form_text">
				<s:textfield name="addr11" value="%{addr11}"/>
				</div>
			</td>
		</tr>

	</table>

	<!-- 送信ボタン -->
	<s:form action="AddressCreateConfirmAction">
		<s:submit value="確認画面へ"/>
	</s:form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>
