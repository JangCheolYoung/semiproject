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
	margin-left: auto;
	margin-top: 100px;
	width: 1400px;
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
	margin: 35px auto;
	margin-bottom: 35px;
	width: 1000px;
}

.category {
	width: 1400px;
	height: 420px;
}

.category #recipeBtn {
	width: 200px;
	height: 200px;
	margin-right: 70px;
}

.category #momTalkBtn {
	width: 200px;
	height: 200px;
	margin-right: 70px;
}

.category #handOutBtn {
	width: 200px;
	height: 200px;
	margin-right: 70px;
}

.category #infoBtn {
	width: 200px;
	height: 200px;
	margin-right: 70px;
}

.category #questionBtn {
	width: 200px;
	height: 200px;
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
         $('#momTalkBtn').on('click mouseover', function(){
            $(this).attr('src', $(this).attr('src').replace("momTalk_off", "momTalk_on"));
         });
         $('#momTalkBtn').on('mouseleave', function(){
            $(this).attr('src', $(this).attr('src').replace("momTalk_on", "momTalk_off"));
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
         
         /////////////////////////////////////////////////////////////////////////////////////
         //버튼별 action 지정
         
         //로그인
         $('#loginBtn').on('click', function(){
            $('form').attr('action', 'login.do');
             $('form').submit();
         });
         //로그아웃
         $('#logoutBtn').on('click', function(){
            $('form').attr('action', 'logout.do');
             $('form').submit();
         });
         
         //레시피
         $('#recipeBtn').on('click', function(){
            $('form').attr('action', 'recipe.do');
            $('form').submit();
         });
         //맘톡
         $('#momTalkBtn').on('click', function(){
            $('form').attr('action', 'momTalk.do');
             $('form').submit();
         });
         //무료나눔
         $('#handOutBtn').on('click', function(){
            $('form').attr('action', 'handOut.do');
             $('form').submit();
         });
         //육아정보
         $('#infoBtn').on('click', function(){
            $('form').attr('action', 'info.do');
             $('form').submit();
         });
         //Q&A
         $('#questionBtn').on('click', function(){
            $('form').attr('action', 'question.do');
             $('form').submit();
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
      <form name = "frm" method = "get" action="main.do">
         <input type="image" id="loginBtn" src="../semiview/images/loginBtn_off.png" hidden=""/>
         <input type="image" id="logoutBtn" src="../semiview/images/logoutBtn_off.png" hidden=""/>
         <img alt="메인이미지" src="../semiview/images/mammaLogo.png" class="mainImage"/>
         <div class = "category">
               <input type="image" id="recipeBtn" src="../semiview/images/recipe_off.png"/>
               <input type="image" id="momTalkBtn" src="../semiview/images/momTalk_off.png"/>
               <input type="image" id="handOutBtn" src="../semiview/images/handOut_off.png"/>
               <input type="image" id="infoBtn" src="../semiview/images/info_off.png"/>
               <input type="image" id="questionBtn" src="../semiview/images/question_off.png"/>
         </div>
      </form>
   </div>
      
</body>
</html>