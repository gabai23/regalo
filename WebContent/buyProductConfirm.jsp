<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buyItemConfirm画面</title>
</head>
<body>
<!-- ヘッダー -->
	<jsp:include page="includeHeader.jsp"/>
<!-- 決済画面へ -->
<s:form action="BuyProductCompleteAction">
<s:submit value="購入"/>
</s:form>
<!-- 宛先情報 -->

				<div class="addressContainer clearfix">
				<%-- <s:iterator value="addressInfoListDTO"> --%>
				<s:iterator value="#session.addressInfoListDTO">
					<div class="box">
						<div class="address_title">
							<label>
							<input type="radio" name="destinationId" value="${id}"  checked="checked"/>
							お届け先
							</label>
						</div>

						<div class="address_box">
							ふりがな:
							<s:property value="familyNameKana"/>
							<s:property value="firstNameKana"/>
							<br>
							名前:
							<s:property value="familyName"/>
							<s:property value="firstName"/>
							<br>
							住所:
							<s:property value="userAddress"/>
							<br>
							電話番号:
							<s:property value="telNumber"/>
							<br>
							メールアドレス:
							<s:property value="email"/>
							<br>
						</div>
					</div>

				</s:iterator>
　　　　　　　　</div>








<!-- 新規宛先登録画面へ -->
<s:form action="GoAddressCreateAction">
<s:submit value="新規宛先登録画面へ"/>
</s:form>
<!-- 宛先削除 -->
<s:form action="AddressDeleteAction">
<s:submit value="宛先削除"/>
</s:form>
<!-- フッター -->
	<jsp:include page="includeFooter.jsp"/>
</body>
</html>