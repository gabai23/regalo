
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/productDetail.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>商品詳細</title>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
	<s:form action="CartInsertAction" theme="simple">
	<div id="main">

		<div id="title">
			Product Detail
		</div>

		<div id="container">

			<s:iterator value="productInfoList">

				<!-- 商品画像 -->
				<div id="imageContainer">
					<img id="image" src='<s:property value="imageFilePath"/>'/>
				</div>

				<div id="productDetail">

					<!-- 商品名 -->
					<s:property value="productName"/>

					<br>

					<!-- 商品名かな -->
					<s:property value="productNameKana"/>

					<br>

					<!-- 値段 -->
					<div id="price">
						<span>&yen;</span>
						<fmt:formatNumber value="${price}"/>
					</div>

					<br>

					<!-- 発売会社名 -->
					<s:property value="releaseCompany"/>

					<br>

					<!-- 発売年月日 -->
					<s:property value="releaseDate"/>

					<br>

					<!-- 商品詳細情報 -->
					<s:property value="productDescription"/>

					<br>

					<!-- 購入個数 -->
					<select name="productCount">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>

				</div>

			</s:iterator>

			<div id="cartButtonWrapper">
				<button type="submit" id="cartButton">カートへ</button>
			</div>


			<br>

			<div id="relationTitle">
				<h3>関連商品</h3>
			</div>

			<!-- 関連商品 -->
			<div id="relation" class="clearfix">
			<s:iterator value="relationInfoList">

				<div id="products" class="ratio-1_1">



							<!-- 各商品のURL作成 -->
							<s:url id="url" action="GoProductDetailAction">
								<s:param name="productId" value="%{productId}"/>
							</s:url>

							<!-- 商品画像 -->
							<s:a id="relationImageContainer" href="%{url}">
								<img id="relationImage" src='<s:property value="imageFilePath"/>' alt='<s:property value="imageFileName"/>'/>
							</s:a>

							<br>
							<div id="relationProductDetail">

								<span class="detail">→</span>

								<div class="datailHover">

									<s:a href="%{url}">
										<!-- 商品名 -->
										<s:property value="productName"/>

									</s:a>
								</div>

							</div>



				</div>
			</s:iterator>
			</div>


		</div>

	</div>
	</s:form>




	<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>


</body>
</html>