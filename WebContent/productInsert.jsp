<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
<%-- 		<a href='<s:url action="ItemInsertConfirmAction"/>'>追加商品確認</a>
 --%>
		<s:form action="ProductInsertConfirmAction" method="post"
					enctype="multipart/form-data" name="itemInfo"
					onsubmit="return fileCheck();">

					<p class="name">
						<label>商品ID</label>
					</p>
					<p>

						<s:textfield class="field" name="productId" value="%{productId}"
							placeholder="半角数字"
							onKeyup="this.value=this.value.replace(/[^0-9]+/i,'')"   required="" />
					</p>

					<p class="name">
						<label>商品名</label>
					</p>
					<p>
						<s:textfield class="field" name="productName"
							value="%{productName}" placeholder="50文字以下で入力"  required="" />
					</p>




					<p class="name">
						<label>商品名(ひらがな,カナ)</label>
					</p>
					<p>
						<s:textfield class="field" name="productKanaName"
							value="%{productKanaName}" placeholder="80文字以下で入力"  required="" />
					</p>



					<p class="name">
						<label>商品カテゴリー</label>
					</p>
					<p>
						<select name="category">
							<option value="1" selected="selected">車</option>
							<option value="2">音楽・映画</option>
							<option value="3">家電</option>
						</select>
					</p>




					<p class="name">
						<label>価格</label>
					</p>
					<p>
						<s:textfield class="field" name="price" value="%{price}"
							placeholder="半角数字"
							onKeyup="this.value=this.value.replace(/[^0-9]+/i,'')" />
					</p>


					<p class="name">
						<label>個数</label>
					</p>
					<p>
						<select name="productStock">
							<s:iterator status="st" begin="1" end="100">
								<option value='<s:property value="#st.count"/>' />
								<s:property value="#st.count" />
							</s:iterator>
						</select>
					</p>





					<p class="name">
						<label>画像名</label>
					</p>
					<p>
						<s:textfield class="field" name="imageName" value="%{imageName}"
							placeholder="30文字以下で入力" />
					</p>


					<p class="name">画像</p>


					<input type="file" accept='image/*' name="file" id="file"  required/>


					<p class="name">

						<label>会社名</label>
					</p>
					<p>
						<s:textfield class="field" name="company" value="%{company}"
							placeholder="30文字以下で入力" />
					</p>

					<p class="name">
						<label>商品詳細</label>
					</p>
					<p>
						<s:textarea class="text" name="description" value="%{description}" />
					</p>

					<!-- 登録ボタン -->

					<input class="button" type="submit" value="登録確認">




				</s:form>
	</p>

</body>
</html>