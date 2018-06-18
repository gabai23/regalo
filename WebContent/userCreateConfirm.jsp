<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/userCreateConfirm.css">
<link rel="stylesheet" href="./css/style2.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<title>登録確認画面</title>
<script type="text/javascript">
	function goUserCreateCompleteAction() {
		document.getElementById("form-action").action = "UserCreateCompleteAction";
	}
	function goGoUserCreateAction() {
		document.getElementById("form-action").action = "GoUserCreateAction";
	}
</script>
</head>





<body>
<!-- ヘッダー -->
<jsp:include page="includeHeader.jsp"/>

<!-- メイン -->

	<div id="main">
		<br>
		<br>
		<div id="title">User</div>
		<br>
		<div id="container">
		<div class="register_box">
			<div class="member">
				<div class="touroku" align="center">以下の内容で登録します</div>
				<br>

				<div class="member_form">


<s:form id="form-action">
						<div class="member-form-title">

							<br>名前　　　　　　　
							<s:property value="familyName" />
							<s:hidden name="familyName" value="%{familyName}" />
							<s:property value="firstName" />
							<s:hidden name="firstName" value="%{firstName}" />

							<br>
							<br>
							<br>ふりがな　　　　　
							<s:property value="familyNameKana" />
							<s:hidden name="familyNameKana" value="%{familyNameKana}" />
							<s:property value="firstNameKana" />
							<s:hidden name="firstNameKana" value="%{firstNameKana}" />

							<br>
							<br>
							<br>UserID　　　　　
							<s:property value="userId" />
							<s:hidden name="userId" value="%{userId}" />

							<br>
							<br>
							<br> パスワード　　　　
							<s:property value="password" />
							<s:hidden name="password" value="%{password}" />

							<br>
							<br>
							<br> 性別　　　　　　　
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



					</div>



<div class="button-center">
						<s:submit value="戻る" class="button-layout" onclick="goGoUserCreateAction()"/>
						<s:submit value="登録" class="button-layout" onclick="goUserCreateCompleteAction()"/>
					</div>

							</s:form>


</div>
				</div>

</div>

</div>
</div>















<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>

</body>
</html>