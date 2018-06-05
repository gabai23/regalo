<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品一覧</title>
</head>
<body>

	<jsp:include page="includeHeader.jsp"/>

	<div id="main">

		<!-- 商品一覧 -->
		<div id="productList">
			<s:iterator value="productInfoList">
				<!-- 各商品のURL作成 -->
				<s:url id="url" action="GoItemDetailAction">
					<s:param name="id" value="%{productId}"/>
				</s:url>

				<!-- 商品名 -->
				<s:a href="%{url}">
				<s:property value="productName"/>

				<!-- 商品名かな -->
				<s:property value="productNameKana"/>

				<!-- 商品画像 -->
				<img src='<s:property value="imageFilePath"/>'/>
				</s:a>
				<!-- 価格 -->
				<s:property value="price"/>
			</s:iterator>
		</div>

	</div>
	<form action="GoItemDetailAction">
		<button type="button">商品詳細へ</button>
	</form>

</body>
</html>