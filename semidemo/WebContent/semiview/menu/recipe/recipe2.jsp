<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../semiview/css/recipe.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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


#search {
	text-align: center;
	margin-bottom: 30px;
}

table {
	width: 800px;
	border: 1px solid #cfcfcf;
	border-style:dashed;
	margin-bottom: 20px;
    padding-bottom: 10px;
}

tr {
	margin : auto;
}

td {
	text-align: left;
	margin-bottom: 10px;
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
	margin : 10px;
}

p {
	width: 60px;
	text-align: center;
	line-height: 30px;
	background-color: #efefef;
}

#data {
	height: 30px;
	margin-top:-2px;
	height:24px;
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
</style>
</head>
<body>
<div id=top></div>
<div class="layer" id="wrap">
		<div id="topbannerDiv">
			<img id="momsRecipe" src="../semiview/images/mammaLogo.png" />

		</div>
		<div class="menubar">
			<ul>
				<li><a href="*">홈</a></li>
				<li><a href="recipe.do" id="current">레시피</a>
					<ul>
						<li><a href="?r_lv=초기"> <!-- onclick="move();" -->초기이유식(4~6개월)</a></li>
						<li><a href="?r_lv=중기" onclick="category('중기')">중기이유식(7~9개월)</a></li>
						<li><a href="?r_lv=후기" onclick="category('후기')">후기이유식(10~12개월)</a></li>
						<li><a href="?r_lv=완료기" onclick="category('완료기')">완료기이유식(12개월이후)</a></li>
					</ul></li>
				<li><a href="momTalk.do">커뮤니티</a></li>
				</li>
				<li><a href="handOut.do">무료나눔</a></li>
				<li><a href="info.do">육아정보</a></li>
				<li><a href="question.do">고객센터</a></li>
			</ul>
		</div>
		<div id="content"
			alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
		
			<div id="inputContent">
		
		
<div id=lv_img>
<img src="../semiview/images/${param.r_lv}.png" id="level_img">
</div>
	<div id="wrap">
<c:forEach items="${requestScope.aList}" var="dto">
	<table align="center">
			<tr><td rowspan="3">
				<img src="../semiview/images/${dto.main_picture}" id="recipe_img">
			</td>
		<td><p>요리명</p></td>
		<td>${dto.recipe_title}</td></tr>
		<tr><td><p>재료</p></td><td>${dto.ingredient}</td></tr>
		<tr><td><p>순서</p></td><td>${dto.r_order}</td></tr>
		<tr><td><p>TIP</p></td><td colspan="2">${dto.tip}</td></tr></table>
	</table>
	</c:forEach>
	</div>
	<div id="result"></div>
		
			</div>
		</div>
	</div>
	<a href = "login.do"><img id="loginBtn" src="../semiview/images/loginBtn_off.png"/></a>
<footer><a href="#top"><img id=bottom src="../semiview/images/top_img.png"></a></footer>

</body>
</html>