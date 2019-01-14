<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var data= $('#f input[data=data]').val()
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
	background-color: #efefef;
}

#data {
	height: 25px;
	padding-top:2px;
}

#btn {
	height: 32px;
	border: none;
}

</style>
</head>
<body>
	 <form id='f' method='get' action='recipeSearch.do'>
<div id="search">
	<input type="text" name="data" id="data"/>
	<input type="submit" value="검색" id="btn" />
</div>
	</form>
	<div id="wrap"></div>
</body>
</html>