<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>


	<link rel="stylesheet" type="text/css" href="./css/style.css">


	<link rel="stylesheet" type="text/css" href="">
	<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">


<title>マイページ</title>

  <style type="text/css">


/* テーブル編集 */



	.myPage{
 			text-align:center;
    		margin:0 auto;
    		color: white;
    		font-family: cursive,serif;
    		width: 50%;
			height: 50%;
			padding-top: 30px;
			padding-left: 15px;
	}

		.text{
				text-align:left;
				font-weight: 300;
				font-size: 18px;
				margin: 20px 20px 20px 20px;

		}

		.myPageDate{
				text-align:inherit;
				font-weight: 300;
				font-size: 25px;
				margin: 30px 20px 30px 20px;

		}

		.myPagEwmail{
				text-align:inherit;
				font-weight: 300;
				font-size: 25px;
				margin: 30px 20px 30px 20px;
				font-family: Vollkorn;
		}


/* ボタン編集 */
    #goHistory{
			text-align: center;
			padding-top: 50px;
			padding-bottom: 50px;


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
<!-- ヘッダー -->
		<jsp:include page="includeHeader.jsp"/>


	<div id="main">

		<div id = "title">
				<span>MY PAGE</span>
		</div>

		<div id = "container">

			<s:iterator value="myPageList">

					<div class="myPage">

									<div class="text">氏名</div>
									<div class=myPageDate>
											<s:property value="familyName"/>
											<s:property value="firstName"/>
									</div>

									<div class="text">ふりがな</div>
									<div class=myPageDate>
											<s:property value="familyNameKana"/>
											<s:property value="firstNameKana"/>
									</div>

									<div class="text">性別</div>
									<div class=myPageDate>
											<s:if test="sex==0">男性</s:if>
											<s:else>女性</s:else>
									</div>

									<div class="text">メール</div>
									<div class=myPagEwmail>
											<s:property value="email"/>
									</div>

					</div>



			</s:iterator>




							<s:form action="GoBuyProductHistoryAction">
							<div id = "goHistory">
									<button type="submit">商品履歴</button>
							</div>
							</s:form>



		</div>


	</div>








<!-- フッダー -->
	<jsp:include page="includeFooter.jsp"/>

</body>
</html>