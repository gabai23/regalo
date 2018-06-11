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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="imagetoolbar" content="no" /> <meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" type="text/css" href="./css/masterAddConfirm.css">
		<title>確認画面</title>
		<style type="text/css"></style>
	</head>
	<body>

	<div class="header">
		<jsp:include page="includeHeader.jsp" />
	</div>

	<div class="main">
		<h1>こちらの商品を追加しますか？</h1>
		<div class="inner">
			<div class="product_info">
				<div class="character">
					<b>画像ファイル名：</b><s:property value="session.imageFileName"/><br/>
					<img src="<s:property value="session.imageFilePath"/>" width="100" height="100"/><br>
				</div>
				<div class="character">
					<b>商品名:</b><s:property value="session.productName" /><br>
				</div>
				<div class="character">
					<b>商品かな:</b><s:property value="session.productNameKana" /><br>
				</div>
				<div class="character">
					<b>商品詳細:</b><s:property value="session.productDescription" /><br>
				</div>
				<div class="character">
					<b>カテゴリ:</b><s:property value="session.categoryName" /><br>
				</div>
				<div class="character">
					<b>値段:</b><s:property value="session.price" />円<br>
				</div>
				<div class="character">
					<b>発売日:</b><s:property value="session.releaseDate" /><br>
				</div>
				<div class="character">
					<b>ステータス:</b><s:property value="session.StatusName" /><br>
				</div>


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
			<div class="button">
			<input type="button"
				onclick="location.href='<s:url action="ProductInsertCompleteAction" />'"
				value="完了" />
			<br>
				<input type="button"
				onclick="location.href='<s:url action="GoProductInsertAction" />'"
				value="訂正" />
			<br>
			</div>
		</div>
	</div>
	<jsp:include page="includeFooter.jsp" />
</body>
</html>