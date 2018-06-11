<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>商品詳細</title>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<form action="CartInsertAction">
	<div id="main">

		<s:iterator value="productInfoList">

		<!-- 商品名 -->
		<s:property value="productName"/>

		<!-- 商品名かな -->
		<s:property value="productNameKana"/>

		<!-- 商品画像 -->
		<img id="image" src='<s:property value="imageFilePath"/>'/>

		<!-- 値段 -->
		<s:property value="price"/>

		<!-- 購入個数 -->
		<select name="productCount">
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>

		<!-- 発売会社名 -->
		<s:property value="releaseCompany"/>

		<!-- 発売年月日 -->
		<s:property value="releaseDate"/>

		<!-- 商品詳細情報 -->
		<s:property value="productDescription"/>

		</s:iterator>
	</div>

		<button type="submit">カートへ</button>
	</form>

	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>


</body>
</html>