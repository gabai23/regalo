<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/runkup.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>VIP商品一覧</title>
<style type="text/css">
#title {
/* background:#990000; */
background-image: linear-gradient(to top left, #F7DE05, #DA8E00, #EDAC06, #F7DE05, #ECB802, #DAAF08, #B67B03);
}

color:#daa520;
}
#container {
    width:85%;
	height:800px;
	text-align:center;
	background:#990000;

	margin-left:7.5%;
	margin-right:7.5%;
	margin-bottom:10%;

}
</style>
</head>
<body>

	<jsp:include page="includeHeader.jsp"/>

	<div id="main">

		<div id="title">
			VIP
		</div>

		<div id="error">
			<s:iterator value="messageList">
				<s:property/>
			</s:iterator>
		</div>



		<!-- 商品一覧 -->
		<div id="container"  class="clearfix">
			<s:iterator value="productInfoList">
				<div id="wrapper" class="ratio-1_1">
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
						<div id="productDetail">

							<span class="detail">→</span>

							<div class="datailHover">

								<s:a href="%{url}">
									<!-- 商品名かな -->
									<span class="productNameKana">
										<s:property value="productNameKana"/>
									</span>

									<br>
									<!-- 商品名 -->
									<s:property value="productName"/>

								</s:a>

								<br>
								<!-- 価格 -->
								<div id="price">
									<span>&yen;</span>
									<fmt:formatNumber value="${price}"/>
								</div>
							</div>

						</div>
					</div>
				</div>
			</s:iterator>
		</div>

	<!-- フッター -->
<%-- 	<jsp:include page="includeFooter.jsp"/> --%>

	</div>

</body>
</html>