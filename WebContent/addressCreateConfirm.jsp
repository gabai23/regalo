<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddressCreateConfirm画面</title>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	<h2>以下の内容で登録します</h2>

	<!-- 姓 -->

	<div class="form-text">姓</div>
	<span><s:property value="familyName" escape="false" />
		<input type=hidden name="familyName" value='<s:property value="familyName" />'/></span>

	<!-- 名 -->

	<div class="form-text">名</div>
	<span><s:property value="firstName" escape="false" />
		<input type=hidden name="firstName" value='<s:property value="firstName" />'/></span>

	<!-- 姓ふりがな -->

	<div class="form-text">姓ふりがな</div>
	<span><s:property value="familyNameKana" escape="false" />
		<input type=hidden name="familyNameKana" value='<s:property value="familyNameKana" />'/></span>

	<!-- 名ふりがな -->

	<div class="form-text">名ふりがな</div>
	<span><s:property value="firstNameKana" escape="false" />
		<input type=hidden name="firstNameKana" value='<s:property value="firstNameKana" />'/></span>

	<!-- 郵便番号 -->

	<div class="form-text">郵便番号</div>
	<span><s:property value="zip11" escape="false" />
		<input type=hidden name="zip11" value='<s:property value="zip11" />'/></span>

	<!-- 住所 -->

	<div class="form-text">住所</div>
	<span><s:property value="addr11" escape="false" />
	<input type=hidden name="addr11" value='<s:property value="addr11" />'/></span>

	<!-- 電話番号 -->

	<div class="form-text">電話番号</div>
	<span><s:property value="telNumber" escape="false" />
	<input type=hidden name="telNumber" value='<s:property value="telNumber" />'/></span>

	<!-- メールアドレス -->

	<div class="form-text">メールアドレス</div>
	<span><s:property value="email" escape="false" />
	<input type=hidden name="email" value='<s:property value="email" />'/></span>

	<!-- 送信ボタン -->

	<s:form action="AddressCreateCompleteAction">
		<s:submit value="送信"/>
	</s:form>

	<!-- 戻るボタン -->

	<s:form action="GoAddressCreateAction">
		<s:submit value="戻る"/>
	</s:form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>
