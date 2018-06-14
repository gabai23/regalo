<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
<meta http-equiv="refresh" content="3;URL='StartAction'">
<title>インデックス</title>

<style>

html {
	width:100%;
	height:100%;
}

body {
	background:black;
	font-family: sans-serif;

	/* font-family: 'Arizonia', cursive; */
	width:100%;
	height:100%;
}

#box {
	margin:0 auto;
	background:white;
}

svg {
	width:100%;
	height:100%;
}

text {
    /* 色はお好みで */
    stroke: white;
    /* 色はお好みで */
    fill: white;
    /* 文字が大きい方がアニメーションが綺麗なので50pxを指定 */
    font-size: 150px;
    /* 100%だと最後まで表示されないので多めに設定する */
    stroke-dasharray: 100% 100%;
    /* 線が細いほうがアニメーションが綺麗なので0.5pxを指定 */
    stroke-width: 0.5px;
    -webkit-animation: stroke-anim 5s linear;
    animation: stroke-anim 3s linear;
}

@-webkit-keyframes stroke-anim {
  0% {
    /* 100%だと最後まで表示されないので多めに設定する */
    stroke-dashoffset: 100%;
    fill:transparent;
  }
  50% {
    fill:transparent;
  }
  100% {
    stroke-dashoffset: 0%;
    fill:white;
  }
}

@keyframes stroke-anim {
  0% {
    /* 100%だと最後まで表示されないので多めに設定する */
    stroke-dashoffset: 100%;
    fill:transparent;
  }
  50% {
    fill:transparent;
  }
  100% {
    stroke-dashoffset: 0%;
    fill:white;
  }
}
</style>
</head>
<body>

Regalo

<!-- 以下アニメーションを追加予定 -->

<%-- 	<div class="animArea">
        <div class="animItem" id="anim"></div>
    </div>
    <p><button id="start" class="btn btn-info">アニメーション実行</button></p>

    <script>
        $(function(){
        	TweenMax.to('#demo1Anim', 1, {left: '200px'});
        });
		//ローディングと同時スタートの場合以下を消す
        $('#start').on('click', function(){
    	    TweenMax.to('#anim', 2, {left:'200px'});
    	});
		//ここまで
    </script> --%>

    <svg>

    <!-- <text x="36%" y="50%">Regalo</text> -->

</svg>

</body>
</html>