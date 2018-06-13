<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cssサンプルページ</title>

<style>

#main {
	width:100%;
	min-height:700px;

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

	/* background-image:url("../images/sozai7.JPG"); */

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

</style>
</head>
<body>

	<div id="main">

		<div id="title">
			<img src="./images/sozai7.JPG"/>
		</div>



		<div id="container" class="clearfix">

			<!-- 9個並べる系 ここから -->

			<!-- <div id="wrapper" class="ratio-1_1">
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
			</div> -->

			<!-- 9個並べる系 ここまで -->

			<!-- width100%系 ここから -->

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

			<!-- width100%系 ここまで -->

		</div>

		<div id="menu">
			menu
		</div>

		<div id="footer">
			Regalo.
		</div>

	</div>


</body>
</html>