<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/includeHeader.css">
<link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">

<script type="text/javascript">
  $(function(){
     $("right-list").hover(function(){    	  $("button1").css("color","pink");
     });
     });
 </script>


</head>
<body>
	<div id="menu">
		<div class="headerLogo">
			<a class="headerA" href='<s:url action="GoHomeAction"/>'>Regalo</a></div>


		<div class="right-list">
		<ul>
		<li>
		<div class="title">menu</div>
</li>





<!-- 				マイページ -->
				<s:if test = "#session.loginFlg == true">
					<li>
						<div id="headerMypage">
							<s:form action="GoMyPageAction">
								<button class="button1" type="submit">MY PAGE</button>
							</s:form>
						</div>
					</li><br>
				</s:if>

<!-- 				商品一覧 -->
                 <li>
                 <div id ="headerProductList">
                 <s:form action="GoProductListAction">
		<button class="button1" type="submit">GIFT ITEM</button>
	</s:form>
	</div><br>
	</li>
<!-- 				カート -->
				<li>
					<div id="headerCart">
						<s:form action="GoCartAction">
							<button class="button1" type="submit">CART</button>
						</s:form>
					</div><br>
				</li>

<!-- 				ゲストユーザーのとき -->
				<s:if test="#session.loginFlg == false || #session.loginFlg == null">

					<li>
						<div id="headerLogin">
							<s:form action="GoLoginAction">
								<button class="button1" type="submit">LOGIN</button>
							</s:form>
						</div>

					</li>

				</s:if>

<!-- 				ログインユーザーのとき -->
				<s:if test="#session.loginFlg == true && session.masterFlg != true">

				<li>
					<div id="headerLogout">
						<s:form action="LogoutAction">
							<button class="button1" type="submit">LOGOUT</button>
						</s:form>
					</div>
				</li>

				</s:if>


			</ul>
		</div>

		<div id="headerSearch">
			<s:form action="ProductSearchAction" theme="simple">

					<s:select name="categoryId" list="#session.categoryList" listValue="categoryName" listKey="categoryId" class="category" id="categoryId"/>
					<br>
					<s:textfield name="searchWord"/>
					<button  class="button1" type="submit">SEARCH</button>

			</s:form>
		</div>


			</div>
</body>
</html>