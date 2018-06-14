<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<!-- <meta http-equiv="refresh" content="3;URL='StartAction'"> -->
<title>商品購入画面</title>
<style type="text/css">

.bbbb {
position:relative;
 width:300px;
 margin:0 auto;
}

.thankyou {
position:relative;
  width:200px;
margin:0 auto;
}

</style>
</head>
<body>
<div id="main">
<div id="top"><!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
</div>
<div class="thankyou"><img  src="./images/thankyou.JPG" ></div>
<div class ="bbbb">
<span>購入手続きが完了しました。</span><br>
<span>3秒後にHOME画面に移動します。</span>
</div></div>

<!-- ヘッダー -->
	<jsp:include page="includeFooter.jsp"/>

<div id="pr">

</div>
</body>
</html>