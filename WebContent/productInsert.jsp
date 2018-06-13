<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">


<title>Insert title here</title>
</head>
<body>
	<p>
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


<div id="contents">
<h1>商品情報入力画面</h1>

<s:if test="!#session.productIdErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
		<s:iterator value="#session.productIdErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>
<s:if test="!#session.productNameErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.productNameErrorMessageList"><s:property /><br></s:iterator>
</div>
</div>
</s:if>
<s:if test="!#session.productNameKanaErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.productNameKanaErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>
<s:if test="!#session.productDescriptionErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.productDescriptionErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>
<s:if test="!#session.priceErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.priceErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>
<s:if test="!session.imageFileNameErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.imageFileNameErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>
<s:if test="!#session.releaseCompanyErrorMessageList.isEmpty()">
	<div class="error">
	<div class="error-message">
	<s:iterator value="#session.releaseCompanyErrorMessageList"><s:property /><br></s:iterator>
	</div>
	</div>
</s:if>

<s:form action="ProductInsertConfirmAction">

<table class="vertical-list-table">
<tr>
	<th scope="row">商品ID</th>
	<td><s:textfield name="productId" value="%{#session.productId}" label="商品ID" placeholder="商品ID" class="txt" /></td>
</tr>
<tr>
	<th scope="row">商品名</th>
	<td><s:textfield name="productName" value="%{#session.productName}" label="商品名" placeholder="商品名" class="txt" /></td>
</tr>
<tr>
	<th scope="row">商品名かな</th>
	<td><s:textfield name="productNameKana" value="%{#session.productNameKana}" label="商品名かな" placeholder="商品名かな" class="txt" /></td>
</tr>
<tr>
	<th scope="row">商品詳細</th>
	<td><s:textfield name="productDescription" value="%{#session.productDescription}" label="商品詳細" placeholder="商品詳細" class="txt" /></td>
</tr>
<tr>
	<th scope="row">商品カテゴリー</th>
	<td>
		<select name="categoryId">
			<option value="1" selected="selected">車</option>
			<option value="2">音楽・映画</option>
			<option value="3">家電</option>
		</select>
	</td>
</tr>
<tr>
	<th scope="row">価格</th>
	<td><s:textfield name="price" list="%{#session.price}" value="%{#session.price}" label="価格" placeholder="価格"/></td>
</tr>
<tr>
	<th scope="row">画像ファイル名</th>
	<td><s:textfield name="imageFileName" value="%{#session.imageFileName}" label="画像ファイル名" placeholder="画像ファイル名" class="txt" /></td>
</tr>
<tr>
	<th scope="row">画像</th>
	<td><input type="file" accept='image/*' name="imageFilePath" id="file" /><td>
</tr>
<tr>
	<th scope="row">販売会社</th>
	<td><s:textfield name="releaseCompany" value="%{#session.releaseCompany}" label="販売会社" placeholder="販売会社" class="txt" /></td>
</tr>

</table>
<div class="submit_btn_box">
<div id=".contents-btn-set">
<s:submit value="登録" class="submit_btn" />
</div>
</div>
</s:form>
</div>
<div id="footer">
	<s:include value="footer.jsp"/>
</div>



</body>
</html>