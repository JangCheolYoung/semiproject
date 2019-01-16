<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료나눔 수정페이지</title>
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

/*---------------------------글쓰기 공간 css-----------------------------------*/

#content{
	width: 100%;
	height: 800px;
	/* background-color: yellow; */
	margin-right: auto;
	margin-left: auto;	
}

#content #inputContent {
	width: 90%;
	height: 800px;
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

#content #inputContent .handout_title {
	width: 100%;
	height: 71px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	
	
}

#content #inputContent .handout_title #title{
	width: 300px;
	height: 40px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	border-radius: 5px;
	/* background-color: yellow; */
}

#content #inputContent .handout_nickname {
	width: 100%;
	height: 71px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	
	
}

#content #inputContent .handout_nickname span{
	width: 300px;
	height: 40px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	border-radius: 5px;
	/* background-color: yellow; */
}

#content #inputContent .handout_categori {
	width: 100%;
	height: 71px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
}

#content #inputContent .handout_categori select{
	width: 200px;
	height: 40px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .handout_content {
	width: 100%;
	height: 300px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 3px solid #ccc;
	padding-bottom: 15px;
	margin-bottom: 10px;
}

#content #inputContent .handout_content textarea {
	width: 73%;
	height: 250px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc;
	display: block;
	float: left;
	border-radius: 5px;
}




/*무료 나눔하기 이미지 사이즈 조절*/
/* #handOut {
	display: inline-block;
	margin-top: 10px;
	width: 291px;
	height: 113px;
} */

/*제목,닉네임,카테고리,내용 DIV*/
/* #left {
	float: left;
	border: 1px solid black;
	border-radius: 5px;
} */

/*이미지,file 선택 DIV*/
#right {
	float: right;
	border: 1px solid black;
	border-radius: 5px;
	 
}

/*등록하기 , 취소하기 버튼 DIV*/
#upAndcenclebutton {
	clear: both;
	margin-top: 10px;
	margin: auto;
}

/*메인이미지,이미지1,2,3 라벨 스타일 적용 : 라벨을 블록요소로 지정해서 버튼처럼 만들었다.*/
.fileImages {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/*input type="file" 숨기는 스타일 적용 : 라벨을 버튼으로 만들고 file 선택을 숨겼다.*/
.inputFiles {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/*등록하기,취소하기 버튼 사이즈 조절 css*/
.uploadAndcancel {
	width: 111px;
	height: 53px;
}

/*등록 버튼 css*/
#upload {
	width:100px;
    background-color: #FFDCE1;
    border: none;
    /* color:#fff; */
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 5px;
}

#cancel{
	width:100px;
    background-color: #FFDCE1;
    border: none;
    /* color:#fff; */
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 5px;
}

/*-------------------------------------------------------------------------*/
</style>
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

				//등록 버튼 이미지 hover 적용
				$('#uploadImage').hover(
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

				//취소 버튼 이미지 hover 적용
				$('#cancelImage').hover(
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
				
				//등록버튼 서브밋 이벤트.
				$('form').on('submit', function(){
					$('[name=contents]').val($('[name=contents]').val().replace(/\n/gi,'<br/>'));
					//제목, 내용 빈칸일시 alert
			         var title = $('#title').val();
			         if (title == "") {
			            alert("제목을 입력하세요");
			            return false;
			         }

			         var contents = $('#contents').val();
			         if (contents == "") {
			            alert("내용을 입력하세요!");
			            return false;
			         }
			         //지역 콤보박스
			         var area = $('#area').val();
			         if (area == "지역별") {
				            alert("지역을 입력하세요");
				            return false;
				         }
			         //종류 콤보박스
			         var type = $('#kinds').val();
			         if (type == "종류") {
				            alert("종류를 입력하세요");
				            return false;
				         }
			         //사용기간 콤보박스
			         var term = $('#useTerm').val();
			         if (term == "사용기간") {
				            alert("사용기간을 입력하세요");
				            return false;
				         }
			         //상품상태 콤보박스
			         var condition = $('#itemCondition').val();
			         if (condition == "상품상태") {
				            alert("상품상태를 입력하세요");
				            return false;
			         }
											
				});
				
				//mainfile 요소에서 change 이벤트가 발생하면,
				$('#mainfile').on('change', function(){
					alert($('#mainfile').val());
					var str = $('#mainfile').val();
					
					//제한 두기
					//이미지 첨부파일인지 체크
					//정규화 표현식 이용
					var patt = /(.jpg$|.gif$|.png$|.PNG$)/g;
					var result = str.match(patt);
					
					if(!result){
						//null이면
						alert('jpg, gif, png만 가능합니다.');
						$('#mainfile').val(''); //초기화를 시켜줌
						$('#mainImage').attr('src',"../semiview/images/handout/photo.png");
						
						return false;
					}
					if(this.files && this.files[0]){
						if(this.files[0].size > 10000000){
							alert('10MB바이트 이하만 첨부하실 수 있습니다.');
							$('#mainfile').val('');
							return false;
						}
					}
					
					//파일 읽어와서 카메라 모양 잡힌곳에 넣어주기.
					//파일을 읽기 위한 filereader 객체생성
					var reader = new FileReader();
					//file 내용을 읽어 dataURL 형식의 문자열로 저장.
					reader.readAsDataURL(this.files[0]);
					
					//파일 읽기 성공시 호출되는 이벤트 핸들러
					reader.onload = function(e){
						$('#mainImage').attr("src", e.target.result);
					};
					
				});
				
				//이미지1 요소에서 change 이벤트가 발생하면,
				$('#file1').on('change', function(){
					var str = $('#file1').val();
					
					//제한 두기
					//이미지 첨부파일인지 체크
					//정규화 표현식 이용
					var patt = /(.jpg$|.gif$|.png$|.PNG$)/g;
					var result = str.match(patt);
					
					if(!result){
						//null이면
						alert('jpg, gif, png만 가능합니다.');
						$('#file1').val(''); //초기화를 시켜줌
						
						
						return false;
					}
					if(this.files && this.files[0]){
						if(this.files[0].size > 10000000){
							alert('10MB바이트 이하만 첨부하실 수 있습니다.');
							$('#file1').val('');
							return false;
						}
					}
				});
				
				//이미지2 요소에서 change 이벤트가 발생하면,
				$('#file2').on('change', function(){
					var str = $('#file2').val();
					
					//제한 두기
					//이미지 첨부파일인지 체크
					//정규화 표현식 이용
					var patt = /(.jpg$|.gif$|.png$|.PNG$)/g;
					var result = str.match(patt);
					
					if(!result){
						//null이면
						alert('jpg, gif, png만 가능합니다.');
						$('#file2').val(''); //초기화를 시켜줌
						
						
						return false;
					}
					if(this.files && this.files[0]){
						if(this.files[0].size > 10000000){
							alert('10MB바이트 이하만 첨부하실 수 있습니다.');
							$('#file2').val('');
							return false;
						}
					}
				});
				
				//이미지3 요소에서 change 이벤트가 발생하면,
				$('#file3').on('change', function(){
					var str = $('#file3').val();
					
					//제한 두기
					//이미지 첨부파일인지 체크
					//정규화 표현식 이용
					var patt = /(.jpg$|.gif$|.png$|.PNG$)/g;
					var result = str.match(patt);
					
					if(!result){
						//null이면
						alert('jpg, gif, png만 가능합니다.');
						$('#file3').val(''); //초기화를 시켜줌
						
						
						return false;
					}
					if(this.files && this.files[0]){
						if(this.files[0].size > 10000000){
							alert('10MB바이트 이하만 첨부하실 수 있습니다.');
							$('#file3').val('');
							return false;
						}
					}
				});
					
				
				
				

			
			});
</script>
</head>
<body>
<jsp:scriptlet>

	//치환 변수 선언
	pageContext.setAttribute("cr", "\r");  //space
	pageContext.setAttribute("cn", "\n"); //Enter
	pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	

</jsp:scriptlet>

	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
		</header>

		<!-- ----------------------------글쓰기 DIV 시작------------------------------ -->

		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<!-- 무료나눔하기 글쓰기 페이지 구현 소스 -->
			<div id="inputContent">
				<div class="handout_logoBox">
					<img src="../semiview/images/handout/handout_updateLogo.png"/>
				</div>
				<form name="writeForm" id="writeForm" method="POST"	action="handOutUpdatePro.do?pageNum=${param.pageNum}" enctype="multipart/form-data">
				<input type="hidden" id="handout_post_num" name="handout_post_num" value="${dto.handout_post_num}"/>
				<div class="handout_nickname">
					<span>작성자 : ${dto.nickname}</span>
				</div>
				<div class="handout_title">
					<input type="text" id="title" name="title" placeholder="제목" value="${dto.title}" />
				</div>
				<div class="handout_categori">
					<select id="area" name="area">
						<option value="지역별">지역별</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="광주">광주</option>
						<option value="대구">대구</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
					</select> 
					<select id="kinds" name="kinds">
						<option value="종류">종류</option>
						<option value="가구">가구</option>
						<option value="장난감">장난감</option>
						<option value="옷">옷</option>
						<option value="신발">신발</option>
						<option value="카시트">카시트</option>
						<option value="유모차">유모차</option>
					</select> 
					<select id="useTerm" name="period of use">
						<option value="사용기간">사용기간</option>
						<option value="1개월~3개월">1개월~3개월</option>
						<option value="4개월~6개월">4개월~6개월</option>
						<option value="7개월~9개월">7개월~9개월</option>
						<option value="10개월~12개월">10개월~12개월</option>
						<option value="1년이상">1년이상</option>
					</select> 
					<select id="itemCondition" name="Product status">
						<option value="상품상태">상품상태</option>
						<option value="최상">최상</option>
						<option value="상">상</option>
						<option value="중">중</option>
						<option value="하">하</option>
					</select>
				</div>
				<div class="handout_content">
					<textarea id="contents" name="contents"	placeholder="무료 나눔 상품에 대해 설명해주세요"><c:out value="${fn:replace(dto.content, '<br/>', cn)}" /></textarea>
					<div id="right">
						<div class="mainImage">
							<img id="mainImage" width="200px" height="200px"
								src="../semiview/images/handout/${dto.main_picture}" /></br> 
							<label for="mainfile" class="fileImages">메인이미지</label> 
							<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" name="mainfile" id="mainfile" value="${dto.main_picture}"/></a> 
							<label for="file1" class="fileImages">이미지1</label> 
							<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" id="file1" name="file1" value="${dto.picture1}"/></a></br> 
							<label for="file2" class="fileImages">이미지2</label>
							<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input	type="file" id="file2"  name="file2" value="${dto.picture2}"/></a> 
							<label for="file3"	class="fileImages">이미지3</label> 
							<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" id="file3" name="file3" value="${dto.picture3}"/></a></br>
						</div>
					</div>
				</div>
				<div id="upAndcenclebutton" alt="등록/취소 버튼 div" align="center">
					
					<input type="submit" name="submit" id="upload" value="등록" class="uploadAndcancel"/>
					<a href="handOut.do"> 
					<input type="button" name="cancel" id="cancel" value="취소" class="uploadAndcancel"/>
					</a>
				</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>