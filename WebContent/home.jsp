<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ホーム画面</title>
</head>
<body>
	<form action="GoLoginAction">
		<button type="button">ログインへ</button>
	</form>

	<form action="GoMypageAction">
		<button type="button">マイページへ</button>
	</form>


	<form action="GoCartAction">
		<button type="button">カートへ</button>
	</form>


	<form action="GoItemListAction">
		<button type="button">商品一覧へ</button>
	</form>

	<form action="GoMasterAction">
		<button type="button">管理者画面へ</button>
	</form>


</body>
</html>