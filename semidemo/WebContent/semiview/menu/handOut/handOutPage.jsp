<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료나눔 상품페이지</title>
<link rel="stylesheet" type="text/css"
	href="../semiview/menu/handOut/handOut_css/handOutPage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//로그인 이미지 hover 적용
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
				//무료나눔하기 이미지 hover 적용
				$('#handOut').hover(
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

				
				$('#handOut').on('click', function(){
					
					if('${sessionScope.id}' == ''){
						alert("로그인 후 이용해주세요.");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
						return false;
					}else{
						//alert('로그인된 닉네임 : ${sessionScope.nickname}');
					}
				});
				
				
				$('#ImageTd, #titleTd').on('click', function(){
					if('${sessionScope.id}' == ''){
						alert("로그인 후 이용해주세요.");
						$('#frm').attr('action', 'login.do');
						$('#frm').submit();
						return false;
					}else{
						
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
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<!-- 나눔글 작성하기 이미지. -->
			<form id="frm" name="frm">
			<input type="hidden" name="page" value="handOut.do"/>
			
			<a href="handOutWrite.do"><img id="handOut"
				src="../semiview/images/handout/handout_off.png" /></a>
				
			<div id="inputContent">
				<!-- 여기서부터 무료나눔 첫페이지 요소 이다. -->
				<div class="inputDiv">
					<c:forEach items="${requestScope.aList}" var="dto">
						<table>
							<tbody>
								<tr>
									<td colspan="4" id="ImageTd">
										<div class="imageDiv">
											<a
												href="handOutView.do?handout_post_num=${dto.handout_post_num}&pageNum=${pdto.currentPage}">
												<img src="../semiview/images/handout/${dto.main_picture}" />
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td id="titleTd" colspan="2"><a
										href="handOutView.do?handout_post_num=${dto.handout_post_num}&pageNum=${pdto.currentPage}">
											${dto.title}</a></td>
									<td colspan="2">[${dto.area}]</td>
								</tr>
								<tr>
									<td colspan="1">by&nbsp;${dto.nickname}</td>
									<td colspan="3">조회수 : ${dto.readcount}</td>
								</tr>

							</tbody>
						</table>

					</c:forEach>

				</div>
				<div class="page">
					<!-- 이전 처리 -->
					<!-- 이전으로 이동할 것이 있을 경우에만 이전이 뜨도록 -->
					<!-- 이전 4 5 6 / 이전을 누르면 1 2 3이 보이도록, 누르면 가장 첫번째 것이 선택이 되도록 -->
					<!-- 이전의 조건 : 현재페이지의 값이 1보다 클때 , 현재페이지-한블럭에보여줄페이지 (4-3=1페이지가 선택되어서 나옴) -->
					<c:if test="${requestScope.pdto.startPage > 1 }">
						<span><a class="aPage"
							href="handOut.do?pageNum=${pdto.startPage-pdto.blockPage }">이전</a></span>
					</c:if>

					<!-- 페이지 이동하는 부분 -->
					<c:forEach begin="${requestScope.pdto.startPage }"
						end="${requestScope.pdto.endPage }" var="i">
						<span><a class="aPage" href="handOut.do?pageNum=${i}">${i}</a></span>
					</c:forEach>

					<!-- 다음 처리 -->
					<!-- 다음으로 이동할 것이 있을 경우에만 다음이 뜨도록 -->
					<!-- 1 2 3 다음 / 다음을 누르면 4 5 6이 보이도록, 누르면 가장 첫번째 것이 선택이 되도록 -->
					<!-- 다음의 조건 : 현재 마지막 페이지보다 토탈페이지가 더 클때, 현재페이지+한블럭에보여줄페이지 (1+3=4페이지가 선택되어서 나옴) -->
					<!-- 리퀘스트 영역에 있는 값들은 '이름.값'으로 가지고 와도 됨(생략해서 많이 사용, 생략하지 않고 다 쓰는것이 정석이기는 함)  -->
					<c:if
						test="${requestScope.pdto.endPage < requestScope.pdto.totalPage }">
						<span><a class="aPage"
							href="handOut.do?pageNum=${pdto.startPage+pdto.blockPage }">다음</a></span>
					</c:if>
				</div>
			</div>
			</form>
		</div>
	</div>

</body>
</html>