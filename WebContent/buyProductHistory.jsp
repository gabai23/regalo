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

<title>buyProductHistory</title>
</head>
<body>


	<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
			<div id="main">

				<div id ="top">
					<p>購入履歴</p>
				</div>



			<!--購入がない場合 -->
				<s:if test = "historyList.size() == 0">
					<h2>購入情報はありません</h2>
				</s:if>



			<!-- 購入履歴がある場合 -->
				<s:elseif test = "historyList !=null && historyList.size() !=0">

				<div>
					<s:form action="GoBuyProductHistoryAction">
					</s:form>

					<s:iterator value = "historyList">


				<!-- 画像 -->
						<img id = "image" src="<s:property value='imageFilePath'/>"><br>

				<!-- 商品名 -->
						<s:property value = "productName" /><br>


				<!-- 個数 -->
						<s:property value="productCount"/>点<br>

						購入日時　：<s:property value="registDate"/><br>
						値　　段　：<s:property value="price" /><br>
						発売会社名：<s:property value="releaseCompany" /><br>
						発売年月日：<s:property value="releaseDate" /><br>

				<!-- 削除ボタン -->
						<s:form action="GoBuyProductHistoryAction">
							<input type="hidden" name="deleteFlg" value="2">
							<input type="hidden" name="id" value="${id}">
							<s:submit id="deleteOneEach" value="削除" method="deleteOneEach"/>
						</s:form>


					</s:iterator>

				</div>

				</s:elseif>

				<!-- 全件削除ボタン -->
					<s:if test = "historyList.size() !=0">
						<s:form action="GoBuyProductHistoryAction" onSubmit="return allDel()">
							<input type="hidden" name="deleteFlg" value="1">
							<s:submit id="delete" value="履歴全削除"/>
						</s:form>
					</s:if>


				<!-- マイページに戻る -->
					<s:form action="GoMyPageAction" class="button">
						<s:submit value="マイページに戻る"/>
					</s:form>


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