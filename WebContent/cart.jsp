<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="./css/cart.css">
<title>カート</title>
<style type="text/css">

 #contents {
 position:relative;
 width:700px;
 margin:0 auto;

 }

.submit_btn {
/* 文字サイズを1.emに指定 */
    font-size: 1em;
    /* 文字の太さをboldに指定 */
    /*font-weight: bold; */
    /* 縦方向に10px、
     * 横方向に30pxの余白を指定 */
    padding: 5px 30px;
    /* 文字色を白色に指定 */
    color: white;
    /* ボーダーをなくす */
    border-style: none;
    /* ボタンの影の指定
     * 影の横幅を2px
     * 縦長を2px
     * ぼかしを3px
     * 広がりを1px
     * 色を#666（グレー）に指定 */
     box-shadow: 2px 2px 3px 1px #ffffff;
     -moz-box-shadow: 2px 2px 3px 1px #ffffff;
    -webkit-box-shadow: 2px 2px 3px 1px #ffffff;
    /* テキストの影の指定
     * 影の横幅を1px
     * 縦長を1px
     * ぼかしを2px
     * 色を#000（黒）に指定 */
    text-shadow: 1px 1px 2px #000;
     background-color: #000000;
   /* グラデーションの指定 */
     background: -moz-linear-gradient(bottom, #36d, #000000 50%, #36d);
/*      background: -webkit-gradient(linear, left bottom, left top, from(#000), color-stop(0.5, #ffffff), to(#000)); */
     font-family: 'Cinzel', serif;

}


</style>
</head>

<body>
<header>
	<div id=title>Cart</div>
</header>

<div class="main">
	<div id="container">

		<s:if test="#session.checkListErrorMessageList!=null">
			<div class="error">
				<div class="error-message">
					<s:iterator value="#session.checkListErrorMessageList">
						<s:property />
					</s:iterator>
				</div>
			</div>
		</s:if>

		<s:if test="CartDtoList.size() > 0">
			<s:form id="form">
				<s:iterator value="CartDtoList">
					<table class="horizontal-list-table">
						<tr>
							<td><img src='<s:property value="imageFilePath"/>' width="50px" height="50px" /></td>
						</tr>
						<tr>
							<td>
							<ul>
								<li><s:checkbox name="checkList" value="checked" fieldValue="%{id}"/></li>
								<s:hidden name="productId" value="%{productId}"/>
								<li><s:property value="productName"/></li>
								<li><s:property value="productNameKana"/></li>

								<li><s:property value="price"/>円</li>
								<li><s:property value="releaseCompany"/></li>
								<li><s:property value="releaseDate"/></li>
								<li><s:property value="productCount"/></li>
								<li><s:property value="subtotal"/>円</li>
							</ul>
							</td>
						</tr>
						<s:hidden name="productName" value="%{productName}"/>
						<s:hidden name="productNameKana" value="%{productNameKana}"/>
						<s:hidden name="imageFilePath" value="%{imageFilePath}"/>
						<s:hidden name="imageFileName" value="%{imageFileName}"/>
						<s:hidden name="price" value="%{price}"/>
						<s:hidden name="releaseCompany" value="%{releaseCompany}"/>
						<s:hidden name="releaseDate" value="%{releaseDate}"/>
						<s:hidden name="productCount" value="%{productCount}"/>
						<s:hidden name="subtotal" value="%{subtotal}"/>
					</table>
				</s:iterator>

				<h2><s:label value="カート合計金額 :"/><s:property value="totalPrice"/>円</h2><br>

				<div class="btn">
					<ul>
						<li>
							<div class="submit_btn_box">
								<div id=".contents-btn-set">
									<s:submit value="決済" class="submit_btn" onclick="this.form.action='BuyProductConfirmAction';"/>
								</div>
							</div>
						</li>

						<li>
							<div class="submit_btn_box">
								<div id=".contents-btn-set">
									<s:submit value="削除" class="submit_btn" onclick="this.form.action='CartDeleteAction';"/>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</s:form>
		</s:if>
		<s:else>
			<div class="info">
			カート情報はありません。
			</div>
		</s:else>
	</div>
</div>
<footer>
	<s:include value="includeFooter.jsp"/>
</footer>
</body>
</html>