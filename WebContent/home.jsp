<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="">
<!-- <link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
$(document).ready(function(){
$('.abc').bxSlider({
auto: true,
mode: 'fade',
speed: 1000,
slideWidth: 500,
pager:false,
});

});
</script>


<title>ホーム画面</title>

<style type="text/css">

body {
 	background-image:url("./images/haikei2.jpg");
}

.bx-wrapper{
position:relative;
 left:50px;
 bottom:570px;
 margin: none !important;
 -moz-box-shadow: none !important;
 -webkit-box-shadow: none !important;
 box-shadow: none !important;
 border: none !important;
 background: none !important;
 }

</style>
</head>
<body>
	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<div class="abc">
 <div><img src="./images/haikei1.jpg"></div>
 <div><img src="./images/haikei2.jpg"></div>
 <div><img src="./images/haikei3.jpg"></div>
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