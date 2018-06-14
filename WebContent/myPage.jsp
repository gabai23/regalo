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
    table.myPage{
    		text-align:center;
    		margin:0 auto;
    		color: white;
    		font-family: cursive,serif;

    }

		table.myPage th,td{
			width: 150px;
			height: 50px;
			font-size: 18px;
		}

			table.myPage th{
				text-align:left;
				font-weight: 200;
				padding: 20px 0px 20px 0px;
			}

			table.myPage td{
				text-align:left;
				font-weight: 180;
				padding-left: 50px;
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
		<div id="menu">
				<jsp:include page="includeHeader.jsp"/>
		</div>

	<div id="main">

		<div id = "title">
				<span>MY PAGE</span>
		</div>

		<div id = "container">

			<s:iterator value="myPageList">

					<table class="myPage">
							<tr>
									<th>氏名</th>
									<td>
											<s:property value="familyName"/>
											<s:property value="firstName"/>
									</td>
							</tr>

							<tr>
									<th>ふりがな</th>
									<td>
											<s:property value="familyNameKana"/>
											<s:property value="firstNameKana"/>
									</td>
							</tr>

							<tr>
									<th>性別</th>
									<td>
											<s:if test="sex==0">男性</s:if>
											<s:else>女性</s:else>
									</td>
							</tr>

							<tr>
									<th>メール</th>
									<td>
											<s:property value="email"/>
									</td>
							</tr>
					</table>


			</s:iterator>




							<s:form action="GoBuyProductHistoryAction">
							<div id = "goHistory">
									<button type="submit">商品履歴</button>
							</div>
							</s:form>



		</div>

	</div>
			<div id="footer">
			Regalo.
		</div>






<!-- フッダー -->
<%-- 	<jsp:include page="includeFooter.jsp"/> --%>

</body>
</html>