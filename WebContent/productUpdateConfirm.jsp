<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
if(!(session.getAttribute("masterId") == "admin")){
  out.println("本ページへのアクセスは認められていません");
  out.close();
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" /> <meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="./css/style.css">
		<link rel="stylesheet" href="./css/ProductUpdate.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

		<title>確認画面</title>
		<style type="text/css"></style>
	</head>
	<body>


<!-- ヘッダー -->

		<jsp:include page="includeHeader.jsp" />

<!-- メイン -->
	<div id="main">
	<div id="title">
	ProductUpdate
	</div>
	<div id="container">
	<div id="top-text">
		こちらに変更しますか？
		</div>
		<div class="confirm-box">
			<div class="moji">
<!-- 				<div class="character-img"> -->
<!-- 					<b>画像ファイル名：</b> -->
<%-- 					<s:property value="session.imageFileName"/><br/> --%>

<%-- 					<img src="<s:property value="session.imageFilePath"/>" width="100" height="100"/><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>商品名:</b><s:property value="session.productName" /><br><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>商品かな:</b><s:property value="session.productNameKana" /><br><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>商品詳細:</b><s:property value="session.productDescription" /><br><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>商品カテゴリ:</b><s:property value="session.categoryId" /><br><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>値段:</b><s:property value="session.price" />円<br><br> --%>
<!-- 				</div> -->
<!-- 				<div class="character"> -->
<%-- 					<b>販売会社:</b><s:property value="session.releaseCompany" /><br><br> --%>
<!-- 				</div> -->


			<img src="<s:property value="session.imageFilePath"/>" width="100" height="100"/>

 <table class="Product-Update">
					<tr><td>商品名:</td><td><s:property value="session.productName" /></td></tr>


					<tr><td>商品かな:</td><td><s:property value="session.productNameKana" /></td></tr>

					<tr><td class="description">商品詳細:</td><td><s:property value="session.productDescription.replaceAll('\\n', '<br />')" escape="false" /></td></tr>

					<tr><td>商品カテゴリ:</td><td><s:property value="session.categoryId" /></td></tr>

					<tr><td>値段:</td><td><s:property value="session.price" />円</td></tr>

					<tr><td>販売会社:</td><td><s:property value="session.releaseCompany" /></td></tr>
</table>


				<input type="hidden" name="id" value="<s:property value="id"/>" />
				<input type="hidden" name="category" value="<s:property value="category"/>" />
				<input type="hidden" name="description" value="<s:property value="description"/>" />
				<input type="hidden" name="productId" value="<s:property value="productId" />" />
				<input type="hidden" name="productName" value="<s:property value="productName"/>" />
				<input type="hidden" name="productKanaName" value="<s:property value="productKanaName"/>" />
				<input type="hidden" name="productStock" value="<s:property value="productStock"/>" />
				<input type="hidden" name="price" value="<s:property value="price"/>" />
				<input type="hidden" name="imageName"value="<s:property value="imageName"/>" />
				<input type="hidden" name="imageFileName"value="<s:property value="imageFileName"/>" />
				<input type="hidden" name="company"value="<s:property value="company"/>" />

			</div>
			<div class="submit_btn_box">
				<span id="contents-btn-set">
				<input type="button"
				onclick="location.href='<s:url action="GoProductUpdateAction" />'"
				value="訂正" /></span>
<span id="contents-btn-set">
			<input type="button"
				onclick="location.href='<s:url action="ProductUpdateCompleteAction" />'"
				value="完了" /></span>

			<br>
			</div>
		</div>
		</div>
	</div>
	<jsp:include page="includeFooter.jsp" />
</body>
</html>