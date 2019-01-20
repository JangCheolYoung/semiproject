<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semimain</title>
<link rel="stylesheet" type="text/css" href="main/reset.css" />
<style type="text/css">
.wrap {
	margin: auto;
	width: 1000px;
}

.wrap #loginBtn {
	width: 150px;
	height: 75px;
	position: absolute;
	left: 85%;
}

.wrap #logoutBtn {
	width: 150px;
	height: 75px;
	position: absolute;
	left: 85%;
}

.wrap .mainImage {
	margin: auto;
	width: 1000px;
}

.category {
	display: block;
	width: 800px;
	height: 420px;
	text-align: center;
	margin: 0 auto;
}

.category #recipeBtn {
	width: 200px;
	height: 200px;
	margin: 10px;
}

.category #momstargramBtn {
	width: 200px;
	height: 200px;
	margin: 10px;	
}

.category #handOutBtn {
	width: 200px;
	height: 200px;
	margin: 10px;
}

.category #infoBtn {
	width: 200px;
	height: 200px;
	margin: 10px;
}

.category #questionBtn {
	width: 200px;
	height: 200px;
	margin: 10px;
}

.category #mypageBtn {
	width: 200px;
	height: 200px;
	margin: 10px;
}
</style>
   

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script type="text/javascript">
      $(document).ready(function(){
         //로그인
         $('#loginBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("loginBtn_off", "loginBtn_on"));
         });
         $('#loginBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("loginBtn_on", "loginBtn_off"));
         });
         
         //로그아웃
         $('#logoutBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("logoutBtn_off", "logoutBtn_on"));
         });
         $('#logoutBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("logoutBtn_on", "logoutBtn_off"));
         });
         
         //레시피
         $('#recipeBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("recipe_off", "recipe_on"));
         });
         $('#recipeBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("recipe_on", "recipe_off"));
         });
         
         //맘톡
         $('#momstargramBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("momstargram_off", "momstargram_on"));
         });
         $('#momstargramBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("momstargram_on", "momstargram_off"));
         });
         
         //무료나눔
         $('#handOutBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("handOut_off", "handOut_on"));
         });
         $('#handOutBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("handOut_on", "handOut_off"));
         });
         
         //육아정보
         $('#infoBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("info_off", "info_on"));
         });
         $('#infoBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("info_on", "info_off"));
         });
         
         //Q&A
         $('#questionBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("question_off", "question_on"));
         });
         $('#questionBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("question_on", "question_off"));
         });
         
         //마이페이지
         $('#mypageBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("mypage_off", "mypage_on"));
         });
         $('#mypageBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("mypage_on", "mypage_off"));
         });
         
         /////////////////////////////////////////////////////////////////////////////////////
         //버튼별 action 지정
         
         //로그인
         $('#loginBtn').on('click', function(){
            $('#frm').attr('action', 'login.do');
             $('#frm').submit();
         });
         //로그아웃
         $('#logoutBtn').on('click', function(){
            $('#frm').attr('action', 'logout.do');
             $('#frm').submit();
         });
         
         //레시피
         $('#recipeBtn').on('click', function(){
            $('#frm').attr('action', 'recipe.do');
            $('#frm').submit();
         });
         //맘톡
         $('#momstargramBtn').on('click', function(){
            $('#frm').attr('action', 'momstargram.do');
             $('#frm').submit();
         });
         //무료나눔
         $('#handOutBtn').on('click', function(){
            $('#frm').attr('action', 'handOut.do');
             $('#frm').submit();
         });
         //육아정보
         $('#infoBtn').on('click', function(){
            $('#frm').attr('action', 'info.do');
             $('#frm').submit();
         });
         //Q&A
         $('#questionBtn').on('click', function(){
            $('#frm').attr('action', 'question.do');
             $('#frm').submit();
         });
       //MyPage
         $('#mypageBtn').on('click', function(){
        	 if('${sessionScope.id}' != ''){
	            $('#frm').attr('action', 'myPage.do');
	             $('#frm').submit();
        	 }else{
        		 alert("로그인 후 이용가능한 서비스 입니다.");
          	   	$('#frm').attr('action', 'login.do');
                 $('#frm').submit();
        	 }
        	 
         });
         
         ////////////////////////////////////////////////////////////////////
         <%
         String id = (String) session.getAttribute("id");
         boolean login = id == null ? false : true;
         %>
         
         <%
            if (login) {
         %>
               $('#loginBtn').prop('hidden',true);
               $('#logoutBtn').prop('hidden',false);
         <%
            }else{
         %>
               $('#loginBtn').prop('hidden',false);
               $('#logoutBtn').prop('hidden',true);
         <%
            }
         %>
      });
   </script>

</head>
<body>

   <div class = "wrap">
      <form id="frm" name = "frm" method = "get" action="main.do">
         <input type="image" id="loginBtn" src="../semiview/images/loginBtn_off.png" hidden=""/>
         <input type="image" id="logoutBtn" src="../semiview/images/logoutBtn_off.png" hidden=""/>
         <img alt="메인이미지" src="../semiview/images/mammaLogo.png" class="mainImage"/>
         <div class = "category">
         		<input type="image" id="infoBtn" src="../semiview/images/info_off.png"/>
               <input type="image" id="recipeBtn" src="../semiview/images/recipe_off.png"/>
               <input type="image" id="momstargramBtn" src="../semiview/images/momstargram_off.png"/>
               <input type="image" id="handOutBtn" src="../semiview/images/handOut_off.png"/>
               <input type="image" id="questionBtn" src="../semiview/images/question_off.png"/>
               <input type="image" id="mypageBtn" src="../semiview/images/mypage_off.png"/>
         </div>
      </form>
   </div>
      
</body>
</html>