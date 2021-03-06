<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core 등록 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
	left: 85%;
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


/*-----------------------------입력칸 css------------------------------*/	

.talkAll{
	margin : auto;
	border : 1px solid #ccc;
	border-top : none;
	border-bottom : none;
	margin-top : 20px;
	margin-bottom : 20px;
	width : 100%;
	/* background-color: white; */
	/* background-image: url("../semiview/images/momtalk/momtalk_background.png");
	background-size: 110px; */
	background-repeat: repeat;
}


.inputDiv .inputText {
	width : 720px;
	height : 300px;
	margin-left : 15%;
	margin-top : 40px;
	padding : 0px;
	border-radius: 5px;
	background-color: white;
	/* margin : auto; */
	/* background-color: #EEEEEE; */
}

.inputDiv .inputText #momTalk_top{
	padding-left : 10px;
	width : 180px;
	height : 70px;
}

.inputDiv .inputText .left{
	width : 150px;
	height : 230px;
	/* background-color: olive; */
	float : left;
}

.inputDiv .inputText .left #profile{
	width : 100px;
	height : 100px;
	size: 100px;
	padding-left : 40px;
	padding-top : 25px;
}

.inputDiv .inputText .right{
	width : 550px;
	height : 230px;
	/* background-color: yellow; */
	float : right;
}

.inputDiv .inputText .right .username span{
	width : 550px;
	height : 30px;
	/* background-color: pink; */
}

.inputDiv .inputText .right .tfbox{
	width : 550px;
	height : 150px;
	/* background-color: blue; */
	
}

.inputDiv .inputText .right .tfbox textarea{
	margin-top : 10px;
	border-radius: 8px;
}

.inputDiv .inputText .right .buttonbox{
	width : 550px;
	height : 50px;
	/* background-color: aqua; */
	float : right;
	
}

.filebox1, .filebox2, .filebox3{
	display: inline-block;
	padding: 0px 6px;
	cursor: pointer;
}

.submitbox{
	display: inline-block;
	float : right;
	padding: 0px 6px;
	cursor: pointer;
	padding-right : 20px;
	width : 40px;
	height : 40px;
	background-image: url("../semiview/images/momtalk/send_off.png");
	background-size: 40px;
	background-repeat: no-repeat;
	
}


.filebox1 label, .filebox2 label, .filebox3 label {
	display: inline-block;
	width : 40px;
	height : 40px;
	background-image: url("../semiview/images/momtalk/files_off.png");
	background-size: 40px;
	background-repeat: no-repeat;
	cursor: pointer;
}

/* .submitbox label{
	display: inline-block;
	width : 40px;
	height : 40px;
	background-image: url("../semiview/images/momtalk/uploads_off.png");
	background-size: 40px;
	background-repeat: no-repeat;
	cursor: pointer;
} */

.filebox1 input[type="file"], .filebox2 input[type="file"], .filebox3 input[type="file"]/* , .submitbox input[type="submit"] */ {
	position: absolute;
	width : 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip : rect(0,0,0,0);
	border : 0;
}



/*----------------------------- 출력 게시물 css------------------------------*/	

.resultDiv{
	
}

#inputContent {
	width : 700px;
	/* height : 800px; */
	margin : auto;
	margin-top : 25px;
	/* background-color: black; */
}

.resultDiv .reultText{
	width : 700px;
	/* height : 800px; */
	margin : auto;
	margin-top : 25px;
	border-radius: 5px;
	background-color: white;
	/* background-color: yellow; */
}

.resultDiv .reultText .resultTop{
	width : 700px;
	height : 100px;
	border-bottom: 2px solid black;
	/* background-color: aqua; */
}

.resultTopImg, .resultTopInfo, .resultTopEmpty, .resultTopMenu{
	width : 175px;
	height : 100px;
	/* background-color: gray; */
	float : left;
}

.resultTopImg #resultImg{
	width : 90px;
	height : 90px;
	/* padding-top : 36px; */
	padding-left : 10px;
}

.resultTopMenu .menuBtn{
	width : 40px;
	height : 40px;
	/* background-color: gray; */
	padding : 5px;
	float : right;
}



.resultDiv .reultText .resultMain{
	width : 700px;
	/* height : 603px; */
	/* background-color: pink; */
}


.resultMain .resultMainRight{
	width : 700px;
	/* height : 603px; */
	/* background-color: red; */
	/* float : right; */
}

.resultMain .resultMainRight .resultMainFileImages{
	width : 700px;
	/* height : 451px; */
	margin : auto;
	/* background-color: pink; */
	/* float : right; */
}

.resultMain .resultMainRight .resultMainFileImages .FileImagesbxslider{
	padding-top: 10px;
	padding-left: 100px;
}

.resultMainFileImages .fileImage1, .resultMainFileImages .fileImage2, .resultMainFileImages .fileImage3{
	width : 600px;
	height : 400px;
	size: 600px;
}

.resultMain .resultMainRight .resultMainTfbox{
	width : 700px;
	height : 101px;
	/* margin : auto; */
	/* background-color: aqua; */
	/* float : right; */
}

.resultMain .resultMainRight .resultMainButtonbox{
	width : 700px;
	height : 51px;
	/* background-color: green; */
	/* float : right; */
}

.resultMainButtonbox .likeCntBtn, .resultMainButtonbox .commBtn{
	width : 40px;
	height : 40px;
	/* background-color: gray; */
	padding:5px;
	float : left;
}


/*--------------------------------------댓글입력 css---------------------------------------*/

.resultMain .resultMainRight .resultMainComm{
	width : 650px;
	/* height : 500px; */
	/* background-color: pink; */
	margin : auto;
	border-top : 2px dotted gray;
	display: none;
}

.resultMain .resultMainRight .resultMainComm .commList{
	width : 650px;
	height : 380px;
	/* background-color: yellow; */
	margin : auto;
	margin-top : 30px;
	border : 2px solid #ccc;
	border-right: none;
	border-left: none;
	overflow: auto;
}

.resultMain .resultMainRight .resultMainComm .commInput{
	width : 650px;
	height : 150px;  /* 150px; */
	/* background-color: #EEEEEE; */
	border : 2px dashed #ccc;
	border-radius : 8px;
	/* border: 3px dotted gray; */
	margin : auto;
	margin-top:70px;
}

.resultMainComm .commInput .commImageBox{
	width : 150px;
	height : 150px;
	/* background-color: pink; */
	float: left;
}

.resultMainComm .commInput .commImageBox #commImage{
	width : 80px;
	height : 80px;
	size: 80px;
	padding-top:35px;
	padding-left:35px;
}


.resultMainComm .commInput .commTextBox{
	width : 500px;
	height : 150px;
	float: left;
	border-radius: 8px;
	/* background-color: yellow; */
}

.resultMainComm .commInput .commTextBox textarea{
	border-radius: 8px;
}

.resultMainComm .commInput .commTextBox .commusername{
	width : 500px;
	height : 30px;
	/* background-color: red; */
}

.resultMainComm .commInput .commTextBox .commtfbox{
	width : 500px;
	height : 80px;
	/* background-color: pink; */
}

.resultMainComm .commInput .commTextBox .commsubmitbox{
	width : 500px;
	height : 40px;
	padding-right: 50px;
	/* background-color: aqua; */
}

.resultMainComm .commInput .commTextBox .comm .commsubmitBtn{
	width : 40px;
	height : 40px;
	size: 40px;
	float: right;
}


.commUpload {
	cursor: pointer;
}
 
/*--------------------------------------------------------------------------------------*/
</style>


<!-- bxslider를 사용하기 위한 추가(1) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- bxslider를 사용하기 위한 추가(2) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
	

<script src="semiview/menu/momTalk/momtalk.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//로그인버튼---------------------------------------------------------------------
		$('#loginBtn').hover(
			function() {
			$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
			function() {
			$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));});
		
		//댓글창이미지 hover버튼-------------------------------------------------------------
		$('.commBtn').hover(
				function() {
				$(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
				function() {
				$(this).attr("src",$(this).attr("src").replace("on.png","off.png"));});
		
		//좋아요버튼---------------------------------------------------------------------
		var state = $('.likeCntBtn').data('state'); //undefined
		$("#likeCntBtn"+$('input[name = "momtalk_post_num"]').val()).click(function(){
			state = !state;	//first click make this true
			//var momtalk_post_num = $('input[name = "momtalk_post_num"]').val();
			if(state){
				
				//alert(momtalk_post_num);
				//likeUpCnt(momtalk_post_num);
				
				$(this).attr("src",$(this).attr("src").replace("off.png","on.png")); return false;
			}else {
				
				//alert(momtalk_post_num);
				//likeDownCnt(momtalk_post_num);
				
				$(this).attr("src",$(this).attr("src").replace("on.png","off.png")); return false;
			}
			
			$(this).data('state', state); // save state
			
		});
		
		
		
		//삭제버튼---------------------------------------------------------------------------
		$('.menuBtn').on('click', function(){
			//alert($(this).parents().children('input[name = "nickname"]').val());
			
			if('${sessionScope.nickname }' != $(this).parents().children('input[name = "nickname"]').val()){
				
				alert("다른회원의 댓글은 삭제할 수 없습니다.");
				return false;
			}else{
				
				//회원인 경우
				if(confirm("정말로 삭제하시겠습니까?")){
					//확인버튼 누를 경우 실행
					//$('.frm2').attr('action', 'delete.do');
				    //$('.frm2').submit();
				    
				    var selEle = $(this).parents();
				    
				    var momtalk_post_num = selEle.children('input[name = "momtalk_post_num"]').val();
				    //alert(momtalk_post_num);
				    
					allDelete(momtalk_post_num);
					$('.frm2').attr('action', 'delete.do');
				    $('.frm2').submit();
					return false;
				}else{
					//취소버튼 누를 경우 실행
					return false;
				}						
				
			}
		});
		
		//게시글 입력 버튼-----------------------------------------------------------------------
		$('.submitbox').hover(
				function() {
					$(this).css({"background-image" : "url('../semiview/images/momtalk/send_on.png')"});},
					function() {
						$(this).css({"background-image" : "url('../semiview/images/momtalk/send_off.png')"});});
		
		
		$('.submitbox').on('click', function(){
			//회원이 아닌 경우(비회원인 경우)
			if($('#session_id').val() == "" || $('#session_id').val() == null || $('#session_id').val() =="null"){
				//창을 열지 않음
				alert("로그인 후 이용가능한 서비스 입니다.")
				
				///////////////////////////////////////////////////////////////////////////////
				
				$('.frm').attr('action', 'login.do');
				$('.frm').submit();
				
				///////////////////////////////////////////////////////////////////////////////
				
				//return false; //이벤트를 종료시킴
				
			}else{
				//$('form[class = "frm"]').submit();
				
				//입력된 값이 없는 경우
				if($('textarea[id="tf"]').val() == ""){
					//댓글이 입력되지 않은 상태로 댓글입력버튼을 누른경우
					alert("댓글을 입력해주세요!");
					return false;
				}else{
					$('form[class = "frm"]').submit();
				}
			}
		});
		
		
		//댓글달기창 열고닫는버튼-------------------------------------------------------------------------
		$('.commBtn').click(function(){
			//alert($(this).prop('id'));
			//$("div[id="+$(this).prop('id')+"]").toggle();
			
			//회원이 아닌 경우(비회원인 경우)
			if($('#session_id').val() == "" || $('#session_id').val() == null || $('#session_id').val() =="null"){
				//창을 열지 않음
				alert("로그인 후 이용가능한 서비스 입니다.")
				return false; //이벤트를 종료시킴
				
			}else{ //회원인 경우(정상동작을 하도록 함)
				if($("div[id="+$(this).prop('id')+"]").css("display") == "none"){
					$("div[id="+$(this).prop('id')+"]").show();
					
					//게시물 번호를 받아감
					var momtalk_post_num = $("input[id="+$(this).prop('id')+"]").val();
					console.log("댓글달기창 버튼 누름. : "+momtalk_post_num);
					listView(momtalk_post_num);
					
					
					//댓글입력버튼을 누르면/////////////////////////////////////////////////
					$(/* "input[id=submitBtn"+momtalk_post_num+"]" */'.commUpload').on('click', function(){
						console.log("댓글입력버튼을 누름. : "+momtalk_post_num);
						
						//댓글입력여부판단검사
						if($("textarea[id=commtfbox"+momtalk_post_num+"]").val() == ""){
							//댓글이 입력되지 않은 상태로 댓글입력버튼을 누른경우
							alert("댓글을 입력해주세요!");
							return false;
						}else{
							var nickname = $("span[id=commusername"+momtalk_post_num+"]").text();
							var content = $("textarea[id=commtfbox"+momtalk_post_num+"]").val();
							
							//alert(nickname);
							
							listInput(momtalk_post_num, content, nickname);
							$("textarea[id=commtfbox"+momtalk_post_num+"]").val("");							
						}
						
					});//댓글입력버튼////////////////////////////////////////////////////////
					
					//댓글삭제버튼을 누르면 (동적으로 이벤트 적용)
					$(document).on('click', '[class = "commDel"]', function(){
						//alert("댓글삭제버튼누름");
						//alert('세션 이지롱 : ${sessionScope.nickname }');
						//alert('span요소 이지롱 : '+$(this).parents().children('span:nth-of-type(1)').text());
						
						////////////////////////////////////////////////////////////////
						//로그인한 회원의 닉네임과 입력된 댓글의 닉네임이 같을때 (본인의 글일때)
						if('${sessionScope.nickname }' == $(this).parents().children('span:nth-of-type(1)').text()){
							var selEle = $(this).parent();//삭제버튼의 부모요소인 div요소를 가지고옴
							var momtalk_comm_num = selEle.children('input[name="momtalk_comm_num"]').val();
							
							listDelete(momtalk_comm_num, momtalk_post_num);							
						}else{ //본인이 입력한 댓글이 아닌 경우
							alert("권한이 없습니다.");
							return false;
						}
						return false;							
					});//댓글 삭제버튼//////////////////////////////////////////////////////
					
					//댓글수정버튼을 누르면 (동적으로 이벤트 적용)
					$(document).on('click', '[class = "commModi"]', function(){
						//alert("댓글수정창 띄우는 버튼누름");
						
						
						if('${sessionScope.nickname }' == $(this).parents().children('span:nth-of-type(1)').text()){
							var selEle = $(this).parent();//수정버튼의 부모요소인 div요소를 가지고옴
							
							 //수정창 토글
							 if(selEle.children('div[class="tfDiv"]').css("display") == "none"){
								 //selEle.children('div[class="tfDiv"]').css({'display':'block'}); //숨겨져 있던 수정 창 div를 띄움
								 
								 var spanInput = selEle.children('p').text();
								 //alert(spanInput);
								 selEle.children('div[class = "tfDiv"]').children('textarea').val(spanInput);
								 selEle.children('div[class="tfDiv"]').show();
							 }else{
								 selEle.children('div[class="tfDiv"]').hide();
							 }
							 
							return false;
						}else{
							
							alert("권한이 없습니다.");
							return false;
						}
					}); //댓글 수정 버튼을 눌렀을떄
					
					//수정창 안에 있는 수정버튼을 눌렀을때
					$(document).on('click', '[class = "inputModi"]', function(){
						//alert("댓글수정버튼누름");
						var topselEle = $(this).parents();//수정버튼의 가장 위의 부모요소인 div요소를 가지고옴
						var childselEle = $(this).parent();//수정버튼의 부모요소인 div요소를 가지고옴
						
						///////////////////////////////////////////////////////////
						//로그인한 회원의 닉네임과 입력된 댓글의 닉네임이 같을때 (본인의 글일때)
							//입력한 수정사항이 없는 경우
							if(childselEle.children('textarea').val() == ""){
								//수정이 되면 안된다.
								alert("수정 사항이 입력되어 있지 않습니다.");
								return false;
							}else{
								var momtalk_comm_num = topselEle.children('input[name="momtalk_comm_num"]').val();
								var content = childselEle.children('textarea').val();
								
								//alert(content);
								
								topselEle.children('div[class="tfDiv"]').css({'display':'none'});
								topselEle.children('span:nth-child(2)').css({'display':'block'});
								
								listModi(momtalk_comm_num, momtalk_post_num, content);	
							}							
											
						return false;
					}); //수정창 안에 있는 수정 버튼을 눌렀을떄
				
					//회원인 경우 댓글창 열림
				}else{
					$("div[id="+$(this).prop('id')+"]").hide();
				}//회원인 경우 댓글창 닫힘
			
			}////////////////댓글창 열고 닫고 버튼이 회원인 경우 동작하게 하는 조건문
			
			
			return false;
		});////////////////////댓글창 열고 닫는 버튼 끝
		
		
		//bxslider 적용 ---------------------------------------------------------------------
		$('.bxslider').bxSlider({
			mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
			speed : 500, // 이동 속도를 설정합니다.
			pager : true, // 현재 위치 페이징 표시 여부 설정.(false->true 하면 아래에 현재페이지 위치 보임)
			moveSlides : 1, // 슬라이드 이동시 갯수 설정.
			slideWidth : 500, // 슬라이드 마다 너비 설정. (90->500)
			minSlides : 1, // 최소 노출 개수를 설정합니다. (4->3->1)
			maxSlides : 1, // 최대 노출 개수를 설정합니다. (4->3->1)	
			slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
			auto : true, // 자동으로 흐를지 설정합니다. (false로 바꾸면 안움직임)
			autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
			controls : true,// 이전 다음 버튼 노출 여부 설정합니다.(false로바꾸면, 이전 다음이 있으면 표시가 안됨)
			captions : true //이미지 위애 텍스트 올리기 설정
		});
		
	});
		
</script>

<!-- jquery.js 경로를 잡아줌 -->
<script src="../semiview/menu/momTalk/momtalk.js"></script>

</head>



<body>
	<div class="layer" id="wrap">
		<header>
			<jsp:include page="../topmenu.jsp" />
  		 </header>
		
		
		
		<div class = "talkAll">
			<!-- ----------------------------작성하는 부분--------------------------------- -->
		<div class = "inputDiv">
			<form class = "frm" name="frm" method="post" enctype="multipart/form-data" action="write.do">
				<input type="hidden" name="nickname" id="nickname" value="${sessionScope.nickname}"/>
				<input type="hidden" name="gender" id="gender" value="${sessionScope.gender}"/>
				
				<input type="hidden" name="page" value="momstargram.do"/>
				
				<!-- 작성하려고 하는 사람의 정보를 로그인 후 저장해 둔 세션 정보에서 가지고 와 넣어둔다. -->
				<input type="hidden" id="session_id"  value="${sessionScope.id}"/>
				<input type="hidden" id="session_nickname" value = "${sessionScope.nickname }"/>
				<!------------------------------------------------------------------------------->
			
				<fieldset class="inputText">
					<legend><img id="momTalk_top" src="../semiview/images/momtalk/momstargram.png" /></legend>
					<div class = "left">
						<c:if test="${sessionScope.gender eq 'man'}"><img id="profile" src="../semiview/images/momtalk/papa.png" /></c:if>
						<c:if test="${sessionScope.gender eq 'woman'}"><img id="profile" src="../semiview/images/momtalk/mama.png" /></c:if>
						<!--  비회원일경우의 맘스타그램 게시물 작성 성별 이미지를 넣어주면 됨. -->
						<c:if test="${empty sessionScope.id}"><img id="profile" src="../semiview/images/momtalk/login_no.png" /></c:if>
					</div>
					<div class = "right">
						<!-- 리퀘스트 영역에서 로그인한 회원의 닉네임 값을 받아옴 -->
						<%-- <span><c:out /></span> --%>
						<div class = "username">
							<span>
								<c:if test="${empty sessionScope.id}">비회원</c:if>
								<c:if test="${!empty sessionScope.id}">${sessionScope.nickname}</c:if>
							</span>
						</div>
						<div class = "tfbox"><textarea rows="8" cols="75" id="tf" name="tf" placeholder="우리 아기를 자랑해주세요."></textarea></div>
						<div class = "buttonbox">
							<div class = "filebox1">
								<label for = "file1"></label>
								<input type = "file" id = "file1" name = "file1"/>
							</div>
							<div class = "filebox2">
								<label for = "file2"></label>
								<input type = "file" id = "file2" name = "file2"/>
							</div>
							<div class = "filebox3">
								<label for = "file3"></label>
								<input type = "file" id = "file3" name = "file3"/>
							</div>
							<!-- <div class = "submitbox">
								<label for = "submitBtn"></label>
								<input type = "submit" id = "submitBtn"/>
							</div> -->
							<div class = "submitbox">
							</div>
							
						</div>
					</div>
				</fieldset>
			</form>
			
		</div>
		<!-- ---------------------------작성하는 부분--------------------------------- -->
		
		<!-- -----------------------입력한 게시물이 보이는 곳----------------------------- -->
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<div id="inputContent">
				<c:forEach items = "${requestScope.aList }" var = "dto">
					<input type = "hidden" name = "momtalk_post_num" value="${dto.momtalk_post_num }" id = "commBtn${dto.momtalk_post_num}"/>
					<div class = "resultDiv" alt="반복해서 들어가야 할 부분">
						<form class = "frm2" name="frm2" >
						<!-- enctype="multipart/form-data" -->
							<input type = "hidden" name = "momtalk_post_num" value="${dto.momtalk_post_num }"/>
							<input type = "hidden" name = "nickname" value="${sessionScope.nickname}"/>
							<fieldset class="reultText">
								<!-- <legend>입력한 게시글</legend> -->
								<div class = "resultTop">
									<div class = "resultTopImg">
										<c:set value="man" var="man"/>
										<c:set value="woman" var="woman"/>
										<!-- 리퀘스트영역에서 받아온 값중 성별값에 따라 다른 이미지를 보여줌 -->
										<c:if test="${dto.gender eq woman}"><img id="resultImg" src="../semiview/images/momtalk/result_mama.png" /></c:if>
										<c:if test="${dto.gender eq man}"><img id="resultImg" src="../semiview/images/momtalk/result_papa.png" /></c:if>
									</div>
									
									<!-- 리퀘스트 영역에서 테이블에 저장된 닉네임 값과 작성시간을 받아옴 -->
									<div class = "resultTopInfo">
										<span class = "nicknameSpan">${dto.nickname}</span><br/>
										<span>${dto.write_time}</span>
									</div>
									
									<div class = "resultTopEmpty"></div>
									
									<div class = "resultTopMenu">
										<input type="image" class="menuBtn" src="../semiview/images/momtalk/garbage.png"/>
									</div>
									
								</div>
								
								<div class = "resultMain">
									
									<div class = "resultMainRight">
										<!-- 리퀘스트 영역에서 테이블에 저장된 첨부파일을 가지고 옴 -->
										<!-- 리퀘스트 영역에서 테이블에 저장된 첨부파일을 가지고 옴 -->
										<c:if test="${dto.picture1 ne null || dto.picture2 ne null || dto.picture3 ne null }">
											<div class = "resultMainFileImages">
												<div class = "FileImagesbxslider">
													<ul class="bxslider">
														<c:if test="${dto.picture1 ne null}"><li><img src="../semiview/images/momtalk/${dto.picture1}" class="fileImage1" /></li></c:if>
														<c:if test="${dto.picture2 ne null}"><li><img src="../semiview/images/momtalk/${dto.picture2}" class="fileImage2" /></li></c:if>
														<c:if test="${dto.picture3 ne null}"><li><img src="../semiview/images/momtalk/${dto.picture3}" class="fileImage3" /></li></c:if>
													</ul>	
												</div>										
											</div>
										</c:if>
										
										<!-- 댓글을 달기 위한 comm버튼(추후에 ajax로 처리) -->
										<div class = "resultMainButtonbox">
											<input type = "image" class="likeCntBtn" id="likeCntBtn${dto.momtalk_post_num}" src="../semiview/images/momtalk/likeBtn_off.png"/>
											<input type = "image" class="commBtn" id = "commBtn${dto.momtalk_post_num}" src="../semiview/images/momtalk/commentBtn_off.png"/>
										</div>
										
										<!-- 리퀘스트 영역에서 테이블에 저장된 입력내용을 가지고 옴 -->
										<div class = "resultMainTfbox">
											<span class = "resultMainLikeText" id="resultMainLikeText${dto.momtalk_post_num}">
												&nbsp;좋아요 
												<%-- ${dto.like_cnt}  --%>
												<%-- <span class = "result" id="result${dto.momtalk_post_num}">
													<script type="text/javascript">returnLikeCnt("${dto.momtalk_post_num}")</script>
												</span> --%>
												 &nbsp;개 
												</span>
											<%-- <span class = "resultMainLikeText">&nbsp;댓글 ${dto.like_cnt} 개</span> --%> <br/><br/>
											<span class = "resultMainContentText">&nbsp;&nbsp;${dto.content}</span>
											<%-- <textarea rows="8" cols="70" id="tf" name="tf">${dto.content}</textarea> --%>
										</div>
										
										
										<!-- -----------------------입력한 댓글이 보이는 곳----------------------------- -->
										<!-- ajax로 처리할 부분, comm버튼 누르면 여기에 새로운 창이 열리듯 추가 -->
										<div class = "resultMainComm" id = "commBtn${dto.momtalk_post_num}">
											<div class = "commList" id = "commList${dto.momtalk_post_num}">
												<!-- <script type="text/javascript">
													//num값의 해당하는 댓글들 가져올거야
													listView("${dto.momtalk_post_num}")
												</script> -->
											</div>
											
											<div class = "commInput">
												<!-- <form class = "commInFrm" name="commInFrm"> -->
													<div class = "commImageBox">
														<c:set value="man" var="man"/>
														<c:set value="woman" var="woman"/>
														<!-- 세션영역에서 받아온 값중 성별값에 따라 다른 이미지를 보여줌 -->
														<%-- <c:if test="">
															<img id="commImage" src="../semiview/images/momtalk/mama.png" />
														</c:if> --%>
														<%-- <c:otherwise>
															<img id="commImage" src="../semiview/images/momtalk/papa.png" />
														</c:otherwise> --%>
														<img id="commImage" src="../semiview/images/momtalk/commInputIcon.png" />
													</div>
													
													<div class = "commTextBox">
														<!-- 리퀘스트 영역에서 로그인한 회원의 닉네임 값을 받아옴 -->
														<%-- <div class = "commusername"><span><c:out /></span></div> --%>
														<div class = "commusername"><span id="commusername${dto.momtalk_post_num}">${sessionScope.nickname }</span></div>
														<%-- <div class = "commtfbox"><textarea rows="5" cols="60" id="tf" name="tf" placeholder="댓글을 달아주세요." id="commtfbox${dto.momtalk_post_num}"></textarea></div> --%>
														<div class = "commtfbox"><textarea rows="5" cols="60" name="commtf" placeholder="댓글을 달아주세요." id="commtfbox${dto.momtalk_post_num}"></textarea></div>
														<div class = "commUpload" style = "width : 40px; height:40px; float:right;">
															<img id="commImage" src="../semiview/images/momtalk/commUpload_off.png" style="width:40px; height:40px; size:40px;"/>
														</div>
													</div>
												<!-- </form> -->
												
											</div>
										</div>
										<!-- -----------------------입력한 댓글이 보이는 곳----------------------------- -->
										
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- -----------------------입력한 게시물이 보이는 곳----------------------------- -->
		</div>
		
		
	</div>

</body>
</html>