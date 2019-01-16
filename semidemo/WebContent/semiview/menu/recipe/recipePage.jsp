<%@page import="java.util.List"%>
<%@page import="semidemo.dto.RecipeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피</title>
<link rel="stylesheet" type="text/css" href="../semiview/css/recipe.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginBtn').hover(
			function() {
			$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
			function() {
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));})
	});

	
</script>
<style type="text/css">
#r_main_img {
	margin: 40px 10px;
}
</style>
</head>
<body>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
		</header>
			<br/>
		<div id="content"
			alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			
			<div id="inputContent">
			<center>
				<a href="viewRecipe.do?r_lv=초기"><img id="r_lv_1" src="../semiview/images/recipe_menu1.png"/></a>
				<a href="viewRecipe.do?r_lv=중기"><img id="r_lv_2" src="../semiview/images/recipe_menu2.png"/></a>
				<a href="viewRecipe.do?r_lv=후기"><img id="r_lv_3" src="../semiview/images/recipe_menu3.png"/></a>
				<a href="viewRecipe.do?r_lv=완료기"><img id="r_lv_4" src="../semiview/images/recipe_menu4.png"/></a>
				<a href="recipeSearchForm.do"><img id="recipeSearch" src="../semiview/images/recipe_menu5.png"/></a>
			</center>
			</div>
		</div>
	</div>
	<footer>
	<a href = "login.do"><img id="loginBtn" src="../semiview/images/loginBtn_off.png"/></a>
</footer>
</body>
</html>