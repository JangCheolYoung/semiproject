<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
.layer {
   position: absolute;
   top: 0;
   left: 15%;
}
#topbannerDiv {
	width: 1000px;
	height: 150px;
	vi
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
	left: 85%;
	width: 150px;
	height: 75px;
}

/*-----------------------------메뉴바 css------------------------------*/
.menubar {
	visibility:hidden;
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
/*---------------------------임정욱 css---------------------------------*/
.userbox {
	margin-top: 20px;
	border-bottom: :3px solid #e7e7e7;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.userbox img {
	height: 200px;
	width: 200px;
}

#inputContent {
	width: 100%;
	height: 700px;
	margin: auto;
}


td img {
	width: 200px;
	height: 200px;
}

.handout{
	width: 100%;
	height: 300px;
	border: 1px solid #e7e7e7;
	border-radius: 3px;
}

.handout #realHandoutDiv{
	width: 90%;
	margin: auto;
}

.handout #handout_table{
	float: left;
	padding-left: 15px;
	margin-top: 10px;
}
a{
   text-decoration: none;
   color: black;
   font-weight: bold;
}

#titleTd a{
   display: inline-block;
   width: 90px;
   overflow: hidden; 
   text-overflow: ellipsis; 
   white-space: nowrap;
   
}
/* 질문바   */
.qnatable{

}
.qnatable thead tr th{
	width: 150px;
	padding:7px;
	font-weight: bold;
	vertical-align: top;
	color:#fff;
	background-color: #ffccca;
}
.QNADIV{
 	width: 100%;
	border-top: 3px solid #e7e7e7;
	margin-top: 15px;
}
.QNADIV .QNA{
/* 	width:80%;
	margin: auto; */
margin-top: 10px; 	
}
.content_div {
background-color: orange;
margin-left:10px;
}
.qnacont{
margin: 10px;
}
.qnatable{
margin: auto;
width: 100%;

}
#handoutQnAPageNum {
	text-align: center;
	font-size: 20px;
	padding: 10px;
	border-bottom: 3px solid #e7e7e7;
	margin-bottom: 20px;
}
.qnatable tbody tr td{
	padding: 10px;
	text-align: center;
}
.qnatable tbody{

}


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
				//로그인
				$('#loginBtn').on(
						'click mouseover',
						function() {
							$(this).attr(
									'src',
									$(this).attr('src').replace("loginBtn_off",
											"loginBtn_on"));
						});
				$('#loginBtn').on(
						'mouseleave',
						function() {
							$(this).attr(
									'src',
									$(this).attr('src').replace("loginBtn_on",
											"loginBtn_off"));
						});
				//로그아웃
				$('#logoutBtn').on(
						'click mouseover',
						function() {
							$(this).attr(
									'src',
									$(this).attr('src').replace(
											"logoutBtn_off", "logoutBtn_on"));
						});
				$('#logoutBtn').on(
						'mouseleave',
						function() {
							$(this).attr(
									'src',
									$(this).attr('src').replace("logoutBtn_on",
											"logoutBtn_off"));
						});

				/* 마이페이지 버튼 mypageBtn -------------------------------------------------------------- */
				$('#mypageBtn').on('click', function() {

					if ('${sessionScope.id}' == '') {
						alert("로그인 후 이용해주세요.");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
					} else {
						//alert('로그인된 사용자 닉네임 : ${sessionScope.nickname}');
						$('#frm').attr('action', 'mypageForm.do');
						$('#frm').submit();
					}

				});

			});
</script>
</head>

<body>
	<div class="layer" id="wrap">
 <header>
			<jsp:include page="../topmenu.jsp" />
</header>   
	
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

				<li><a href="handOut.do">무료나눔</a></li>
				<li><a href="info.do">육아정보</a></li>
				<li><a href="question.do">고객센터</a></li>
				<li><a href="mypage.do">마이페이지</a></li>
			</ul>
		</div>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<div id="inputContent">
				<!-- -------------------------회원 정보 부분--------------------------- -->
				<div class=userbox style="text-align: center; border-bottom: 3px solid #e7e7e7">
					<img alt="회원성별" src="../semiview/images/info_off.png"> <br />
					<thead>
						<tr>
							<th>닉네임 : ${sessionScope.nickname}</th>
							<td></td>
							<br />
							<th>
								<!-- 아이디 :  -->${sessionScope.id} /<!-- 이메일 : -->
								${sessionScope.email}
							</th>
						</tr>
					</thead>

				</div>
				<!-- --------------------------------나눔글---------------------------------- -->
				<div class="handout">
					<div id="realHandoutDiv">
					<c:forEach items="${requestScope.aList}" var="hdto">
						<c:if test="${hdto.nickname ==sessionScope.nickname}">
						<table id="handout_table">
							<tbody>
                       			 <tr>
                           			<td colspan="4" id="ImageTd">
                           				<div class="imageDiv">
                           					<a href="handOutView.do?handout_post_num=${hdto.handout_post_num}&pageNum=${pdto.currentPage}">
                              		   		<img src="../semiview/images/handout/${hdto.main_picture}" /></a>
                           				</div>
                          		    </td>
                        		</tr>
                        		<tr>
                           			<td id="titleTd" colspan="2">
                           			<a href="handOutView.do?handout_post_num=${hdto.handout_post_num}&pageNum=${pdto.currentPage}">
                           			${hdto.title}</a>
                           			</td>
                           			<td colspan="2">[${hdto.area}]</td>
                        		</tr>
                        		<tr>
                           			<td colspan="1">by&nbsp;${hdto.nickname}</td>
                           			<td colspan="3">조회수 : ${hdto.readcount}</td>
                        		</tr>

                     		</tbody>
						</table>
						</c:if>
					</c:forEach>
					</div>
				</div>
				
			<!-- ------------------------------------------------------------- -->

			<!-- ------------------------------질문글---------------------------- -->
				
			<div class="QNADIV">
				<div class="QNA">
				 <table class="qnatable">
					 <thead>
						<tr>
							<th>분류</th>
							<th>제목</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope.qList}" var="qdto">
						<c:if test="${qdto.nickname == sessionScope.nickname}">
						<tbody>
							<tr>
								<td>${qdto.qna_category}</td>
								<td><a href="qnaView.do?qna_num=${qdto.qna_num }&pageNum=${pdto.currentPage}">${qdto.title}</a></td>
								<td>${qdto.write_date}</td>
								<td>${qdto.readcount}</td>
							</tr>
						</tbody>
						</c:if>
					</c:forEach>
				</table>
			</div>
		<div id="handoutQnAPageNum">
					<c:if test="${requestScope.pdto.startPage > 1 }">
						<span><a class="aPage"
							href="myPage.do?pageNum=${pdto.startPage-pdto.blockPage}">이전</a></span>
					</c:if>

					<c:forEach begin="${requestScope.pdto.startPage}"
						end="${requestScope.pdto.endPage }" var="i">
						<span><a class="aPage" href="myPage.do?pageNum=${i}">${i}</a></span>
					</c:forEach>

					<c:if
						test="${requestScope.pdto.endPage < requestScope.pdto.totalPage }">
						<span><a class="aPage"
						href="myPage.do?pageNum=${pdto.startPage+pdto.blockPage}">다음</a></span>
					</c:if>
		</div>
		</div>
	</div>



	<!-- <a href="login.do"> <input type="image" id="loginBtn"
		src="../semiview/images/loginBtn_off.png" hidden="" /> <input
		type="image" id="logoutBtn" src="../semiview/images/logoutBtn_off.png"
		hidden="" /> <img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>
 -->
</body>
</html>