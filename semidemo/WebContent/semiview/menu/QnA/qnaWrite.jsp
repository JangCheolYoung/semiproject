<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.layer {
	position: absolute;
	top: 0;
	left: 15%;
}

#topbannerDiv {
	
	width: 1000px;
	height: 150px;
}

#topmenu {
	background-color: orange;
	width: 1000px;
	height: 50px;
}



#topbannerDiv img {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#topmenu a {
	text-align: center;
	line-height: 50px;
}

#loginBtn {
	display: block;
	position: absolute;
	left: 90%;
	width: 150px;
	height: 75px;
}

/*
	1.상단 맘마레시피 이미지 만들고 첨부하기. 
	2.메뉴바 만들어서 메뉴 하나당 이미지 넣기. (o)
	3.메뉴 하나당 커서 올리면 a:hover 이용해서 메뉴의 목록 나오게 하기. (o)
	4.오른쪽 상단에 로그인 만들기.
	5.상단과 로그인 화면은 고정시키고, content 부분만 동적으로 처리 할 수 있게 만들기??? 맞나
	
	
*/

/*-----------------------------메뉴바 css------------------------------*/
.menubar {
	border: none;
	border: 0px;
	margin: 0px;
	padding: 0px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
		"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
		sans-serif;
	font-size: 14px;
	font-weight: bold;
}

.menubar ul {
	/*기본 설정 rgb(109, 109, 109)*/
	background: #FF5675;
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.menubar li {
	float: left;
	padding: 0px;
}

.menubar li a {
	background: #FF5675;
	color: #cccccc;
	display: block;
	font-weight: normal;
	line-height: 50px;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
}

.menubar li a:hover, .menubar ul li:hover a {
	background: #FF607F;
	color: #FFFFFF;
	text-decoration: none;
}

.menubar li ul {
	background: #FF607F;
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background: #FF607F;
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	width: 200px;
}

.menubar li:hover li a {
	background: none;
}

.menubar li ul a {
	display: block;
	height: 50px;
	font-size: 12px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
	text-align: left;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	background: #FF6A89;
	border: 0px;
	color: #ffffff;
	text-decoration: none;
}

/*----영철스 타임------------------------------------------------------------*/

#content{
	width: 100%;
	height: 700px;
	background-color: aqua;
}

table {
   border: 1px solid black;
}

table, tr, th, td {
   border: 1px solid black;
   border-collapse: collapse;
}


#qna_title{
	width: 200px;
	height: 40px;
	border-radius: 5px;
}
#qna_content{
	width: 700px;
	height: 200px;
	border-radius: 5px;

}

#qna_category{
	width: 100px;
	height: 40px;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginBtn').hover(
			function() {
			$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
			function() {
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));});
		
		)
	});
	
	
</script>
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
						<li><a href="#">초기이유식(4~6개월)</a></li>
						<li><a href="#">중기이유식(7~9개월)</a></li>
						<li><a href="#">후기이유식(10~12개월)</a></li>
						<li><a href="#">완료기이유식(12개월이후)</a></li>
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
			<form action="qnaWrite.do" id="qnaWrite" method="post" enctype="multipart/form-data">
			<c:if test = "${!empty param.qna_num }">
				<input type = "hidden" name = "qna_num" value = "${param.qna_num }" />
				<input type = "hidden" name = "ref" value = "${param.ref}" /> 
		 		<input type = "hidden" name = "re_step" value = "${param.re_step}" />
		 		<input type = "hidden" name = "re_level" value = "${param.re_level}" />
		 		<input type = "hidden" name = "pageNum" value = "${param.pageNum}" />
		 		<input type = "hidden" name = "qna_category" value="${param.qna_category}"/>
		 	</c:if>
			
				<div>
				<c:if test= "${empty param.qna_num }">
					<select name="qna_category" id="qna_category">
						<option>분류</option>
						<option value="레시피">레시피</option>
						<option value="맘톡">맘톡</option>
						<option value="무료나눔">무료나눔</option>
						<option value="육아정보">육아정보</option>
						<option value="기타">기타</option>
					</select>
				</c:if>
				
				</div>
				<div>
				<c:if test="${!empty param.qna_num }">
					<span>분류 : ${param.qna_category} </span><br/>
					<span>[답변]</span>
				</c:if>
					<input type="text" id="qna_title" name="qna_title" placeholder="제목을 입력하세요."/>
				</div>
				<div>
					<textarea id="qna_content" name="qna_content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<input type="file" id="image" name="image" value="첨부파일"/>
				<input type="submit" name="submit" value="등록"/>
				<a href="question.do"><input type="button" value="취소"/></a>
			</form>
			<div id="inputContent"></div>
		</div>
	</div>
	<a href = "login.do"><img id="loginBtn" src="../semiview/images/loginBtn_off.png"/></a>

</body>
</html>