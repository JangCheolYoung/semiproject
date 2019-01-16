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


#content #inputContent .qnaNicknameBox{
	width: 100%;
	height: 61px;
	margin-top: 20px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qnaNicknameBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* font-weight: bold; */
	/* background-color: yellow; */
}

#content #inputContent .qnaReadcountBox{
	width: 100%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qnaReadcountBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .qnaCategoryBox{
	width: 100%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qnaCategoryBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .qnaTitleBox{
	width: 100%;
	height: 61px;
	margin-top: 10px;
	/* background-color: aqua; */
	border-bottom: 1px solid #ccc; 
}

#content #inputContent .qnaTitleBox span{
	width: 100%;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}



#content #inputContent .qnaContentBox{
	width: 100%;
	/* height: 512px; */
	/* background-color: pink;*/	
	border-bottom: 3px solid #ccc; 
}

#content #inputContent .qnaContentBox span{
	width: 200px;
	height: 61px;
	margin-top: 10px;
	display: table-cell;
	vertical-align: center;
	line-height: 61px;
	/* background-color: yellow; */
}

#content #inputContent .qnaContentBox .qnaImagefile{
	width: 95%;
	height: 500px;
	margin-top: 5px;
	/* background-color: pink; */
}

#content #inputContent .qnaContentBox .qnaImagefile img{
	width: 60%;
	height : 100%;
	padding-left : 10%;
	/*height: 100%;*/
	/* size : 100%; */
}

#content #inputContent .qnaContentBox .qnaContent{
	width: 95%;
	/* height: 200px; */
	margin-top: 20px;
	margin-bottom: 20px;
	/* border : 2px dashed #ccc; */
	border-radius: 5px;
}

#content #inputContent .buttonBox{
	width: 100%;
	height: 50px;
	/* background-color: orange; */
	margin-top : 20px;
	margin-bottom: 20px;
}


#content #inputContent .buttonBox #qnaListBtn{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-left : 75%;
	padding-right: 10px;
	float: left;
}

#content #inputContent .buttonBox #answerBtn{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-right: 10px;
	float: left;
}

#content #inputContent .buttonBox #updateBtn{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-right: 10px;
	float: left;
}

#content #inputContent .buttonBox #deleteBtn{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding-right: 5px;
	float: left;
}



/*----영철스 놉 혜린스 타임------------------------------------------------------------*/
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('#loginBtn').hover(
         function() {
         $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));},
         function() {
         $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));});
      
      
      $('#qnaListBtn').on('click', function(){
         $('form').attr('action', 'question.do'); 
          $('form').submit();
      });
      
      
      // 답글 이미지 눌렀을 때 발생하는 이벤트//////////////////////////////////////////
      $('#answerBtn').on('click', function(){
    	  
    	  // 관리자 아이디로 로그인 했을때만 답변을 등록할 수 있다.
    	  if('${sessionScope.id}' == 'hr'){
    		  
	         $('form').attr('action', 'qnaWriteForm.do');
	         $('form').submit();
    	  }
    	  else{
    		  alert("권한이 없습니다.");
    		  return false;
    	  }
    	  
      });//////////////////////////////////////////////////////////////////////
      
      
      // 수정 이미지를 눌렀을 때 발생하는 이벤트/////////////////////////////////////////////////////
      $('#updateBtn').on('click', function(){
    	  
    	 
    	 var nickname = $('#nickname').val();
    	 //alert("nickname = "+nickname);
    	 
    	 if('${sessionScope.nickname}'==nickname || '${sessionScope.id}'== 'hr'){
	       	 $('form').attr('action', 'qnaUpdateForm.do'); 
	         $('form').submit();
    	 }
    	 else{
    		 
    		 alert('권한이 없습니다.');
    		 return false;
    	 }
                  
      });//////////////////////////////////////////////////////////////////////////////
      
      $('#deleteBtn').on('click', function(){
    	 var nickname = $('#nickname').val();
     	 //alert("nickname = "+nickname);
     	 
     	 if('${sessionScope.nickname}'==nickname || '${sessionScope.id}'== 'hr'){
     		 alert('삭제한다!');
	         $('form').attr('action', 'qnaDelete.do'); 
 	         $('form').submit();
     	 }
     	 else{
     		 alert('권한이 없습니다.');
     		 return false;
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
      
      
      <!------------------------------ 상세페이지 보기 ---------------------------->
      <div id="content"
         alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
         
      	<div id="inputContent">
         
        <div class="qna_logoBox">
			<img alt="Q&A 글쓰기 로고입니다." src="../semiview/images/qna/qnaView_logo.png" id=logo>
		</div>
         
		<div class = "qnaNicknameBox">
			<span>글쓴이 : ${dto.nickname}</span>
		</div>
		<div class = "qnaReadcountBox">
			<span>조회수 : ${dto.readcount}</span>
		</div>
		<div class = "qnaCategoryBox">
			<span>분류 : ${dto.qna_category}</span>
		</div>
		<div class = "qnaTitleBox">
			<span>제목 : ${dto.title}</span>
		</div>
		<div class = "qnaContentBox">
			<span>내용</span>
			<div class = "qnaImagefile">
				<%-- <img src="../semiview/images/qna/${dto.image}"/> --%>
				<!-- <img src="../semiview/images/닝닝이들세로사진.jpg"/> -->
				<!-- <img src="../semiview/images/아보카도정사각형사진.jpg"/> -->
				<img src="../semiview/images/캡처가로긴이미지.PNG"/> 
			</div>
			<div class = "qnaContent">
				${dto.content}
			</div>
		</div>
         
         
         <%-- 글쓴이 : ${dto.nickname}<br/>
         조회수 : ${dto.readcount}<br/>
         분류 : ${dto.qna_category}<br/>
         제목 : ${dto.title}<br/>
         내용 : ${dto.content}<br/>
         첨부파일 : <img src="../semiview/images/qna/${dto.image}"/>  --%>
         
         
         <form name="frm" method="post">
            <input type="hidden" name="qna_num" value="${dto.qna_num}" />
            <input type="hidden" name="nickname" id="nickname" value="${dto.nickname}" />
            <input type="hidden" name="ref" value="${dto.ref}" /> 
            <input type="hidden" name="re_step" value="${dto.re_step}" />
            <input type="hidden" name="re_level" value="${dto.re_level}" />
            <input type="hidden" name="pageNum" value="${param.pageNum}" /> 
            <input type="hidden" name="qna_category" value="${dto.qna_category}" /> 
            <input type="hidden" name="content" value="${dto.content}"/>
         
         	<div class = "buttonBox">
         		<input type="image" id="qnaListBtn" name="qnaListBtn" value="목록으로" src = "../semiview/images/qna/qna_list.png"/>
            	<input type="image" id="answerBtn" name="answerBtn" value="답변" src = "../semiview/images/qna/qna_answer.png"/><!-- 관리자권한 -->
            	<input type="image" id="updateBtn" name="updateBtn" value="수정" src = "../semiview/images/qna/qna_modify.png"/></a><!-- 작성자권한/ 관리자권한 -->
            	<input type="image" id="deleteBtn" name="deleteBtn" value="삭제" src = "../semiview/images/qna/qna_delete.png"/><!-- 작성자권한/ 관리자권한. -->
         	</div>
            
         </form>
         
         </div>
         
      </div>
      
   </div>
   
   <a href = "login.do"><img id="loginBtn" src="../semiview/images/loginBtn_off.png"/></a>

</body>
</html>