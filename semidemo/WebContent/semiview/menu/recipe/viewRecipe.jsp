<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<link rel="stylesheet" type="text/css" href="../semiview/css/recipe.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#loginBtn').hover(
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("off.png",
											"on.png"));
						},
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("on.png",
											"off.png"));
						})
			});
</script>
<style type="text/css">
#search {
	text-align: center;
	margin-bottom: 30px;
}

table {
	width: 800px;`
	border: 2px dashed #cfcfcf;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-radius: 20px;
}

tr {
	margin: auto;
}

td {
	text-align: left;
	padding: 0px 15px 10px;
}

#level_img {
	display: block;
	margin: auto;
}

#recipe_img {
	width: 150px;
	height: 150px;
	display: block;
	margin: 20px;
}

b {
	margin: 10px;
}

p {
	width: 60px;
	height: 32px;
	text-align: center;
	line-height: 30px;
	background-color: #efefef;
	border-radius: 10px;
}

#data {
	height: 30px;
	margin-top: -2px;
	height: 24px;
}

#btn {
	height: 30px;
	border: none;
	vertical-align: top;
}

#bottom {
	position: fixed;
	right: 1%;
	bottom: 5%;
	text-decoration: none;
}

#sch_img {
	position: fixed;
	right: 6%;
	bottom: 5%;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id=top></div>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
		</header>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">

			<div id="inputContent">


				<div id=lv_img>
					<img src="../semiview/images/recipe/${param.r_lv}.png"
						id="level_img">
				</div>
				<div id="wrap">
					<c:forEach items="${requestScope.aList}" var="dto">
						<table align="center">
							<tr>
								<td rowspan="3"><img
									src="../semiview/images/recipe/${dto.main_picture}"
									id="recipe_img"></td>
								<td><p>요리명</p></td>
								<td>${dto.recipe_title}</td>
							</tr>
							<tr>
								<td><p>재료</p></td>
								<td>${dto.ingredient}</td>
							</tr>
							<tr>
								<td><p>순서</p></td>
								<td>${dto.r_order}</td>
							</tr>
							<tr>
								<td><p>TIP</p></td>
								<td colspan="2">${dto.tip}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div id="result"></div>

			</div>
		</div>
	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
<footer>
	<a href="recipeSearchForm.do"><img id=sch_img
		src="../semiview/images/sch_img_.png"></a> <a href="#top"><img
		id=bottom src="../semiview/images/top_img.png"></a>
</footer>

</html>