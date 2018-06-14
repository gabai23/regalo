<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>

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
  	}


     .clear{
     		clear: both;
     }


    	.productHistory{
/*     			width: 500px; */
/*     			height: 150px; */
     	}


     			 #image{
     			 		float: left;
      					width: 150px;
     					height: 150px;
      			}



   				 .alldelete{
    					text-align: center;

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

		<div id="menu">
				<jsp:include page="includeHeader.jsp"/>
		</div>



			<div id="main">

						<div id ="title">
								<span>HISTORY</span>
						</div>


				<div id="container">


			<div id="wrapper" class="ratio-1_1">
				<div id="product">


					<!--購入がない場合 -->
						<div class = "textnasi">
								<s:if test = "historyList.size() == 0">
										<h2>購入情報はありません</h2>
								</s:if>
						</div>



					<!-- 購入履歴がある場合 -->

						<s:elseif test = "historyList !=null && historyList.size() !=0">
							<div id = "wrapper" class= "rario-1_1">

							<div class="productHistory">


									<s:form action="GoBuyProductHistoryAction"></s:form>

									<s:iterator value = "historyList">


											<!-- 画像 -->
											<img id = "image" src="<s:property value='imageFilePath'/>"><br>

<!-- 											<div class = "clear"></div> -->

											<!-- 商品名 -->
											<div class = "text">
													<s:property value = "productName" /><br>
											</div>

											<!-- 商品名かな -->
											<div class = "text">
													<s:property value = "productNameKana" /><br>
											</div>

											<div class = "text">
													値　　段　：<s:property value="price" /><br>
											</div>

											<div class = "text">
													発売会社名：<s:property value="releaseCompany" /><br>
											</div>

											<div class = "text">
													発売年月日：<s:property value="releaseDate" /><br>
											</div>

									</s:iterator>
									<div class = "clear"></div>

							</div>
							</div>

						</s:elseif>
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
	</div>



		<div id="footer">
			Regalo.
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