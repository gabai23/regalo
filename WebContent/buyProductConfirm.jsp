<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- 金額、日付表示カスタムタグ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mt_style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/settlement_style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>




<title>決済確認画面</title>
</head>
<body>

<!-- ここからヘッダー -->
	<jsp:include page="includeHeader.jsp" />
<!-- ヘッダーここまで -->



<!-- ここからメイン -->
<div class="main">
	<br>
	<h2 class="title">決済確認</h2>
	<br>

	<s:form action="BuyProductCompleteAction">
		<p class="message">購入情報は以下になります</p>
		<br>

	<s:iterator value="cartList">
		<div class="border">
		</div>

		<!-- 画像 -->
		<div class="main_content clearfix_kudo" style="overflow: hidden;">

			<div class="pro_img">
				<s:url id="url" action="ProDetailAction"><s:param name="id" value="productId" /></s:url>
					<s:a href="%{url}">
						<img src='<s:property value="imageFilePath"/>' alt="画像なし"/>
					</s:a>
			</div>

			<div class="pro_text">
				<div class="name">
					<s:url id="url" action="ProDetailAction"><s:param name="id" value="productId" /></s:url>
						<s:a href="%{url}">
							<!-- ふりがな -->
							<div class="kana">
								<s:property value="productNameKana" />
							</div>

							<!-- 商品名 -->
							<div class="pro_name">
								商品名:<s:property value="productName" />
							</div>
						</s:a>
				</div>


			<div class="price_count">
		    	<!-- 値段 -->
		    	<div class="price">
					価格:&yen;<fmt:formatNumber value="${price}" />
				</div>

				<!-- 個数 -->
				<div class="count">
					(購入数:  <s:property value="productCount" />点)
				</div>
			</div>


			<div class="comp_info">
				<!-- 発売会社 -->
				<div class="company">
					発売会社：<s:property value="releaseCompany" />
				</div>

				<!-- 年月日 -->
				<div class="releaseDate">
					発売日：
					<fmt:parseDate var="date2" value="${ReleaseDate}" pattern="yyyy-MM-dd" /><fmt:formatDate value="${date2}" pattern="yyyy年M月d日" />
				</div>
			</div>
		</div>
		</div>
	</s:iterator>
		<div class="border">
		</div>

		<br>
		<br>
		<div class="totalprice">
			合計金額:&yen;
			<fmt:formatNumber value="${totalPrice}" />
		</div>
		<br>

		<!-- 宛先情報 -->
		<s:iterator value="addressInfoListDTO">
			<div class="box">
				<div class="destination_title">
					<label>
						<input type="radio" name="id" checked="checked"/>
						お届け先住所
					</label>
				</div>
				<div class="destination_box">
					ふりがな:
					<s:property value="familyNameKana"/>
					<s:property value="firstNameKana"/>
					<br>
					名前:
					<s:property value="familyName"/>
					<s:property value="firstName"/>
					<br>
					住所:
					<s:property value="userAddress"/>
					<br>
					電話番号:
					<s:property value="telNumber"/>
					<br>
					メールアドレス:
					<s:property value="email"/>
					<br>
				</div>
			</div>
		</s:iterator>

		<div class="box_2">
			<div class="btn_1">
				<input type="button" value="宛先情報の新規登録"
				onclick="location.href='<s:url action="GoAddressCreateAction" />'">
			</div>
			<div class="btn_2">
				<button type="submit">購入</button>
			</div>
		</div>
	</s:form>
</div>
<br>
<br>

<!-- ページリンク -->
		<div class= "back">
			<a href='<s:url action="GoCartAction" />'>カートに戻る</a>
		</div>
<!-- ページリンクここまで -->

<!-- メインここまで -->

<!-- フッター -->
	<span><jsp:include page="includeFooter.jsp" /></span>
<!-- フッターここまで -->

</body>
</html>
















