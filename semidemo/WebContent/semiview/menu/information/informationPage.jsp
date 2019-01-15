<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jquery-ui.css">
<style type="text/css">
.layer {
	position: absolute;
	top: 0;
	left: 15%;
}

#topbannerDiv {
	width: 1000px;
	height: auto;
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

#content {
	width: 1000px;
	height: 1000px;
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
	6.베너 창의 크기에 따라서 사라지거나 나타나게 하는 법
	7.배너 창 맨위 맨아래로 이동하는 버튼 각 현제 페이지의 지정된 위치로 이동하는 것 구현
	8. 
	
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

#banner {
	background-color: inherit;
	border: 2px solid #bcbcbc;
	position: fixed;
	right: 100px;
	z-index: 3;
	top: 300px;
	width: 150px;
	height: 211px;
	text-decoration: none;
	border-radius: 7px;
}

#bannerin ul:nth-child(1) {
	list-style-type: none;
	height: 100%;
	text-align: center;
}

#bannerin ul {
	text-align: inherit;
	padding-left: 0px;
	margin: 0;
}

#bannerin ul li a {
	text-decoration: none;
	font-size: 13px;
}

#bannerin ul li a:link {
	color: black;
}

#bannerin ul li a:visited {
	color: black;
}

#bannerin ul li a:hover, #bannerin ul li:hover a {
	color: red;
}
/*배너 맨위  ---------------------------------- */
div #bottombtn {
	height: 30px;
	width: 93px;
	display: block;
	position: absolute;
}

div .demoSpan2 {
	height: 25px;
}

div .demoSpan2:before {
	content: '';
	height: 10px;
	width: 10px;
	display: block;
	border: 5px solid #ffffff;
	border-left-width: 0;
	border-bottom-width: 0;
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	position: absolute;
	top: -20px;
	left: 63px;
	padding: 4px;
}

div #topbtn {
	height: 0px;
	width: 0px;
	display: block;
	position: absolute;
}

div .demoSpan1 {
	overflow: hidden;
	height: 25px;
}

div .demoSpan1:before {
	content: '';
	height: 20px;
	width: 20px;
	display: block;
	border: 5px solid #ffffff;
	border-right-width: 0;
	border-top-width: 0;
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	position: absolute;
	bottom: 7px;
	right: 7px;
}

div #topbtn:link {
	color: black;
}

div #topbtn:visited {
	color: black;
}

div #topbtn:hover {
	color: red;
}

div #bottombtn:link {
	color: black;
}

div #bottombtn:visited {
	color: black;
}

div #bottombtn:hover {
	color: red;
}

div dt {
	width: 150px;
	text-align: center;
	background-color: #FF5675;
}

#text01 {
	border-width: 2px;
	border-color: #ffafaf;
	border-right: none;
	border-left: none;
}

#text02 {
	border-width: 2px;
	border-color: #ffafaf;
	border-style: solid;
	border-top: none;
	border-right: none;
	border-left: none;
}

#text03 {
	border-width: 2px;
	border-color: #ffafaf;
	border-style: solid;
	border-top: none;
	border-right: none;
	border-left: none;
}

#text04 {
	border-width: 2px;
	border-color: #ffafaf;
	border-style: solid;
	border-top: none;
	border-right: none;
	border-left: none;
}

.Masssage {
	width: -webkit-fill-available;
	height: auto;
}

/*-------------------------------------------------------------------------*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../semiview/menu/information/js/jquery-ui.js"></script>
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
						});

				$("a[href^='#']").click(function(event) {
					event.preventDefault();
					var target = $(this.hash);
					$("html, body").scrollTop(target.offset().top);

				});
				$("#bottombtn").click(function(event) {
					event.preventDefault();
					var target = $(this.hash);
					$("html, body").scrollTop($(document).height());
				});
				$("#banner").draggable();
			});
</script>
</head>
<body>
	<a id="top"></a>
	<div class="layer" id="wrap">
		<%-- 
		<header>
			<jsp:include page="../topmenu.jsp" />
  		 </header> --%>


<header>
<jsp:include page="../topmenu.jsp" />
</header>
		
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<div id="inputContent">
				<div id="banner">
					<div style="background-color: white;">
						<div
							style="text-align: center; background-color: #ffafaf; height: 30px;">
						</div>
						<a id="topbtn" class="demoSpan2" href="#top"></a>
						<div id="bannerin">
							<ul>
								<li style="height: 30px;"><a href="#infm1">신생아에 대한 정보</a></li>
								<li style="height: 30px;"><a href="#infm2">신체적특징</a></li>
								<li style="height: 30px;"><a href="#infm3">아이건강</a></li>
								<li style="height: 30px;"><a href="#infm4">베이비 마사지</a></li>
								<li style="height: 31px;"><a href="#infm5">알레르기 유발식품</a></li>
							</ul>
						</div>
						<a id="bottombtn" class="demoSpan1" href="#bottom"></a>
						<div
							style="text-align: center; background-color: #ffafaf; height: 30px;">
							<!-- <a id="bottombtn" style="text-decoration: none;"  href="#bottom">맨아래로</a> -->
						</div>
					</div>
				</div>
				<div id="text01">
					<img id="infm1" src="../semiview/images/information/text01.jpg" />

				</div>
				<div id="text02">
					<img id="infm2" src="../semiview/images/information/text02.jpg" />

				</div>
				<div id="text03">
					<img id="infm3" width="995px;"
						src="../semiview/images/information/text03(0).jpg" /> <img
						id="infm3" width="995px;"
						src="../semiview/images/information/text03(1).jpg" /> <img
						id="infm3" width="995px;"
						src="../semiview/images/information/text03(2).jpg" />

				</div>
				<div id="text04">
					<h1 id="infm4"
						style="margin-top: 0px; margin-left: 20px; font-weight: 500">4.베이비
						마사지</h1>
					<h3>
						<img src="../semiview/images/information/star.jpg" />손,발 마사지
					</h3>
					<img class="Masssage"
						src="../semiview/images/information/handfootMassage1.png"
						width=700px height=700px />
					<!-- <img class="Masssage"
					src="../semiview/images/information/handfootMassage2.png" width=700px
					height=700px /> -->
					<h3>
						<img src="../semiview/images/information/star.jpg" />팔,다리 마사지
					</h3>
					<img class="Masssage"
						src="../semiview/images/information/paldariMassage.png" />
					<h3>
						<img src="../semiview/images/information/star.jpg" />배 마사지
					</h3>
					<img class="Masssage"
						src="../semiview/images/information/baeMassage.png" />
					<h3>
						<img src="../semiview/images/information/star.jpg" />등 마사지
					</h3>
					<img class="Masssage"
						src="../semiview/images/information/deongMassage.png" />
					<h3>
						<img src="../semiview/images/information/star.jpg" />가슴 마사지
					</h3>
					<img class="Masssage"
						src="../semiview/images/information/chestMassage.jpg" />
				</div>
				<div id="text05">
					<img id="infm5" width="995px;"
						src="../semiview/images/information/text05(0).jpg" /> <img
						width="995px;" src="../semiview/images/information/text05(1).jpg" />

				</div>
			</div>
		</div>
	</div>

	<a id="bottom"></a>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>