<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="">
<title>ホーム画面</title>
</head>
<body>

	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>

	<form action="GoLoginAction">
		<button type="submit">ログインへ</button>
	</form>

	<form action="GoMyPageAction">
		<button type="submit">マイページへ</button>
	</form>


	<form action="GoCartAction">
		<button type="submit">カートへ</button>
	</form>


	<form action="GoProductListAction">
		<button type="submit">商品一覧へ</button>
	</form>

	<form action="GoMasterAction">
		<button type="submit">管理者画面へ</button>
	</form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>