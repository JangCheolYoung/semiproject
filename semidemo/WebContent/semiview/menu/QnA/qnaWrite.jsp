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

/*----영철스 놉 혜린스 타임------------------------------------------------------------*/

#content{
	width: 100%;
	height: 700px;
	/* background-color: yellow; */
	margin-right: auto;
	margin-left: auto;
}

#content #inputContent{
	width: 90%;
	height: 700px;
	/* background-color: pink; */
	margin:auto;
	margin-top:30px;
}

#content #inputContent .qna_logoBox{
	width: 100%;
	height: 130px;
	/* background-color: red; */
	border-bottom: 3px solid #ccc; 
	margin:auto;
}

#content #inputContent .qna_logoBox img{
	width: 250px;
	height: 130px;
	size : 250px 130px;
	float: left;
}

#content #inputContent .qna_categoryBox{
	width: 100%;
	height: 61px;
	margin-top: 20px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qna_categoryBox #qna_category{
	width: 200px;
	height: 40px;
	margin-top: 10px;
	border-radius: 5px;
}

#content #inputContent .qna_categoryBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .qna_titleBox{
	width: 100%;
	height: 71px;
	/* background-color: green; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qna_titleBox #qna_title{
	width: 300px;
	height: 40px;
	margin-top: 10px;
	border-radius: 5px;
	display: inline-block;
}

#content #inputContent .qna_contentBox{
	width: 100%;
	height: 251px;
	/* background-color: yellow; */
	border-bottom: 3px solid #ccc; 
}

#content #inputContent .qna_contentBox #qna_content{
	width: 700px;
	height: 200px;
	margin-top: 10px;
	border-radius: 5px;
}

#content #inputContent .qna_buttonBox{
	width: 100%;
	height: 50px;
	/* background-color: orange; */
	margin-top : 10px;
}

#content #inputContent .qna_buttonBox .qna_imageButtonBox{
	width: 50px;
	height: 50px;
	/* background-color: yellow; */
	display: inline-block;
	padding-left: 80%;
	padding-right: 10px;
}

#content #inputContent .qna_buttonBox .qna_imageButtonBox #imagelabel{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-left:5px;
	background-image: url("../semiview/images/qna/qna_folder.png");
	backgroundsize : 40px;
	background-repeat: no-repeat;
}

#content #inputContent .qna_buttonBox .qna_submitButtonBox{
	width: 50px;
	height: 50px;
	/* background-color: green; */
	display: inline-block;
	padding-right: 5px;
}

#content #inputContent .qna_buttonBox .qna_submitButtonBox #submitlabel{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-left:5px;
	background-image: url("../semiview/images/qna/qna_submit.png");
	background-size : 40px;
	background-repeat: no-repeat;
}

.qna_imageButtonBox #image, .qna_submitButtonBox #submit{
	position: absolute;
   	width : 1px;
   	height: 1px;
   	padding: 0;
   	margin: -1px;
   	overflow: hidden;
   	clip : rect(0,0,0,0);
   	border : 0;
}

#content #inputContent .qna_buttonBox a #cancel{
	width: 40px;
	height: 40px;
	margin-top : 5px;
}

/*----------------------------------------------------------------------------*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginBtn').hover(
			function() {
			$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
			function() {
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));}
			
		);
		
		$('#submit').on('click', function(){
			
			var category = $('#qna_category').val();
			var title = $('#qna_title').val();
			var content = $('#qna_content').val();
			
			if(category == '분류'){
				alert("분류를 선택하세요.");
				return false;
			}
			if(title == ''){
				alert("제목을 입력하세요.");
				return false;
			}
			if(content == ''){
				alert("내용을 입력하세요.");
				return false;
			}
			
			if(strByteLength(title) > 70){
				alert("제목은 간략하게 입력해 주세요.");
				return false;
			}
			
			
		});
	});
	
	var strByteLength = function(s,b,i,c){
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		return b;
	};
	
	
</script>
</head>

<body>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
  		 </header>
		
		
		
		<!--------------------------------- 글쓰기 입력부분 -------------------------------------------->
		<div id="content"
			alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			
			<div id="inputContent">
				<form action="qnaWrite.do" id="qnaWrite" method="post" enctype="multipart/form-data">
				<c:if test = "${!empty param.qna_num }">
					<input type = "hidden" name = "qna_num" value = "${param.qna_num }" />
					<input type = "hidden" name = "ref" value = "${param.ref}" /> 
			 		<input type = "hidden" name = "re_step" value = "${param.re_step}" />
			 		<input type = "hidden" name = "re_level" value = "${param.re_level}" />
			 		<input type = "hidden" name = "pageNum" value = "${param.pageNum}" />
			 		<input type = "hidden" name = "qna_category" value="${param.qna_category}"/>
			 		<input type = "hidden" name = "content" value="${param.content}"/>
			 		
			 	</c:if>
			 		<input type = "hidden" name = "nickname" value="${sessionScope.nickname}"/>
				
					<div class="qna_logoBox">
					<c:if test="${empty param.qna_num }">
						<img alt="Q&A 글쓰기 로고입니다." src="../semiview/images/qna/qnaWrite_logo.png" id=logo>
					</c:if>
					<c:if test="${!empty param.qna_num }">
						<img alt="Q&A 답변 로고입니다." src="../semiview/images/qna/qnaRe_logo.png" id=logo>
					</c:if>
					</div>
					
					<div class="qna_categoryBox">
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
						<c:if test="${!empty param.qna_num }">
							<span>분류 : ${param.qna_category} </span><br/>
						</c:if>
					</div>
					
					<div class="qna_titleBox">
					<c:if test="${!empty param.qna_num }">
						<span>[답변]&nbsp;&nbsp;</span>
					</c:if>
						<input type="text" id="qna_title" name="qna_title" placeholder="제목을 입력하세요."/>
					</div>
					
					<div class="qna_contentBox">
						<textarea id="qna_content" name="qna_content" placeholder="내용을 입력하세요.">${param.content}</textarea>
					</div>
					
					<div class="qna_buttonBox"><!-- div 추가했습니다. -->
					
						<div class="qna_imageButtonBox">
							<label for = "image" id = "imagelabel"></label>
							<input type="file" id="image" name="image" value="첨부파일"/><!-- 아이디값 추가했습니다. -->
						</div>
						
						<div class="qna_submitButtonBox">
							<label for = "submit" id = "submitlabel"></label>
							<input type="submit" id="submit" name="submit" value="등록"/><!-- 아이디값 추가했습니다. -->
						</div>
						
						<a href="question.do"><img id="cancel" src="../semiview/images/qna/qna_cancel.png"/></a><!-- 아이디값 추가했습니다. -->
						
					</div>
					
				</form>
			</div>
			
		</div>
		<!--------------------------------- 글쓰기 입력부분 -------------------------------------------->
		
	</div>
	<a href = "login.do"><img id="loginBtn" src="../semiview/images/loginBtn_off.png"/></a>

</body>
</html>