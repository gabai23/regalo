<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>

<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>購入履歴</title>


  <style type="text/css">

  	.textnasi{
  		text-align: center;
  		color: white;
		width: 85%;
      	height: 65%;
      	padding-top: 20%;
      	padding-left: 10%;
  	}

  	.textnasi2{
  		text-align: center;
  		color: white;
		width: 85%;
      	height: 60%;
      	padding-top: 30%;
      	padding-left: 10%;
      	padding-bottom: 15%;
  	}



     .clear{
     		clear: both;
     }


     	.productHistory{
      			width: 500px;
      			height: 300px;
      			padding-top: 10px;
      	}


      			 #image{
      			 		float: left;
       					width: 200px;
      					height: 150px;
      					padding-right: 50px;

      					z-index:99;
       			}

       			.text{
       					padding-top: px;
       			}


   				 .alldelete{
    					text-align: center;
    					margin-top: 50px;

    			}


#wrapper2 {
	width:100%;
	height:150px;
	margin-top:10px;
	/* border-bottom:1px solid white; */
	background:silver;
	color:white;
}
/* #wrapper2:hover {
	width:100%;
	height:150px;
	/* border-bottom:1px solid white; */
	/* background:black;
	color:white; */
} */



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

#container2 {
	width:50%;
	height:auto;

	background:black;

	padding-top:12%;
	margin-left:25%;
	margin-right:25%;
	margin-bottom:10%;

}

/*アニメーション用*/
.delay {
	position: relative;
	width: 100%;
}

.delay::after {
content: "";
display: block;
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
z-index:0;
}

.delay::after {
z-index:0;
width: 0%;
background-color: white;
opacity:0.3;
}
#wrapper:hover .delay::after {
width: 100%;
transition: width 0.5s linear;
}
.delay::after {
transition-delay: 0s;
}

/*アニメーション用ここまで*/

#wrapper {
width:100%;
height:auto;
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

 </style>
</head>
<body>

		<jsp:include page="includeHeader.jsp"/>



			<div id="main">

						<div id ="title">
								<span>HISTORY</span>
						</div>


				<div id="container" class="clearfix">





					<!--購入がない場合 -->
						<s:if test = "historyList.size() == 0">
								<div class = "textnasi">
										<h2>購入情報はありません</h2>
								</div>
						</s:if>



					<!-- 購入履歴がある場合 -->

					<div id = "container2">


						<s:elseif test = "historyList !=null && historyList.size() !=0">

									<s:form action="GoBuyProductHistoryAction"></s:form>

									<s:iterator value = "historyList">
									<div id="wrapper">
									<div id = "wrapper2"  class="delay">


											<!-- 画像 -->
											<img id = "image" src="<s:property value='imageFilePath'/>">

<!-- 											<div class = "clear"></div> -->

										<div class="productHistory">

											<div class = "text">
													商　品　名：<s:property value = "productName" /><br>
											</div>

											<div class = "text">
													ふりがな　：<s:property value = "productNameKana" /><br>
											</div>

											<div class = "text">
													値　　　段：<s:property value="price" /><br>
											</div>

											<div class = "text">
													発売会社名：<s:property value="releaseCompany" /><br>
											</div>

											<div class = "text">
													発売年月日：
											<fmt:parseDate var="date" value="${releaseDate}" pattern="yyyy-MM-dd HH:mm:ss.SS" />
											<fmt:formatDate value="${date}" pattern="yyyy年M月d日"/>
													<br>
											</div>

											</div>

										</div>

									</div>

									</s:iterator>

						</s:elseif>

					<!-- 購入履歴削除後 -->
						<s:else>
							<div class = "textnasi2">
									<h2>購入情報はありません</h2>
							</div>
						</s:else>




<div class = "clear"></div>


					<!-- 全件削除ボタン -->
						<s:if test = "historyList.size() !=0">
								<div class = "alldelete">
										<s:form action="GoBuyProductHistoryAction" onSubmit="return allDel()">
											<input type="hidden" name="deleteFlg" value="1">
											<button type="submit">履歴全削除</button>
										</s:form>
								</div>
						</s:if>

<br>
			</div>

			</div>

			</div>



<jsp:include page="includeFooter.jsp"/>



<script>
//全件削除確認
function allDel(){



	if(window.confirm('全件削除しますか？')){

		return true;

	} else {

		return false;

	}
}
</script>
</body>
</html>