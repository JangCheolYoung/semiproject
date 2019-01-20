<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{
   width: 1001px;
   /* height: 1000px; */
   margin : auto;
   margin-top: 2%;
   /* background-color: yellow; */
}

.wrap #topbannerDiv{
   width: 90%;
   height: 200px;
   margin : auto;
   /* background-color: red; */
}

.wrap #topbannerDiv img{
   width: 100%;
   height: 100%;
}

.wrap #loginBigDiv{
   width: 100%;
   height: 50px;
}

.wrap #loginDiv{
   width: 7%;
   height: 50px;
   float: right;
   margin: auto;
}
.wrap #login{
   width: 100%;
   height: 100%;
   padding-top: 3px;
}

.wrap #logout{
   width: 100%;
   height: 100%;
   padding-top: 3px;
}

.wrap #humanImg{
   width: auto;
   height: 40px;
   float: right;
   margin: auto;
   padding-top: 3px;
}

.wrap #humanImage{
   width: 40px;
   height: 100%;
   padding-top: 3px;
}
.wrap #humanNick{
   width: auto;
   height: 100%;
   float: right;
   padding-top: 12px;
   text-align: center;
}


.wrap #topMenuBox{
   width: 100%;
   height: 100px;
   margin : auto;
   /* background-color: green; */
   border-top: 3px solid #ccc;
   border-bottom: 3px solid #ccc;
}

.wrap #topMenuBox #homeBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: aqua; */
}

.wrap #topMenuBox #homeBox #home{
   width: 50%;
   height: 70%;
   padding-left : 35%;
   padding-top : 8%;
}

.wrap #topMenuBox #infoBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #infoBox #info{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}

.wrap #topMenuBox #recipeBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #recipeBox #recipe{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}

.wrap #topMenuBox #momstarBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #momstarBox #momstargram{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}

.wrap #topMenuBox #handoutBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #handoutBox #handout{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}

.wrap #topMenuBox #qnaBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #qnaBox #qna{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}

.wrap #topMenuBox #mypageBox{
   width: 143px;
   height: 80%;
   margin : auto;
   padding-top:1%;
   float : left;
   /* background-color: pink; */
}

.wrap #topMenuBox #mypageBox #mypage{
   width: 70%;
   height: 70%;
   padding-left : 17%;
   padding-top : 8%;
}



</style>
<!-- bxslider를 사용하기 위한 추가(1) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- bxslider를 사용하기 위한 추가(2) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<script src="../semiview/menu/information/js/jquery-ui.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $('#home').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      
    //로그인
      $('#login').on('click mouseover', function(){
         $(this).attr('src', $(this).attr('src').replace("login_text_off", "login_text_on"));
      });
      $('#login').on('mouseleave', function(){
         $(this).attr('src', $(this).attr('src').replace("login_text_on", "login_text_off"));
      });
      
      //로그아웃
      $('#logout').on('click mouseover', function(){
         $(this).attr('src', $(this).attr('src').replace("logout_text_off", "logout_text_on"));
      });
      $('#logout').on('mouseleave', function(){
         $(this).attr('src', $(this).attr('src').replace("logout_text_on", "logout_text_off"));
      });
      
      $('#info').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      $('#recipe').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            
            $('#recipeSubBox').css({"display" : "block"});
            
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            $('#recipeSubBox').css({"display" : "none"});
            });
      $('#momstargram').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      $('#handout').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      $('#qna').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      $('#mypage').hover(
            function() {
            $(this).attr("src",$(this).attr("src").replace("off.png","on.png"));
            $(this).parent().css({"border-bottom" : "2px solid #ed9a9a"});
            },
            function() {
            $(this).attr("src",$(this).attr("src").replace("on.png","off.png"));
            $(this).parent().css({"border-bottom" : "none"});
            });
      
      /*-------------------------------------------------------------------------------*/
      //페이지 이동
      $('#home').on('click', function(){
         $('#frmTop').attr('action', '*');
          $('#frmTop').submit();
      });
      $('#info').on('click', function(){
         $('#frmTop').attr('action', 'info.do');
          $('#frmTop').submit();
      });
      $('#recipe').on('click', function(){
         $('#frmTop').attr('action', 'recipe.do');
          $('#frmTop').submit();
      });
      $('#momstargram').on('click', function(){
         $('#frmTop').attr('action', 'momstargram.do');
          $('#frmTop').submit();
      });
      $('#handout').on('click', function(){
         $('#frmTop').attr('action', 'handOut.do');
          $('#frmTop').submit();
      });
      $('#qna').on('click', function(){
         $('#frmTop').attr('action', 'question.do');
          $('#frmTop').submit();
      });
      $('#login').on('click', function(){
        $('#frmTop').attr('action', 'login.do');
          $('#frmTop').submit();
      });
      $('#logout').on('click', function(){
    	 
        $('#frmTop').attr('action', 'logout.do');
          $('#frmTop').submit();
      });
      $('#mypage').on('click', function(){
       if($('#session_id').val() != ''){
           $('#frmTop').attr('action', 'myPage.do');//main컨트롤러에 추가해주어야 함
           $('#frmTop').submit();
       }else{
    	   alert("로그인 후 이용가능한 서비스 입니다.");
    	   $('#frmTop').attr('action', 'login.do');
           $('#frmTop').submit();
       }
         
      });
      ///////////////////////////////////////////////////////////////////
      <%
      String id = (String) session.getAttribute("id");
      boolean login = id == null ? false : true;
      %>
      <%
         if (login) {
      %>
            $('#login').prop('hidden',true);
            $('#logout').prop('hidden',false);
      <%
         }else{
      %>
            $('#login').prop('hidden',false);
            $('#logout').prop('hidden',true);
      <%
         }
      %>
      
      ////////////////////////////////////////////////////////////////////
      <%
         String nickname = (String) session.getAttribute("nickname");
         boolean nickname2= nickname == null ? false : true;
      %>
      <%
         if (nickname2) {
       %>
            $('#humanNick').prop('hidden',false);
       <%
         }else{
       %>
            $('#humanNick').prop('hidden',true);
       <%
           }
       %>
   });
</script>

</head>
<body>
   <input type="hidden" id="session_id" value="${sessionScope.id}"/>
   <input type="hidden" id="session_nickname" value="${sessionScope.nickname}"/>
   <!-- 전체를 감싸고 있는 div -->
   <div class = "wrap">
      <!-- 메인 베너 -->
      <div id="topbannerDiv">
         <img id="momsRecipe" src="../semiview/images/topmenu/mammaLogo.png"/>
      </div>
      <div id="loginBigDiv">
         <div id="loginDiv">
            <input type = "image" id="login" name="login" alt="로그인" src="../semiview/images/topmenu/login_text_off.png" hidden=""/>
            <input type = "image" id="logout" name="logout" alt="로그아웃" src="../semiview/images/topmenu/logout_text_off.png" hidden=""/>
         </div>
         <div id="humanImg">
            <img id="humanImage" src="../semiview/images/topmenu/humanImage.png"/>
            <div id="humanNick" hidden=""> ${sessionScope.nickname} |</div>
         </div>
      </div>
      <!-- 페이지 이동 메뉴바(버튼 형식) -->
      <form name = "frm" id = "frmTop">
   		<input type="hidden" name="page" value="myPage.do"/>
         <div id = "topMenuBox">
            <div id = "homeBox">
               <input type = "image" id = "home" name = "home" alt="홈" src="../semiview/images/topmenu/topmenuHome_off.png"/>
            </div>
            <div id = "infoBox">
               <input type = "image" id = "info" name = "info" alt="육아정보" src="../semiview/images/topmenu/topmenuInfo_off.png"/>
            </div>
            <div id = "recipeBox">
               <input type = "image" id = "recipe" name = "recipe" alt="레시피" src="../semiview/images/topmenu/topmenuRecipe_off.png"/>
            </div>   
            <div id = "momstarBox">
               <input type = "image" id = "momstargram" name = "momstargram" alt="맘스타그램" src="../semiview/images/topmenu/topmenuMomstar_off.png"/>
            </div>
            <div id = "handoutBox">
               <input type = "image" id = "handout" name = "handout" alt="무료나눔" src="../semiview/images/topmenu/topmenuHandout_off.png"/>
            </div>
            <div id = "qnaBox">
               <input type = "image" id = "qna" name = "qna" alt="문의사항(Q&A)" src="../semiview/images/topmenu/topmenuQna_off.png"/>
            </div>
            <div id = "mypageBox">
               <input type = "image" id = "mypage" name = "mypage" alt="마이페이지" src="../semiview/images/topmenu/topmenuMypage_off.png"/>
            </div>
         </div>
         
         
      </form>
            
   </div>

   

</body>
</html>