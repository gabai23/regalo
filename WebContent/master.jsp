<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<a href='<s:url action="GoItemInsertAction"/>'>商品追加</a>
	</p>

	<p>
		<a href='<s:url action="GoItemUpdateAction"/>'>商品更新</a>
	</p>

	<p>
		<a href='<s:url action="GoItemDeleteAction"/>'>商品削除</a>
	</p>

	<p>
		<a href='<s:url action="GoHomeAction"/>'>ホームへ</a>
	</p>

</body>
</html>