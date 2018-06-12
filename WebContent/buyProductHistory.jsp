<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<link rel="stylesheet" type="text/css" href="">
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">

<title>buyProductHistory</title>


  <style type="text/css">


    #top{
    		width:780px;
    		margin:20px auto;
/*      border:1px solid #333; */
    		text-align:center;
    		font-size:20px;
    		font-weight: 500;

    }

     .clear{
     		clear: both;
     }



    body{
    		margin:0;
    		padding:0;
    		line-height:1.6;
    		letter-spacing:1px;
    		font-size:12px;
    		color:black;

    }


    #main{
    		width:100%;
    		height:auto;
    		text-align: center;
    }


    	.productHistory{
    			width: 500px;
    			height: 150px;
/*      			border: 1px solid black; */
     			margin-left: 35%;
     	}


    			 #image{
    			 		float: left;
     					width: 200px;
    					height: 150px;
/*     					padding-left: 150px */

     			}



   				 .all delete{
    					font-size: 35px;
    			}

 </style>
</head>
<body>



	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
			<div id="main">



				<div id="container">

						<div id ="top">
								<span>BuyProductHistory</span>
						</div>



					<!--購入がない場合 -->
						<div class = "nullerror">
								<s:if test = "historyList.size() == 0">
										<h2>購入情報はありません</h2>
								</s:if>
						</div>



					<!-- 購入履歴がある場合 -->

						<s:elseif test = "historyList !=null && historyList.size() !=0">

							<div class="productHistory">
									<s:form action="GoBuyProductHistoryAction">
									</s:form>

									<s:iterator value = "historyList">


											<!-- 画像 -->
											<div class = "image">
													<img id = "image" src="<s:property value='imageFilePath'/>"><br>
											</div>

<!-- 											<div class = "clear"></div> -->

											<!-- 商品名 -->
											<div class = "productName">
													<s:property value = "productName" /><br>
											</div>

											<div class = "productCount">
													個数：<s:property value="productCount"/>点<br>
											</div>

											<div class = "proce">
													値　　段　：<s:property value="price" /><br>
											</div>

											<div class = "releaseCompany">
													発売会社名：<s:property value="releaseCompany" /><br>
											</div>

											<div class = "regisDate">
													購入日時　：<s:property value="registDate"/><br>
											</div>

											<div class = "releaseDate">
													発売年月日：<s:property value="releaseDate" /><br>
											</div>

<div class = "clear"></div>

<br>


<!-- 											削除ボタン -->
<!-- 											<div class = "onedelete"> -->
<%-- 												<s:form action="GoBuyProductHistoryAction"> --%>
<!-- 														<input type="hidden" name="deleteFlg" value="2"> -->
<%-- 														<input type="hidden" name="id" value="${id}"> --%>
<%-- 													<s:submit id="deleteOneEach" value="削除" method="deleteOneEach"/> -->
<!-- 														<input id = "onedelete" type= "submit" name = "submit" value="削除"> -->
<%-- 												</s:form> --%>
<!-- 											</div> -->


									</s:iterator>

							</div>

						</s:elseif>

<div class = "clear"></div>
<br>

					<!-- 全件削除ボタン -->
						<s:if test = "historyList.size() !=0">
								<div class = "alldelete">
										<s:form action="GoBuyProductHistoryAction" onSubmit="return allDel()">
											<input type="hidden" name="deleteFlg" value="1">
											<s:submit id="alldelete" value="履歴全削除"/>
<!-- 										<input id = "allDel" type= "submit" name = "submit" value="全削除"> -->
										</s:form>
								</div>
						</s:if>

<br>

					<!-- マイページに戻る -->
						<s:form action="GoMyPageAction" class="button">
<%-- 							<s:submit value="マイページに戻る"/> --%>
								<input id = "returnMyPage" type= "submit" name = "submit" value="マイページへ戻る">
						</s:form>


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