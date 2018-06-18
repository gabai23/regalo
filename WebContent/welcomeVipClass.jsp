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
<!-- <meta http-equiv="refresh" content="5;URL='GoProductListAction'"> -->
<title>ウェルカムランクアップ</title>

<style>

html {
	width:100%;
	height:100%;
}

body {
	background:#980303;
	width:100%;
	height:100%;
}

#box {
	margin:0 auto;
	background:black;
}

svg {
	width:80%;
	height:100%;
}

text {
    /* 色はお好みで */
    stroke:#daa520 ;
    /* 色はお好みで */
    fill: #daa520;
    /* 文字が大きい方がアニメーションが綺麗なので50pxを指定 */
    font-size: 80px;
    /* 100%だと最後まで表示されないので多めに設定する */
    stroke-dasharray: 100% 100%;
    /* 線が細いほうがアニメーションが綺麗なので0.5pxを指定 */
    stroke-width: 0.3px;
    -webkit-animation: stroke-anim 5s linear;
    animation: stroke-anim 3s linear;
    text-align:center;
	font-family: 'Cinzel', serif;
	position:relative;

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
    fill:#daa520;
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
    fill:#daa520;
}
}


.wrapper {
  margin: 150px auto;
  text-align: center;
  width: 100%;
  position: relative;
}

.btn{
  padding: 15px 100px;
  margin:10px 4px;
  color: #fff;
 	font-family: 'Cinzel', serif;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  text-decoration: none;
  display:inline-block;
   font-size: 80px;

}

.btn{
  border:1px solid transparent;
   -webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
  transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
}

.btn::before {
  content: '';
  position: absolute;
  left: 0px;
  bottom:0px;
  z-index:-1;
  width: 0%;
  height:1px;
  background: #daa520;
  box-shadow: inset 0px 0px 0px #daa520;
  display: block;
  -webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
  transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}

.btn:hover::before {
  width:100%;
}

.btn::after {
  content: '';
  position: absolute;
  right: 0px;
  top:0px;
  z-index:-1;
  width: 0%;
  height:1px;
  background: #daa520;
  -webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
  transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
}
.btn:hover::after {
  width:100%;
}
.btn:hover{
  border-left:1px solid #daa520;
  border-right:1px solid #daa520;
}

</style>

</head>
<body>



<!-- <div class="wrapper"> -->
<!--     <a href="#" class="btn">Welcome VIP CLASS</a> -->
<!--     </div> -->

 <svg>
    <text x="36%" y="50%">Welcome VIP CLASS</text>
</svg>
</body>
</html>