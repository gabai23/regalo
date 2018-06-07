<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="">
<!-- <link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<script type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="js/jquery.bgswitcher.js"></script>
<script>
jQuery(function($) {
    $('.bg-slider').bgSwitcher({
        images: ['haikei.jpg','haikei2.jpg','haikei3.jpg'], // 切り替える背景画像を指定
    });
});
</script>

<title>ホーム画面</title>

<style type="text/css">

  body {
   	background-image:url("./images/haikei2.jpg");
   	background-size:cover;
  }
.bg-slider {
	width: 100vw;
	height: 100vh;
	background-position:center center;
	background-size: cover;
	display: flex;
	align-items: center;
	justify-content: center;
}
.bg-slider__title{
	color: #fff;
	font-size: 48px;
	line-height: 1.5;
	font-weight: bold;
	text-align:center;
	text-shadow: 1px 1px 1px #000;
}
</style>
</head>
<body>

	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<div class="bg-slider">
  <h1 class="bg-slider__title">BGSWITCHER DEMO PAGE</h1>
</div>
	<form action="GoLoginAction">
		<button type="submit">ログインへ</button>
	</form>

	<form action="GoMyPageAction">
		<button type="submit">マイページへ</button>
	</form>


	<form action="GoCartAction">
		<button type="submit">カートへ</button>
	</form>


	<form action="GoProductListAction">
		<button type="submit">商品一覧へ</button>
	</form>

	<form action="GoMasterAction">
		<button type="submit">管理者画面へ</button>
	</form>

	<!-- ヘッダー -->
<%-- 	<jsp:include page="includeFooter.jsp"/> --%>

</body>
</html>