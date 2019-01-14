<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#content {
	width: 100%;
	height: 700px;
	background-color: white;
	margin-right: auto;
	margin-left: auto;
}

#contentIn {
	margin: auto;
}

#table_div #table {
	width: 800px;
	border-collapse: collapse;
}

tr, th, td {
	border: 2px solid gray;
	height: 20px;
}

.qna_logo #logo {
	width: 250px;
	height: 120px;
	display: block;
	margin-bottom: 30px;
}

.qna_board {
	position: relative;
	width: 800px;
	height: 420px;
	margin-left: auto;
	margin-right: auto;
}

.qna_board #top #category {
	position: absolute;
	margin-top: 50px;
}

.writeBtn {
	margin-left: 700px;
}

#page {
	text-align: center;
}





.writeImgLabel{
	display: inline-block;
	width : 40px;
	height : 40px;
	background-image: url(images/write_off.png);
	background-size: 40px;
}

#writeBtn{
	margin-left: 700px;
   width : 100px;
   height: 100px;
   padding: 0;
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

				$('#writeImg').hover(
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace(
											"write_off.png", "write_on.png"));
						},
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("write_on.png",
											"write_off.png"));
						});

				/////////////////////////////////////////////////////////////////
				// writeBtn 이미지 눌렀을때 이벤트.
				$('#writeBtn').on('click', function() {
					var session_id = $('#session_id').val();
					if(session_id == ''){
						alert("로그인 해쥬세여,");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
						
					}else if (session_id != null){
						
					alert(session_id);
					
					$('#frm').attr('action', 'qnaWriteForm.do');
					$('#frm').submit();
					
					}

					
				});

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
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<form id="frm" name="frm">
			

				<div id="contentIn">
					<div class="qna_logo">
						<img alt="Q&A 로고입니다." src="../semiview/images/QnALogo1.png"
							id=logo>
					</div>
					<div class="qna_board">
						<div id="top">
							<select name="category" id="category">
								<option value="all">전체</option>
								<option value="recipe">레시피</option>
								<option value="momtalk">맘톡</option>
								<option value="handout">무료나눔</option>
								<option value="info">육아정보</option>
								<option value="etc">기타</option>
							</select>


							<input type="hidden" id="session_id"  value="${sessionScope.logOk}"/>
							
							
							<div>
								<label class="writeImgLabel" for="writeBtn"></label>
								<input type="button" id="writeBtn" name="writeBtn" value="글쓰기"/> 
									
									
							</div>
									
									
									
<!-- <a href="qnaWriteForm.do" class="writeBtn">ddd</a> 
<img id="writeImg" src="../semiview/images/write_off.png" class="writeBtn" /> -->

						</div>

						<div id="table_div">
							<table id="table">

								<thead>
									<tr>
										<th>seq_num</th>
										<th>분류</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일시</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.list}" var="dto">
										<tr>
											<td>${dto.qna_num}</td>
											<td>${dto.qna_category}</td>
											<td>
												<!-- 답변글일경우 앞에 공백이미지를 배치하기 위해서--> <c:if
													test="${dto.re_level !=0 }">
													<img src="../semiview/images/level.gif" width="10">
													<img src="../semiview/images/re.gif" />
												</c:if> <!-- num값 뿐만아니라 현재페이지 값도 받아야함 --> <a
												href="qnaView.do?qna_num=${dto.qna_num }&pageNum=${pdto.currentPage}">${dto.title }</a>
											</td>
											<td>${dto.nickname}</td>
											<td>${dto.write_date}</td>
											<td>${dto.readcount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<%-- qna_board qna게시판 끝나는 부분.--%>



					<div id="page">
						<c:if test="${requestScope.pdto.startPage > 1 }">
							<span><a
								href="question.do?pageNum=${pdto.startPage - pdto.blockShowPage}" />이전</span>
						</c:if>
						<!-- 페이지 이동하는 부분 -->
						<!-- startPage부터 endPage까지 i가 1씩 증가한다~. 
				startPage = 1일때 endPage = 5이고 i는 1부터 5까지.
				startPage = 6일때 endPage = 10이고 i는 6부터 10까지.
				-->
						<c:forEach begin="${requestScope.pdto.startPage }"
							end="${requestScope.pdto.endPage }" var="i">
							<span><a href="question.do?pageNum=${i}">${i}</a></span>
						</c:forEach>

						<c:if
							test="${requestScope.pdto.endPage < requestScope.pdto.totalPage }">
							<span><a
								href="question.do?pageNum=${pdto.startPage + pdto.blockShowPage}" />다음</span>
						</c:if>
					</div>

					<%-- page 끝나는 부분. --%>
				</div>
			</form>
		</div>
	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>