<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>確認画面</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>

<!-- メイン -->

	<div id="main">
		<br>
		<br>
		<div class="title">登録情報確認</div>
		<br>
		<div class="register_box">
			<div class="member">
				<div class="touroku" align="center">以下の内容で登録します</div>
				<br>
				<div class="member_form">
					<s:form action="UserCreateCompleteAction" theme="simple">
						<div class="member-form-title">

							<br>名前　　　　　　:　
							<s:property value="familyName" />
							<s:hidden name="familyName" value="%{familyName}" />
							<s:property value="firstName" />
							<s:hidden name="firstName" value="%{firstName}" />

							<br>
							<br>
							<br>ふりがな　　　　:　
							<s:property value="familyNameKana" />
							<s:hidden name="familyNameKana" value="%{familyNameKana}" />
							<s:property value="firstNameKana" />
							<s:hidden name="firstNameKana" value="%{firstNameKana}" />

							<br>
							<br>
							<br>cherryID　　　　:　
							<s:property value="userId" />
							<s:hidden name="userId" value="%{userId}" />

							<br>
							<br>
							<br> パスワード　　　:　
							<s:property value="password" />
							<s:hidden name="password" value="%{password}" />

							<br>
							<br>
							<br> 性別　　　　　　:　
							<s:if test="sex==0">
								男性
							</s:if>
							<s:else>
								女性
							</s:else>
							<s:hidden name="sex" value="%{sex}" />

							<br>
							<br>
							<br> メールアドレス　:　
							<s:property value="email" />
							<s:hidden name="email" value="%{email}" />

							<br>
							<br>
							<br>
							<br>

							<div class="member_btn">
								<button type="submit" class="">登 録 情 報 を 確 定</button>
							</div>
							<br>
							<br>

							<div class="modoru" style="padding-left: 23px;">
								<a href="/regalo/userCreate.jsp">戻 る</a>
							</div>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>











<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>

</body>
</html>