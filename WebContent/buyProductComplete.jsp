<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>商品購入画面</title>
<style type="text/css">

.bbbb {
position:relative;
 width:700px;
 margin:0 auto;
}

</style>
</head>
<body>
<div id="main">
<div id="top"><!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
</div>
<div class ="bbbb">
<span>購入手続きが完了しました。</span><br>
<a href='<s:url action="GoMyPageAction"/>'>マイページ</a><span>から購入履歴の確認が可能です。</span><br>
<span>Homeへ戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></span>


</div></div>

<!-- ヘッダー -->
	<jsp:include page="includeFooter.jsp"/>

<div id="pr">

</div>
</body>
</html>