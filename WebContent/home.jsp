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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
    $('.bgslideshow img:gt(0)').hide();
    setInterval(function() {
      $('.bgslideshow :first-child').fadeOut(5000)
        .next('img').fadeIn(5000)
      .end().appendTo('.bgslideshow');
    }, 4000);
  });
</script>


<title>ホーム画面</title>

<style type="text/css">

/*    body { */
/*             background-image:url("./images/haikei2.jpg"); */
/*     	background-size:cover; */
/*     } */

   .bgslideshow { position: fixed; left:0; top:0; z-index: -1; height: 100%; width: 100%; }
   .bgslideshow img { position: absolute; min-height: 90%; min-width: 100%; width: 100%; height: 100%;left:0; top:0; }


</style>
</head>
<body>

	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<div class="bgslideshow">
<img  src="./images/wine1.jpg">
<img  src="./images/sozai4.jpg" >
<img  src="./images/sraido1.jpeg" >
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