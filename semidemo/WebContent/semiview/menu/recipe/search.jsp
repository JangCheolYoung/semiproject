<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 검색</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../semiview/css/recipe.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginBtn').hover(
				function(){$(this).attr("src", $(this).attr("src").replace("off.png","on.png"));},
				function(){$(this).attr("src", $(this).attr("src").replace("on.png","off.png"));});

		$('#searchBtn').on('click', search);
	});

	function search() {

		var data = $("#data").val()
		var check = /^[가-힣]+$/;

		if ((data == "" || null)) {
			alert('검색어를 입력하세요');
			$('#data').focus();
		} else if (check.test(data)) {
			$('#f').submit();
		} else{
			alert('올바른 검색어를 입력하세요');
			$('#data').focus();
		}

	};
</script>
<style type="text/css">
#search {
	text-align: center;
	margin: 50px;
	vertical-align: middle;
}

#data {
	height: 25px;
	border: solid #dbdbdb 3px;
	vertical-align: middle;
	outline-style: none;
}

#btn {
	width: 43px;
	height: 33px;
	border: none;
	background-color: #dbdbdb;
	vertical-align: middle;
}

#rmain {
	width: 150px;
	height: 150px;
	padding: 15px;
}
</style>
</head>
<body>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
		</header>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">

			<div id="inputContent">

				<div id="search">
					<center>
						<img id="rmain" src="../semiview/images/recipe_off.png" />
					</center>
					<form id='f' method='get' action='recipeSearch.do'>
						<input type="text" name="data" id="data" /> 
						<input type="button" id="searchBtn" value="검색" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<a href="login.do"><img id="loginBtn"
			src="../semiview/images/loginBtn_off.png" /></a>
	</footer>


</body>
</html>