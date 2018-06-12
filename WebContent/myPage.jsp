<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Style-Type" content="text/css"/>

	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<link rel="stylesheet" type="text/css" href="">
	<link rel="stylesheet" href="./css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Arizonia|Cinzel|Cormorant+Garamond" rel="stylesheet">
<title>マイページ</title>

  <style type="text/css">


    #top{
    		width:780px;
    		margin:20px auto;
/*      border:1px solid #333; */
    		text-align:center;
    		font-size:20px;

    }



    body{
    		margin:0;
    		padding:0;
    		line-height:1.6;
    		letter-spacing:1px;
    		font-size:12px;
    		color:#333;

    }


/* テーブル編集 */
    table.myPage{
    		text-align:center;
    		margin:0 auto;
/*         	background-color: rgba(41,51,61,0.1); */
			border: double 3px black;
    }

		table.myPage th,td{
			width: 150px;
			height: 50px;
		}

			table.myPage th{
				text-align:left;
				font-weight: 200;
			}


    #main{
    		width:100%;
    		height:500px;
    		text-align: center;
    }




/* ボタン編集 */
	.submit_button{
			text-align: center;
	}

    input#productHistory{

   			dorder: ridge;

    }

    input#goHome{

			dorder: ridge;
    }


</style>


</head>
<body>
	<jsp:include page="includeHeader.jsp"/>
<div class="main">

	<div id = "top">
			<p>MyPage</p>
	</div>

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
			<th>メールアドレス</th>
			<td>

				<s:property value="email"/>

			</td>
		</tr>


<!-- 		<tr> -->
<!-- 			<th>ID</th> -->
<!-- 			<td> -->
<%-- 				<s:property value="userId"/> --%>
<!-- 			</td> -->
<!-- 		</tr> -->

<!-- 		<tr> -->
<!-- 			<th>パスワード</th> -->
<!-- 			<td> -->
<%-- 				<s:property value="password"/> --%>
<!-- 			</td> -->
<!-- 		</tr> -->

	</table>


	</s:iterator>



 <div class = "submit_button">
			<p><s:form action="GoBuyProductHistoryAction">
					<input id = "productHistory" type= "submit" name = "submit" value="商品履歴">
			</s:form></p>



			<p><s:form action="GoHomeAction">
				<input id = "goHome" type= "submit" name = "submit" value="ホーム画面へ">
			</s:form></p>
 </div>


</div>

	<jsp:include page="includeFooter.jsp"/>

</body>
</html>