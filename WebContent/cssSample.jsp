<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cssサンプルページ</title>

<style>

#main {
	width:80%;
	margin-top:150px;
	margin-bottom:150px;
	padding:2.5%;

	background:grey;
}

#menu {
	position:fixed;

	top:0;
	right:0;

	width:5%;
	height:100%;

	padding:5px;

	opacity:0;

	color:grey;
}

#menu:hover {
	position:fixed;

	top:0;
	right:0;

	width:15%;
	height:100%;

	padding:5px;

	background:white;

	color:grey;

	opacity:1;
}



#title {
	width:100%;
	height:auto;

	background:black;

	font-size:50px;

	margin-bottom:10%;

	color:white;

	text-align:center;
}

#container {
	width:85%;
	height:auto;

	background:black;

	margin-left:7.5%;
	margin-right:7.5%;
	margin-bottom:10%;
}

#wrapper {
	position:relative;

	width:21.25%;
	height:auto;

	margin-top:5%;
	margin-bottom:5%;
	margin-left:8.5%;

	border:1px solid white;

	float:left;

	color:white;
}

#wrapper2 {
	width:100%;
	height:150px;
	margin-top:10px;
	/* border-bottom:1px solid white; */
	background:silver;
	color:white;
}
#wrapper2:hover {
	width:100%;
	height:150px;
	/* border-bottom:1px solid white; */
	background:black;
	color:white;
}

#product {
	position:absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%,-50%);
	-moz-transform: translate(-50%,-50%);
	-ms-transform: translate(-50%,-50%);
	-o-transform: translate(-50%,-50%);
	transform: translate(-50%,-50%);
}

#footer {
	width:100%;
	height:auto;

	padding:10px;



	background:black;
	color:white;

	font-size:24px;

	text-align:center;
}

.ratio-1_1:before {
	content: "";
	display: block;
	padding-top: 100%; /* ratio */
}

/* for modern brouser */
		.clearfix:after {
		  content: ".";
		  display: block;
		  clear: both;
		  height: 0;
		  visibility: hidden;
		}
		/* IE7,MacIE5 */
		.clearfix {
		  display: inline-block;
		}
		/* WinIE6 below, Exclude MacIE5 \*/
		* html .clearfix {
		  height: 1%;
		}
		.clearfix {
		  display: block;
		}
		/**/

/* サイドメニュー ※リストのスタイルは省略 */
.side-menu {
  position: fixed;
  top: 0;
  right: 0;
  width: 312px;
  height: 100%;
  padding-top: 150px;
  text-align: left;
  font-size: 13px;
  background: #2A408E;

    transition: all 0.5s;
    transform: translate(312px);


}

.side-menu.open {
    transform: translate(0);
   }

/* 開閉用ボタン ※ボタンの細かいスタイルは省略 */
.side-menu-btn {
  position: fixed;
  top: 20px;
  right: 20px;
  width: 40px;
  height: 40px;
  padding: 5px;
  cursor: pointer;
  z-index: 4;
}

/* サイドオープン時にメインコンテンツを覆う部分 */
.overlay {
  content: '';
  visibility: hidden;
  position: fixed;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0);
  -webkit-transition: all .5s ease;
  transition: all .5s ease;
  z-index: 3;
}
.overlay::after {
  content: "この部分をクリックで閉まる";
  visibility: hidden;
  position: fixed;
  top: 40%;
  left: 0;
  display: block;
  width: 100%;
  height: 50px;
  color: rgba(255,255,255,0);
  font-size: 40px;
  font-weight: bold;
  text-align: center;
  -webkit-transition: all .5s ease;
  transition: all .5s ease;
}
.side-open .overlay {
  visibility: visible;
  cursor: pointer;
  background: rgba(0,0,0,.7);
}
.side-open .overlay::after {
  visibility: visible;
  color: rgba(255,255,255,.8);
}

/* サイドメニューオープン */
.side-open .wrapper,
.side-open .overlay {
  -webkit-transform: translate3d(-312px, 0, 0);
  transform: translate3d(-312px, 0, 0);
}

/*   ボタンタグ設定   */
   .btn_menu {
   /* position: fixed; */
  top: 20px;
  right: 20px;
  width: 40px;
  height: 40px;
  padding: 5px;
  cursor: pointer;
  z-index: 4;

    display: block;
    background: none;
    border: none;
    color: #333;
    letter-spacing: 0.1em;
    position: fixed;
    text-align: center;
    outline: none;
  }
  /*   ハンバーガーボタン3本線   */
  .btn_menu span.bar {
    display: block;
    height: 2px;
    background-color: #333;
    margin: 10px 0;
    transition: all 0.2s;
    transform-origin: 0 0;
  }
  .btn_menu .close {
    letter-spacing: 0.08em;
    display: none;
  }
  .btn_menu .menu {
    display: block;
  }
  /*  メニューアクティブ時  */
  .btn_menu.active span.bar {
    width: 49px;
  }
  .btn_menu.active .bar1 {
    transform: rotate(30deg);
  }
  .btn_menu.active .bar2 {
    opacity: 0;
  }
  .btn_menu.active .bar3 {
    transform: rotate(-30deg);
  }

</style>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
$(function(){
  $('.side-menu-btn').click(function(){
    $('.side-menu').toggleClass('open');}
  );
})
</script>

<script>
$(function () {
  var $body = $('body');
  $('#js__sideMenuBtn').on('click', function () {
    $body.toggleClass('side-open');
    $('#js__overlay').on('click', function () {
      $body.removeClass('side-open');
      $('.side-menu').removeClass('open');
    });
  });
});
</script>

<script>
// jQueryは読み込み済み前提
$(function(){
  $('.btn_menu').click(function(){
    $(this).toggleClass('active');
  });
})
</script>

</head>
<body>

  <!-- サイドオープン時メインコンテンツを覆う -->
  <div class="overlay" id="js__overlay"></div>

  <!-- 開閉用ボタン -->
	  <button type="button" class="btn_menu side-menu-btn" id="js__sideMenuBtn">
	  <span class="bar bar1"></span>
	  <span class="bar bar2"></span>
	  <span class="bar bar3"></span>
	</button>

  <!-- サイドメニュー -->
  <nav class="side-menu">

  <div class="headerLogo">
			<a class="headerA" href='<s:url action="GoHomeAction"/>'>Regalo</a></div>


		<div class="right-list">
		<ul>
		<li>
		<div class="title">menu</div>
</li>





<!-- 				マイページ -->
				<s:if test = "#session.loginFlg == true">
					<li>
						<div id="headerMypage">
							<s:form action="GoMyPageAction">
								<button class="button1" type="submit">MY PAGE</button>
							</s:form>
						</div>
					</li><br>
				</s:if>

<!-- 				商品一覧 -->
                 <li>
                 <div id ="headerProductList">
                 <s:form action="GoProductListAction">
		<button class="button1" type="submit">GIFT ITEM</button>
	</s:form>
	</div><br>
	</li>
<!-- 				カート -->
				<li>
					<div id="headerCart">
						<s:form action="GoCartAction">
							<button class="button1" type="submit">CART</button>
						</s:form>
					</div><br>
				</li>

<!-- 				ゲストユーザーのとき -->
				<s:if test="#session.loginFlg == false || #session.loginFlg == null">

					<li>
						<div id="headerLogin">
							<s:form action="GoLoginAction">
								<button class="button1" type="submit">LOGIN</button>
							</s:form>
						</div>

					</li>

				</s:if>

<!-- 				ログインユーザーのとき -->
				<s:if test="#session.loginFlg == true && session.masterFlg != true">

				<li>
					<div id="headerLogout">
						<s:form action="LogoutAction">
							<button class="button1" type="submit">LOGOUT</button>
						</s:form>
					</div>
				</li>

				</s:if>


			</ul>
		</div>

		<div id="headerSearch">
			<s:form action="ProductSearchAction" theme="simple">

					<s:select name="categoryId" list="#session.categoryList" listValue="categoryName" listKey="categoryId" class="category" id="categoryId"/>
					<br>
					<s:textfield name="searchWord"/>
					<button  class="button1" type="submit">SEARCH</button>

			</s:form>
		</div>

  </nav>

	<!-- <div id="main">

		<div id="title">
			<img src="./images/sozai7.JPG"/>
		</div>



		<div id="container" class="clearfix">

			9個並べる系 ここから
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					aaa
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					bbb
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					ccc
				</div>
			</div>

			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					aaa2
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					bbb2
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					ccc2
				</div>
			</div>

			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					aaa3
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					bbb3
				</div>
			</div>
			<div id="wrapper" class="ratio-1_1">
				<div id="product">
					ccc3
				</div>
			</div>
			9個並べる系 ここまで

			width100%系 ここから

			<div id="wrapper2">
				aaa
			</div>
			<div id="wrapper2">
				bbb
			</div>
			<div id="wrapper2">
				ccc
			</div>
			<div id="wrapper2">
				ddd
			</div>

			width100%系 ここまで

		</div>

		<div id="menu">
			menu
		</div>

		<div id="footer">
			Regalo.
		</div>

	</div> -->


</body>
</html>