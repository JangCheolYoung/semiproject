<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료나눔상세페이지</title>
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

/*-------------------------------------------------------------------------*/

/*---------------------------게시글 css --------------------------------------*/
#inputContent {
	
	width: 1000px;
	height: 500px;
	margin: auto;
}

table {
	width: 100%;
	height: 100%;
}

table tr, td {
	border: 1px solid black;
}

td img {
	width: 50px;
	height: 50px;
}

/*등록/삭제/수정/취소 버튼 DIV*/
#buttonGroup {
	
	float: right;
}

/*댓글입력 DIV*/
#commAdd{
	border: 1px solid black;
	width: 500px;
	height: 230px;

	
}

/*댓글입력 텍스트필드*/
#comment_content  {
	width: 480px;
	height: 80px;
}

/*댓글 입력하면 띄우는 내용 DIV*/
#commContent {
	border: 1px solid black;
	width: 600px;
	
	
}

/*댓글 등록 닉네임 내용란 DIV*/
#nicknameAndTextInputDIV{
	float: left;
	
}
/*댓글 등록 버튼 라벨*/
#commInputBtnLabel{
	display: inline-block;
	background-image: url("../semiview/images/upload_off.png");
	background-repeat: no-repeat;
	background-size: 100%;
	width:100px;
	height: 100px;
}

#commInputBtn{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/*댓글입력 버튼 div*/
#commBtnDIV {
	
	float: right;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
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
				
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				 //call 이미지와 ques 이미지 변경 함수
 				$('#callImage').on('click',function(){
					//검은 callImage 이면
					if($(this).attr("src") == "../semiview/images/handout/call_off.png"){
						$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
						$('#quesImage').attr("src","../semiview/images/handout/ques_off.png");
						return false;
						
					}else if($(this).attr("src") == "../semiview/images/handout/call_on.png"){
						$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
						return false;	
					}
				});
	
				$('#quesImage').on('click',function(){
					//검은 quesImage 이면
					if($(this).attr("src") == "../semiview/images/handout/ques_off.png"){
						$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
						$('#callImage').attr("src","../semiview/images/handout/call_off.png");
						return false;
			
					}else if($(this).attr("src") == "../semiview/images/handout/ques_on.png"){
						$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
						return false;
					}
				});
//////////////////////////////////////////////////////////////////////////////////////////
			
////////////////////////////////////////////////////////////////////////////////////////////
				//목록
				$('#list').on('click', function() {
					$('form').attr('action', 'handOut.do');
					$('form').submit();
				});

				//수정
				$('#update').on('click', function() {
					$('form').attr('action', 'handOutUpdateWrite.do');
					$('form').submit();
				});

				// 게시물삭제
				$('#del').on('click', function() {
					
					$('form').attr('action', 'handOutDelete.do');
					$('form').submit();
				});	
				
				//취소
				$('#cancel').on('click', function() {
					$('form').attr('action', 'handOut.do');
					$('form').submit();
				});
				
				//댓글입력
				$('#commInputBtn').on('click', function() {
					$('[name=textInput]').val($('[name=textInput]').val().replace(/\n/gi,'<br/>'));
					
					if($('#callImage').attr("src") == "../semiview/images/handout/call_on.png") {
						$('#image').attr("value","call_on.png");
						
					} else if($('#quesImage').attr("src") == "../semiview/images/handout/ques_on.png"){
						$('#image').attr("value","ques_on.png");
					}
					
					insertHandOutComment();  //댓글입력 function()
					//listView("${requestScope.dto.handout_post_num}"); //댓글 리스트 출력 function()
					
				});
				
								
							
				//댓글 수정 버튼
				$(document).on('click','[value="댓글수정"]', function(){
					
					var selEle = $(this).parents(); //댓글수정 버튼 부모요소 div 요소를 가지고온다.
					
					//var comm_content = selEle.children('p:nth-child(1)').text(); // 댓글 내용
					
										
					selEle.children('textarea').val(comm_content); // 기존에 댓글을 textarea 에 넣는다.
					selEle.children('div[class="tfDiv"]').css({'display':'block'}); //댓글 수정 창 띄우기
					return false;	

				});
				//댓글 수정 버튼 누를 시 초록색 체크 버튼
				$(document).on('click','[id="inputUpdate"]', function(){
					var topselEle = $(this).parents(); // 수정 버튼 가장 위의 부모요소를 가지고 온다.
					var childselEle = $(this).parent(); //수정 버튼 부모요소 div 요소 가지고 온다
					
					//input type="hidden" 으로 된 handout_post_num 의 value 값을 변수에 저장한다.					
					var handout_post_num = $('#handout_post_num').val();
					
					
					//inputUpdate에 value 값을 handout_comm_num 변수에 저장한다.
					var handout_comm_num = $(this).val();
					
					
					//댓글 수정 textarea 에서 입력한 값을 변수에 저장한다.
					var comm_content = childselEle.children('textarea').val();
					
					//초록색 체크 버튼 누를시에 다시 댓글 수정 textarea 와 초록색 버튼 숨기기.
					topselEle.children('div[class="tfDiv"]').css({'display':'none'});
					
					//ajax 처리를 위해 매개 변수를 받아 넘겨준다.
					UpdateHandOutComment(handout_comm_num, comm_content, handout_post_num);
					
					return false;
					
				});
				
				//댓글삭제 버튼
				$(document).on('click','[value="댓글삭제"]', function(){
					
					//댓글삭제 다음에 위치한 handout_comm_num 값을 가지고 와서 변수에 넣는다.
					var selEle = $(this).next(); 
					
					
					var handout_post_num = $('#handout_post_num').val();
					
					var handout_comm_num = selEle.val();
					
					
					DeleteHandOutComment(handout_comm_num, handout_post_num);
					
					return false;
				})

			});
</script>

<script type="text/javascript" src="../semiview/menu/handOut/jquery.js"></script>
</head>
<body>
<jsp:scriptlet>

	//치환 변수 선언
	pageContext.setAttribute("cr", "\r");  //space
	pageContext.setAttribute("cn", "\n"); //Enter
	pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	

</jsp:scriptlet>

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
			<div id="inputContent">
				<table>
					<tr>
						<td>닉네임</td>
						<td>${dto.nickname}</td>
						<td>조회수</td>
						<td>${dto.readcount}</td>
					</tr>

					<tr>
						<td>제목</td>
						<td colspan="3">${dto.title}</td>
					</tr>

					<tr>
						<td>지역</td>

						<td colspan="3">${dto.area}</td>
					</tr>
					<tr>
						<td>종류</td>

						<td colspan="3">${dto.type_list}</td>
					</tr>
					<tr>
						<td>사용기간</td>

						<td colspan="3">${dto.period_list}</td>
					</tr>

					<tr>
					<tr>
						<td>내용</td>

						<td colspan="3">${dto.content}</td>
					</tr>
					<td>메인이미지</td>
					<td colspan="3"><img id="main_image" width="200px"
						height="200px"
						src="../semiview/images/handout/${dto.main_picture}" /></td>
					</tr>
					<tr>
						<td>서브이미지1</td>
						<td colspan="3"><img id="sub_image1"
							src="../semiview/images/handout/${dto.picture1}" /></td>
					</tr>

					<tr>
						<td>서브이미지2</td>
						<td colspan="3"><img id="sub_image2"
							src="../semiview/images/handout/${dto.picture2}" /></td>
					</tr>
					<tr>
						<td>서브이미지3</td>
						<td colspan="3"><img id="sub_image3"
							src="../semiview/images/handout/${dto.picture3}" /></td>
					</tr>
				</table>
				<div id="buttonGroup">
					<form name="frm" method="POST">
						<input type="hidden" name="handout_post_num" value="${dto.handout_post_num}" id="handout_post_num"/> 
						<input type="hidden" name="pageNum" value="${param.pageNum}" id="pageNum"/> 
					
						<input type="button" id="list" name="list" value="목록" /> 
						<input type="button" id="update" name="update" value="수정" /> 
						<input type="button" id="del" name="del" value="삭제" />
						<input type="button" name="cancel" id="cancel" value="취소" />

					
				</div>
			</div>
					</form>
			<!-- 댓글 입력/댓글 내용 출력 -->	
			

				<!-- 댓글목록출력 -->
				
				<!-- ajax를 사용해보자!! 두둥ㅡ!! -->
				
				<div id="commContent" style="clear: both; overflow: auto;">
					<script type="text/javascript">
						listView("${requestScope.dto.handout_post_num}")
					</script>
				</div>
			<div id="commDiv">


				<!-- 댓글입력 -->
				<div id="commAdd">
					<div id="nicknameAndTextInputDIV">
					<input type="text" id="nickname" name="nickname" value="닉네임"/>
					
					<textarea id="comment_content" name="textInput" placeholder="댓글을 입력해주세요"></textarea>
					</div>	
					<div id="commBtnDIV"">
						<input type="image" id="callImage" name="callImage" src="../semiview/images/handout/call_off.png"/>
						<input type="image" id="quesImage" name="quesImage" src="../semiview/images/handout/ques_off.png"/>
						
						<input type="hidden" id="image" name="image" value=""/>
						<input type="hidden" name="handout_post_num" value="${dto.handout_post_num}" id="handout_post_num"/>
						
						<!-- <img id="callImage" name="callImage" src="../semiview/images/handout/call_off.png"/>
						<img id="quesImage" name="quesImage" src="../semiview/images/handout/ques_off.png"/> -->
						
						<label for="commInputBtn" id="commInputBtnLabel"></label>
						<input type="button" id="commInputBtn" name="commInputBtn" value="댓글입력"/>
					</div>
					
				</div>
				
				<!-- 댓글수정 -->
				<%-- <div id="divUpdate">
					<input type="hidden" id="handout_comm_num" value="${dto.handout_post_num}"/>
					<textarea id="comm_content" rows="10" cols="20"></textarea>		
					<input type="button" id="commBtnUpdate" value="댓글수정"/>	
				</div> --%>
				
				
			</div>
				
			</div>
				
		</div>
	
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>