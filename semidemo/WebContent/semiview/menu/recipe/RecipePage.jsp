<%@page import="java.util.List"%>
<%@page import="semidemo.dto.RecipeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));});
		
	});
</script>
<style type="text/css">
#rmain {
	width: 150px;
	height: 150px;
	margin: 10px;
}
</style>
</head>
<body>
	<div class="layer" id="wrap">
		<div id="topbannerDiv">
			<img id="momsRecipe" src="../semiview/images/mammaLogo.png" />

		</div>
		<div class="menubar">
			<ul>
				<li><a href="*">홈</a></li>
				<li><a href="recipe.do" id="current">레시피</a>
					<ul>
						<li><a href="recipe.do?r_lv=초기">초기이유식(4~6개월)</a></li>
						<li><a href="recipe.do?r_lv=중기">중기이유식(7~9개월)</a></li>
						<li><a href="recipe.do?r_lv=후기">후기이유식(10~12개월)</a></li>
						<li><a href="recipe.do?r_lv=완료기">완료기이유식(12개월이후)</a></li>
					</ul></li>
				<li><a href="momTalk.do">커뮤니티</a></li>
				</li>
				<li><a href="handOut.do">무료나눔</a></li>
				<li><a href="info.do">육아정보</a></li>
				<li><a href="question.do">고객센터</a></li>
			</ul>
		</div>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">

			<div id="inputContent">
				<center>
					<img id="rmain" src="../semiview/images/recipe_off.png" />
				</center>
				<jsp:include page="search.jsp" />

			</div>
		</div>
	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>