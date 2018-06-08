<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/productList.css">
<title>商品一覧</title>
</head>
<body>

	<jsp:include page="includeHeader.jsp"/>

	<div id="main">

		<div id="top">
			<span>商品一覧</span>
		</div>

		<!-- 商品一覧 -->
		<div id="productList">
			<s:iterator value="productInfoList">
				<div id="products">
					<!-- 各商品のURL作成 -->
					<s:url id="url" action="GoProductDetailAction">
						<s:param name="productId" value="%{productId}"/>
					</s:url>

					<!-- 商品画像 -->
					<s:a id="imageContainer" href="%{url}">
						<img id="image" src='<s:property value="imageFilePath"/>' alt='<s:property value="imageFileName"/>'/>
					</s:a>

					<br>
					<!-- 商品名 -->
					<s:a href="%{url}">
						<s:property value="productName"/>

						<br>
						<!-- 商品名かな -->
						<s:property value="productNameKana"/>
					</s:a>

					<!-- 価格 -->
					<span>&yen;</span>
					<fmt:formatNumber value="${price}"/>
					<%-- <s:property value="price"/> --%>
				</div>
			</s:iterator>
		</div>

	</div>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>