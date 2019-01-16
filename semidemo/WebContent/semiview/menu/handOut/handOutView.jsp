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

/*페이지마다 새롭게 추가될 DIV*/
#content{
	width: 100%;
	height: 700px;
	/* background-color: yellow; */
	margin-right: auto;
	margin-left: auto;
}


#content #inputContent {
	width: 90%;
	height: 700px;
	/* background-color: pink; */
	margin:auto;
	margin-top:30px;
}


#content #inputContent .handout_logoBox{
	width: 100%;
	height: 130px;
	border-bottom: 3px solid #ccc;
	margin: auto;
}

#content #inputContent .handout_logoBox img{
	width: 250px;
	height: 130px;
	size : 250px 130px;
	float: left;
}

#content #inputContent .handout_nickname{
	width: 50%;
	height: 61px;
	margin-top: 20px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	float: left; 	
}

#content #inputContent .handout_nickname span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* font-weight: bold; */
	/* background-color: yellow; */
}

#content #inputContent .handout_readcount{
	width: 50%;
	height: 61px;
	margin-top: 20px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	float: right;
	text-align: right;
	
}

#content #inputContent .handout_readcount span{
	display: inline-block;
	float: right;
	width: 200px;
	height: 61px;
	/*margin-top: 10px;*/
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	padding-right: 215px;
	
	/* background-color: yellow; */
}

#content #inputContent .handout_title {
	width: 100%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	clear: both;
	
}

#content #inputContent .handout_title span{
	width: 100%;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_area {
	width: 33%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	float: left;
}

#content #inputContent .handout_area span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_type_list {
	width: 33%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	float: left;
	
}

#content #inputContent .handout_type_list span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_period_list {
	width: 33%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	float: left; 
	
}

#content #inputContent .handout_period_list span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_contentBox{
	width: 100%;
	clear: both;
	/* height: 512px; */
	/* background-color: pink;*/	
	border-bottom: 3px solid #ccc; 
}

#content #inputContent .handout_contentBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_contentBox .handout_pictures{
	width: 95%;
	height: 500px;
	margin-top: 5px;
	/* background-color: pink; */
}

#content #inputContent .handout_contentBox .handout_pictures img{
	width: 60%;
	height : 100%;
	padding-left : 10%;
	/*height: 100%;*/
	/* size : 100%; */
}

#content #inputContent .handout_contentBox .handout_content1{
	width: 95%;
	/* height: 200px; */
	margin-top: 20px;
	margin-bottom: 20px;
	/* border : 2px dashed #ccc; */
	border-radius: 5px;
}

#content #inputContent .handout_contentBox .handout_content2{
	width: 95%;
	/*height: 200px;*/
	margin-top: 30px;
	margin-bottom: 20px;
	/* border : 2px dashed #ccc; */
	border-radius: 5px;
}



/***************************************************************************/
/*등록/삭제/수정/취소 버튼 DIV*/
#content #inputContent .buttonBox {
	width: 100%;
	height: 50px;
	/* background-color: orange; */
	margin-top : 20px;
	margin-bottom: 20px;
	border-bottom: 3px solid #ccc;
	
}

#content #inputContent .buttonBox #list{
	display: inline-block;
	width: 40px;
	height: 40px;
	size: 40px 40px;
	/* padding-left : 75%; */
	/* padding-right: 10px; */
	float: right;
	background-image: url("../semiview/images/handout/handout_list.png");
	background-size: 40px 40px;
	background-repeat: no-repeat;
	
}

#content #inputContent .buttonBox #update{
	display: inline-block;
	width: 40px;
	height: 40px;
	/* padding-right: 10px; */
	float: right;
	background-image: url("../semiview/images/handout/handout_modify.png");
	background-size: 40px 40px;
	background-repeat: no-repeat;
	
}

#content #inputContent .buttonBox #del{
	display: inline-block;
	width: 40px;
	height: 40px;
	/* padding-right: 10px; */
	float: right;
	background-image: url("../semiview/images/handout/handout_delete.png");
	background-size: 40px 40px;
	background-repeat: no-repeat;
	
	
}

#content #inputContent .buttonBox #cancel{
	display: inline-block;
	width: 40px;
	height: 40px;
	/* padding-right: 5px; */
	float: right;
	background-image: url("../semiview/images/handout/handout_cancel.png");
	background-size: 40px 40px;
	background-repeat: no-repeat;
	
}


/**************************댓글 등록 CSS*****************************************/

#commDiv{
	border: 1px solid #e7e7e7;
	border-radius: 5px;
	width: 100%;
	overflow: auto;
	margin-bottom: 10px;
}
/*댓글입력 DIV*/
#commAdd{
	border: 1px solid black;
	border-radius: 5px;
	margin: auto;
	width: 80%;
	height: 230px;
	margin-top: 20px;
}

/*댓글입력 텍스트필드*/
#comment_content  {
	width: 480px;
	height: 80px;
}

/*댓글 입력하면 띄우는 내용 DIV*/
#commContent {
	border: 1px solid #e7e7e7;
	border-radius: 5px;
	width: 100%;
	clear: both;
	overflow: auto;
	margin-bottom: 10px;
	
}


/*댓글 등록 닉네임 내용란 DIV*/
#nicknameAndTextInputDIV{
	float: left;
	margin-top: 10px;
	margin-left: 20px;
	
}

#nicknameDiv {
	margin-bottom: 5px;
}

#nicknameDiv input{
	width: 150px;
	height: 30px;
	border-radius: 5px;
}

#textInputDiv textarea{
	width: 600px;
	height: 70px;
	border-radius: 5px;
}

#callImage, #quesImage{
	width: 40px;
	height: 40px;
}

/*댓글 등록 버튼 라벨*/
#commInputBtnLabel{
	display: inline-block;
	background-image: url("../semiview/images/upload_off.png");
	background-repeat: no-repeat;
	background-size: 100%;
	width:100px;
	height: 50px;
}

/*댓글입력버튼 label 남기고 버튼 숨기기.*/
#commInputBtn{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
	display: none;
}

/*댓글입력 버튼 div*/
#commBtnDIV {
	float: right;
}


/*****************************************************************************************/
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
					
					if($('[name=textInput]').val() == ""){
						alert('댓글을 입력해주세요.');
						return false;
					}
					
					if($('#callImage').attr("src") == "../semiview/images/handout/call_off.png" && $('#quesImage').attr("src") == "../semiview/images/handout/ques_off.png"){
						alert('질문유형을 선택해주세요.');
						return false;
					}
					
					if($('#callImage').attr("src") == "../semiview/images/handout/call_on.png") {
						$('#image').attr("value","call_on.png");
						
					} else if($('#quesImage').attr("src") == "../semiview/images/handout/ques_on.png"){
						$('#image').attr("value","ques_on.png");
					} 
					
					$('[name=textInput]').val($('[name=textInput]').val().replace(/\n/gi,'<br/>'));
					
					
					insertHandOutComment();  //댓글입력 function()
					$('[name=textInput]').val("");
					if($('#callImage').attr("src") == "../semiview/images/handout/call_on.png"){
						$('#callImage').attr("src",$('#callImage').attr("src").replace("on.png","off.png"));
					} else if($('#quesImage').attr("src") == "../semiview/images/handout/ques_on.png"){
						$('#quesImage').attr("src",$('#quesImage').attr("src").replace("on.png","off.png"));
					}
					
					
				});
				
								
							
				//댓글 수정 버튼
				$(document).on('click','[name="commUpdateBtn"]', function(){
					
					var selEle = $(this).parent().parent(); //댓글수정 버튼 부모요소 div 요소를 가지고온다.
					//var selEle = $(this).parent().parent();
					alert(selEle.html());
					//var comm_content = selEle.children('p[id=comm_content]').html(); // 댓글 내용
					//alert(comm_content);
										
					//selEle.children('#commtf').val(comm_content); // 기존에 댓글을 textarea 에 넣는다.
					//selEle.children('div[class="tfDiv"]').css({'display':'block'}); //댓글 수정 창 띄우기
					//return false;
					
					if(selEle.children('div[class="tfDiv"]').css("display") =="none"){
						var pInput = selEle.children('div[id="centerDiv"]').children('p').text();
						alert(pInput);
						selEle.children('div[class="tfDiv"]').children('textarea').val(pInput);
						selEle.children('div[class="tfDiv"]').show();
					}else{
						selEle.children('div[class="tfDiv"]').hide();
					}

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
					
					if(comm_content == ""){
						alert('수정사항을 입력해주세요.');
						return false;
					}
					
					//초록색 체크 버튼 누를시에 다시 댓글 수정 textarea 와 초록색 버튼 숨기기.
					topselEle.children('div[class="tfDiv"]').css({'display':'none'});
					
					//ajax 처리를 위해 매개 변수를 받아 넘겨준다.
					UpdateHandOutComment(handout_comm_num, comm_content, handout_post_num);
					
					return false;
					
				});
				
				//댓글삭제 버튼
				$(document).on('click','[name="commDeleteBtn"]', function(){
					
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
		<<header>
			<jsp:include page="../topmenu.jsp" />
		</header>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<div id="inputContent">
				<div class="handout_logoBox">
					<img src="../semiview/images/handout/handout_viewLogo.png"/>
				</div>
				
				<div class="handout_nickname">
					<span>글쓴이 : ${dto.nickname}</span>
				</div>
				
				<div class="handout_readcount">
					<span>조회수 : ${dto.readcount}</span>
				</div>
				
				<div class="handout_title">
					<span>제목 : ${dto.title}</span>
				</div>
				
				<div class="handout_area">
					<span>지역 : ${dto.area}</span>
				</div>
				
				<div class="handout_type_list">
					<span>종류 : ${dto.type_list}</span>
				</div>
				
				<div class="handout_period_list">
					<span>사용기간 : ${dto.period_list}</span>
				</div>
				
				<div class="handout_contentBox">
					<div class="handout_content1">
					<span>내용</span>
					</div>
					<div class="handout_pictures">
						<img src="../semiview/images/handout/${dto.main_picture}"/>
					</div>
					<div class="handout_pictures">
						<img src="../semiview/images/handout/${dto.picture1}"/>
					</div>
					<div class="handout_pictures">
						<img src="../semiview/images/handout/${dto.picture2}"/>
					</div>
					<div class="handout_pictures">
						<img src="../semiview/images/handout/${dto.picture3}"/>
					</div>
					<div class = "handout_content2">
						${dto.content}
					</div>
					
				</div>
				
		<!-- -------------------------------------------------------------------- -->
				<form name="frm" method="POST">
					<div class="buttonBox">
						<input type="hidden" name="handout_post_num" value="${dto.handout_post_num}" id="handout_post_num"/> 
						<input type="hidden" name="pageNum" value="${param.pageNum}" id="pageNum"/> 
					
						<!-- <input type="button" name="cancel" id="cancel" value="취소" /> -->
						<div id="cancel"></div>
						<!-- <input type="button" id="del" name="del" value="삭제" /> -->
						<div id="del"></div>
						<!-- <input type="button" id="update" name="update" value="수정" />  -->
						<div id="update"></div>
						<!-- <input type="button" id="list" name="list" value="목록" /> --> 
						<div id="list"></div>
					
					</div>
				</form>
				<!-- 댓글 입력/댓글 내용 출력 -->
				<!-- 댓글목록출력 -->		
				<div id="commContent">
					<script type="text/javascript">
						listView("${requestScope.dto.handout_post_num}")
					</script>
				</div>
	
			<div id="commDiv">
				<!-- 댓글입력 -->
				<div id="commAdd">
					<div id="nicknameAndTextInputDIV">
						<div id="nicknameDiv">
						<input type="text" id="nickname" name="nickname" value="닉네임"/>
						</div>
						<div id="textInputDiv">
						<textarea class="commTextArea" id="comment_content" name="textInput" placeholder="댓글을 입력해주세요"></textarea>
						</div>
					</div>	
					<div id="commBtnDIV">
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
			</div>
		</div><!-- inputContent div 끝 -->
		
			
			

		</div>
	</div>
	
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>