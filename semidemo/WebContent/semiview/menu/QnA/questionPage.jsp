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

/*----영철스 놉 혜린스 타임------------------------------------------------------------*/
#content {
	width: 100%;
	height: 700px;
	background-color: white;
	margin-right: auto;
	margin-left: auto;
	/* background-color: yellow; */
}

#contentIn {
	margin: auto;
	/* background-color: pink; */
}

#contentIn .qna_logo {
	margin: auto;
	margin-top: 40px;
	/* background-color: aqua; */
}

#contentIn .qna_logo #logo {
	margin-left: 37%;
	width: 255px;
	height: 150px;
	size: 230px 150px;
}

#contentIn .qna_board {
	width: 90%;
	margin: auto;
	margin-top: 20px;
	/* background-color: green; */
}

#contentIn .qna_board #top {
	width: 100%;
	height: 70px;
	/* background-color: red; */
}

#contentIn .qna_board #top .top_category {
	width: 120px;
	height: 30px;
	/* background-color: yellow; */
	float: left;
	padding-top: 20px;
	/* display: table-cell;
	vertical-align: center;
	line-height: 30px; */
}

#contentIn .qna_board #top #category {
	width: 120px;
	height: 30px;
	/* background-color: yellow; */
	float: left;
	/* display: table-cell;
	vertical-align: center;
	line-height: 30px; */
}

#contentIn .qna_board #top .top_search {
	width: 300px;
	height: 30px;
	/* background-color: orange; */
	float: left;
	padding-top: 20px;
	margin-left: 25px;
}

#contentIn .qna_board #top .top_search #searchlogo {
	width: 25px;
	height: 25px;
	size: 25px;
	float: left;
	padding-right: 10px;
}

#contentIn .qna_board #top .top_search #search_category {
	width: 95px;
	height: 30px;
	float: left;
}

#contentIn .qna_board #top .top_search #serach_text {
	width: 150px;
	height: 24px;
	float: left;
}

#contentIn .qna_board #top a {
	width: 100px;
	height: 70px;
	/* background-color: yellow; */
	float: right;
}

#contentIn .qna_board #top a img {
	width: 100px;
	height: 70px;
	size: 100px 70px;
	/* background-color: yellow; */
	float: right;
}

#contentIn .qna_board #table_div {
	width: 100%;
	/* height : 70px; */
	/* background-color: yellow; */
}

#contentIn .qna_board #table_div #table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 2.0;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	/* margin: 20px 10px; */
}

#contentIn .qna_board #table_div #table thead th {
	width: 150px;
	padding: 7px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #ffccca;
	/* margin: 20px 10px; */
}

#contentIn .qna_board #table_div #table tbody td {
	width: 150px;
	padding: 3px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

#contentIn .qna_board #table_div #table tbody td a {
	text-decoration: none;
	color: black;
}

#contentIn .qna_board #table_div #table tbody td a:hover {
	color: #ff6699;
}

#contentIn #page {
	width: 90%;
	height: 30px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 70px;
	text-align: center;
	/* background-color: yellow; */
}

#contentIn #page a {
	text-decoration: none;
	color: black;
}

#contentIn #page a:hover {
	color: #ff9999;
}

div#writeBtn {
	width: 100px;
	height: 70px;
	float: right;
	background-image: url("../semiview/images/qna/write_off.png"); 
	background-size: 100px 70px;
	/* background-color: yellow; */
}


tr td a #title{

}

/*--------------------------------------------------------------------------------*/
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

				$('#writeBtn').hover(
						function() {
							$(this).css("background-image","url('../semiview/images/qna/write_on.png')");
						},
						function() {
							$(this).css("background-image","url('../semiview/images/qna/write_off.png')");
						});

				/////////////////////////////////////////////////////////////////
				// writeBtn 이미지 눌렀을때 이벤트.
				$('#writeBtn').on('click', function() {
					
					if('${sessionScope.id}' == ''){
						alert("로그인 후 이용해주세요.");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
					}else{
						//alert('로그인된 사용자 닉네임 : ${sessionScope.nickname}');
						$('#frm').attr('action', 'qnaWriteForm.do');
						$('#frm').submit();
					}

				});
				
				
				// 제목 눌러서 상세페이지 넘어갈때. 이벤트
				$('tr td a #title').on('click', function(){
					if('${sessionScope.id}' == ''){
						alert("로그인 후 이용해주세요.");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
						return false;
					}else{
						//alert('로그인된 닉네임 : ${sessionScope.nickname}');
					}
				});
				
				
				$('#search_category').on('change', function(){
					
					$('#frm').attr('action', 'qnaCategorySearch.do?category='+$('#search_category').val());
					$('#frm').submit();
					
				});

			});
</script>
</head>

<body>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
		</header>


		<!------------------------------------ QnA 부분 -------------------------------------->
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
		<form id="frm">
			<div id="contentIn">
				<div class="qna_board">
					<div id="top">
					
					<!-- 불필요하여 주석처리 했습니다. -->
						<!-- <div class="top_category">
							추가한 div요소입니다.
							<select name="category" id="category">
								<option value="">전체</option>
								<option value="육아정보">육아정보</option>
								<option value="레시피">레시피</option>
								<option value="맘스타그램">맘스타그램</option>
								<option value="무료나눔">무료나눔</option>
								<option value="기타">기타</option>
							</select>
						</div> -->

						<!-- 추가한 div요소입니다. -->
						<div class="top_search">
							<img alt="검색 로고입니다." src="../semiview/images/qna/loupe.png"
								id=searchlogo>
							<div class="top_search_category">
								<select name="search_category" id="search_category">
									<option value="">전체</option>
									<option value="육아정보">육아정보</option>
									<option value="레시피">레시피</option>
									<option value="맘스타그램">맘스타그램</option>
									<option value="무료나눔">무료나눔</option>
									<option value="기타">기타</option>
								</select> 
								<input type="text" id="serach_text" />
							</div>
						</div>
						<div id="writeBtn">
						</div>
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
											</c:if> <!-- num값 뿐만아니라 현재페이지 값도 받아야함 --> 
											<a href="qnaView.do?qna_num=${dto.qna_num }&pageNum=${pdto.currentPage}"><div id="title">${dto.title }</div></a>
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
		</form>
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
		</div>

	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>