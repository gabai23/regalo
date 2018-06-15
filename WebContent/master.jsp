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
	<!-- ヘッダー -->
 	<jsp:include page="includeHeader.jsp"/>
	<header>
		<div id=title>Master</div>
	</header>
	<div id="main">
		<div id="container">
			<div class="insert_box">
				<p>新商品を追加する場合は</p>
				<input type="button" class="insert_btn"
					onclick="location.href='<s:url action="GoProductInsertAction" />'"
					value="こちら" />
				<br>

				<s:if test="dMessage !=''">
						<s:property value="dMessage" escape="false" />
				</s:if>
			</div>
			<!-- 商品一覧 -->
			<table class="horizontal-list-table">
				<s:iterator value="productInfoDTOList">
					<s:form action="DeleteOrUpdateAction">
						<tr>
							<td><img src='<s:property value="imageFilePath"/>' width="200px" height="200px" /></td>
							<td>
								<table>
									<s:hidden value= "%{productId}" name="productId" />
									<tr><td>商品名</td><td><s:property value="productName"/></td></tr>
									<tr><td>ふりがな</td><td><s:property value="productNameKana"/></td></tr>
									<tr><td>値段</td><td><s:property value="price"/></td></tr>
									<tr><td>発売会社名</td><td><s:property value="releaseCompany"/></td></tr>
									<tr><td>発売年月</td><td><s:property value="releaseDate"/></td></tr>
									<tr><td>商品詳細</td><td><s:property value="productDescription"/></td></tr>

								</table>
								<%-- <ul>
									<li>商品名　<s:property value="productName"/></li>
									<li>ふりがな　<s:property value="productNameKana"/></li>
									<li>値段　<s:property value="price"/>円</li>
									<li>発売会社名　<s:property value="releaseCompany"/></li>
									<li>発売年月　<s:property value="releaseDate"/></li>
									<li>個数　<s:property value="productCount"/></li>
									<li>小計　<s:property value="subtotal"/>円</li>
								</ul> --%>
							</td>

							<td>
								<button class="contents-btn-set" type="submit" name="deleteFlg"
									onclick='return confirm("削除してよろしいですか？")'>削除</button>

								<button class="contents-btn-set" type='submit' name='changeFlg'>変更</button>
							</td>
						</tr>
					</s:form>
				</s:iterator>
			</table>
		</div>
	</div>
<footer>
	<jsp:include page="includeFooter.jsp" />
</footer>
</body>
</html>