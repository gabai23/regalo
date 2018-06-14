<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/ProductUpdate.css">

<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>商品情報更新</title>
</head>
<body>
<!-- ヘッダー -->
<%-- <jsp:include page="includeHeader.jsp"/> --%>



<!-- 	<p> -->
<%-- 		<a href='<s:url action="ItemInsertConfirmAction"/>'>追加商品確認</a>
 --%>
<%-- 		<s:form action="ProductInsertConfirmAction" >

					<p class="name">
						<label>商品ID</label>
					</p>
					<p>

						<s:textfield class="field" name="productId" value="%{productId}"
							placeholder="半角数字"
							onKeyup="this.value=this.value.replace(/[^0-9]+/i,'')"   required="" />
					</p>

					<p class="name">
						<label>商品名</label>
					</p>
					<p>
						<s:textfield class="field" name="productName"
							value="%{productName}" placeholder="50文字以下で入力"  required="" />
					</p>




					<p class="name">
						<label>商品名(ひらがな,カナ)</label>
					</p>
					<p>
						<s:textfield class="field" name="productKanaName"
							value="%{productKanaName}" placeholder="80文字以下で入力"  required="" />
					</p>



					<p class="name">
						<label>商品カテゴリー</label>
					</p>
					<p>
						<select name="category">
							<option value="1" selected="selected">車</option>
							<option value="2">音楽・映画</option>
							<option value="3">家電</option>
						</select>
					</p>




					<p class="name">
						<label>価格</label>
					</p>
					<p>
						<s:textfield class="field" name="price" value="%{price}"
							placeholder="半角数字"
							onKeyup="this.value=this.value.replace(/[^0-9]+/i,'')" />
					</p>


					<p class="name">
						<label>画像名</label>
					</p>
					<p>
						<s:textfield class="field" name="imageName" value="%{imageName}"
							placeholder="30文字以下で入力" />
					</p>


					<p class="name">画像</p>


					<input type="file" accept='image/*' name="file" id="file"  required/>


					<p class="name">

						<label>会社名</label>
					</p>
					<p>
						<s:textfield class="field" name="company" value="%{company}"
							placeholder="30文字以下で入力" />
					</p>

					<p class="name">
						<label>商品詳細</label>
					</p>
					<p>
						<s:textarea class="text" name="description" value="%{description}" />
					</p>

					<!-- 登録ボタン -->

					<input class="button" type="submit" value="登録確認">




				</s:form>
 --%>
<!--  メイン -->

<div id="main">


<div id="title">
ProductUpdate
</div>
<div id="container">

<div id="form-box">


<%-- <s:if test="!#session.productIdErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 		<s:iterator value="#session.productIdErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>
<%-- <s:if test="!#session.productNameErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.productNameErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- </div> -->
<!-- </div> -->
<%-- </s:if> --%>
<%-- <s:if test="!#session.productNameKanaErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.productNameKanaErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>
<%-- <s:if test="!#session.productDescriptionErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.productDescriptionErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>
<%-- <s:if test="!#session.priceErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.priceErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>
<%-- <s:if test="!session.imageFileNameErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.imageFileNameErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>
<%-- <s:if test="!#session.releaseCompanyErrorMessageList.isEmpty()"> --%>
<!-- 	<div class="error"> -->
<!-- 	<div class="error-message"> -->
<%-- 	<s:iterator value="#session.releaseCompanyErrorMessageList"><s:property /><br></s:iterator> --%>
<!-- 	</div> -->
<!-- 	</div> -->
<%-- </s:if> --%>

<br>

<!-- <table class="vertical-list-table"> -->
<!-- <tr> -->
<!-- 	<th scope="row">商品ID</th> -->
<%-- 	<td><s:textfield name="productId" value="%{#session.productId}" label="商品ID" placeholder="商品ID" class="txt" /></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">商品名</th> -->
<%-- 	<td><s:textfield name="productName" value="%{#session.productName}" label="商品名" placeholder="商品名" class="txt" /></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">商品名かな</th> -->
<%-- 	<td><s:textfield name="productNameKana" value="%{#session.productNameKana}" label="商品名かな" placeholder="商品名かな" class="txt" /></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">商品詳細</th> -->
<%-- 	<td><s:textfield name="productDescription" value="%{#session.productDescription}" label="商品詳細" placeholder="商品詳細" class="txt" /></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">商品カテゴリー</th> -->
<!-- 	<td> -->
<%-- 		<select name="categoryId"> --%>
<!-- 			<option value="1" selected="selected">車</option> -->
<!-- 			<option value="2">音楽・映画</option> -->
<!-- 			<option value="3">家電</option> -->
<%-- 		</select> --%>
<!-- 	</td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">価格</th> -->
<%-- 	<td><s:textfield name="price" list="%{#session.price}" value="%{#session.price}" label="価格" placeholder="価格"/></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">画像ファイル名</th> -->
<%-- 	<td><s:textfield name="imageFileName" value="%{#session.imageFileName}" label="画像ファイル名" placeholder="画像ファイル名" class="txt" /></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">画像</th> -->
<!-- 	<td><input type="file" accept='image/*' name="imageFilePath" id="file" /><td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<th scope="row">販売会社</th> -->
<%-- 	<td><s:textfield name="releaseCompany" value="%{#session.releaseCompany}" label="販売会社" placeholder="販売会社" class="txt" /></td> --%>
<!-- </tr> -->

<!-- </table> -->

<s:form action="ProductUpdateConfirmAction">

<!-- 商品ID -->

<span class="error">
	<s:if test="!#session.productIdErrorMessageList.isEmpty()">
	<span class="error-message">
		<s:iterator value="#session.productIdErrorMessageList"><s:property /><br></s:iterator>
	</span>
</s:if>
</span>
	<span id="form-title">商品ID</span>
<span id="form-text">
	<s:textfield name="productId" value="%{#session.productId}" label="商品ID" placeholder="商品ID" class="txt" /></span><br><br>



<!-- 商品名 -->

<span class="error">
<s:if test="!#session.productNameErrorMessageList.isEmpty()">

	<span class="error-message">
	<s:iterator value="#session.productNameErrorMessageList"><s:property /><br></s:iterator>
</span>
</s:if>
</span>

<span id="form-title">商品名</span>
<span id="form-text">
	<s:textfield name="productName" value="%{#session.productName}" label="商品名" placeholder="商品名" class="txt" /></span><br><br>

<!-- 商品名かな -->

<span class="error">
<s:if test="!#session.productNameKanaErrorMessageList.isEmpty()">
	<span class="error-message">
	<s:iterator value="#session.productNameKanaErrorMessageList"><s:property /><br></s:iterator>
	</span>
</s:if>
</span>
<span id="form-title">商品名かな</span>
<span id="form-text">
<s:textfield name="productNameKana" value="%{#session.productNameKana}" label="商品名かな" placeholder="商品名かな" class="txt" /></span><br><br>

<!-- 商品詳細 -->
<span class="error">
<s:if test="!#session.productDescriptionErrorMessageList.isEmpty()">

	<span class="error-message">
	<s:iterator value="#session.productDescriptionErrorMessageList"><s:property /><br></s:iterator>
	</span>

</s:if></span>

<span id="form-title">商品詳細</span>
<span id="form-text">
	<s:textfield name="productDescription" value="%{#session.productDescription}" label="商品詳細" placeholder="商品詳細" class="txt" /></span><br><br>

<!-- 商品カテゴリー -->

	<span id="form-title"><span>商品カテゴリー</span>

		<select name="categoryId">
			<option value="1" selected="selected">車</option>
			<option value="2">音楽・映画</option>
			<option value="3">家電</option>
		</select><br><br>
</span>

<!-- 価格 -->
<span class="error">
<s:if test="!#session.priceErrorMessageList.isEmpty()">

	<span class="error-message">
	<s:iterator value="#session.priceErrorMessageList"><s:property /><br></s:iterator>
	</span>

</s:if>
</span>
	<span id="form-title">価格</span>
	<span id="form-text">
	<s:textfield name="price" list="%{#session.price}" value="%{#session.price}" label="価格" placeholder="価格"/></span><br><br>


<!-- 画像ファイル名 -->
<span class="error">
<s:if test="!session.imageFileNameErrorMessageList.isEmpty()">

	<span class="error-message">
	<s:iterator value="#session.imageFileNameErrorMessageList"><s:property /><br></s:iterator>
	</span>

</s:if></span>

	<span id="form-title">画像ファイル名</span>
	<s:textfield name="imageFileName" value="%{#session.imageFileName}" label="画像ファイル名" placeholder="画像ファイル名" class="txt" /><br><br>

<!-- 画像 -->


<div id="form-title"><span>画像</span>
	<input type="file" accept='image/*' name="imageFilePath" id="file" /><br><br>
</div>

<!-- 販売会社 -->
<span class="error">
<s:if test="!#session.releaseCompanyErrorMessageList.isEmpty()">

	<span class="error-message">
	<s:iterator value="#session.releaseCompanyErrorMessageList"><s:property /><br></s:iterator>
	</span>

</s:if></span>

	<span id="form-title">販売会社</span>
	<s:textfield name="releaseCompany" value="%{#session.releaseCompany}" label="販売会社" placeholder="販売会社" class="txt" />
<br><br>
<div class="submit_btn_box">
<span id="contents-btn-set">

<input type="button"
	onclick="location.href='<s:url action="GoMasterAction" />'"
	value="戻る" />
</span>

<span id="contents-btn-set">
<s:submit value="登録" class="submit_btn" />


</span>
</div>

</s:form>
</div>
</div>

</div>
<!-- フッター -->
<jsp:include page="includeFooter.jsp"/>



</body>
</html>