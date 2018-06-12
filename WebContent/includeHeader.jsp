<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css"/>
<link rel="stylesheet" type="text/css" href="./css/includeHeader.css">
<link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet">

<script type="text/javascript">
   $(function(){
   $("right-list").hover(function(){
 	  $("button1").css("color","pink");
   });
   });
</script>


</head>
<body>
	<div id="header">
		<!-- GoHomeActionつけろ -->
		<div id="headerLogo"><div class="aaa">
			<a class="headerA" href='<s:url action="GoHomeAction"/>'>Regalo</a></div>
		</div>

		<div class="right-list">
			<ul>

				<!-- マイページ -->
				<s:if test="#session.loginFlg == false || session.loginFlg == null">
					<li>
						<div id="headerMypage">
							<s:form action="GoMyPageAction">
								<button class="button1" type="submit">MY PAGE</button>
							</s:form>
						</div>
					</li>
				</s:if>
				<!-- 商品一覧 -->
                 <li>
                 <div id ="headerProductList">
                 <s:form action="GoProductListAction">
		<button class="button1" type="submit">GIFT ITEM</button>
	</s:form>
	</div>
	</li>
				<!-- カート -->
				<li>
					<div id="headerCart">
						<s:form action="GoCartAction">
							<button class="button1" type="submit">CART</button>
						</s:form>
					</div>
				</li>

				<!-- ゲストユーザーのとき -->
				<s:if test="#session.loginFlg == false || session.loginFlg == null">

					<li>
						<div id="headerLogin">
							<s:form action="GoLoginAction">
								<button class="button1" type="submit">LOGIN</button>
							</s:form>
						</div>
					</li>

				</s:if>

				<!-- ログインユーザーのとき -->
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
				<select name="categoryId">
					<option value=1>ALL  ITEM</option>
					<option value=2>FOOD</option>
					<option value=3>WINE</option>
					<option value=4>ACCESSORIES</option>
					<option value=5>WATCH</option>
				</select>
				<s:textfield name="searchWord"/>
				<button  class="button1" type="submit">SEARCH</button>
			</s:form></div></div>
</body>
</html>