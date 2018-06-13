<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="./css/master.css">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>管理画面</title>
<style type="text/css"></style>
</head>
<body>
	<div class="header">
		<jsp:include page="includeHeader.jsp" />
	</div>
	<div class="main">
		<h1>管理画面</h1>
		<div class="button">
			<input type="button"
				onclick="location.href='<s:url action="GoProductInsertAction" />'"
				value="新商品追加" />
			<br>

			<s:if test="dMessage !=''">
					<s:property value="dMessage" escape="false" />
			</s:if>
		</div>
		<!-- 商品一覧 -->
			<s:iterator value="productInfoDTOList">
				<div class="product_container">
					<s:form action="DeleteOrUpdateAction">
						<s:hidden value= "%{productId}" name="productId" />
						<img src='<s:property value="imageFilePath"/>'/> <br>
						<b><s:property value="productName" /></b><br>
						<s:property value="productNameKana" /><br>
						<s:property value="price" />円<br>

						<span>
							<button class="button" type="submit" name="deleteFlg"
								onclick='return confirm("削除してよろしいですか？")'>削除</button>
						</span>
						<span>
							<button class="button" type='submit' name='changeFlg'>商品情報変更</button>
						</span>
					</s:form>
				</div>
			</s:iterator>
	</div>
<jsp:include page="includeFooter.jsp" />
</body>
</html>