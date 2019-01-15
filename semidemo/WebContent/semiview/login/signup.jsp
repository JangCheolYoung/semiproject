   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<link rel="stylesheet" type="text/css" href="../semiview/login/css/signup.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" src="../semiview/login/DupliAndValid.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#male').on('click',function(){
		$(this).css({'backgroundColor':'gray'});
		$('#female').css({'backgroundColor':'white'});
		$('#gender').val($(this).val());
	});
	
	$('#female').on('click',function(){
		$(this).css({'backgroundColor':'gray'});
		$('#male').css({'backgroundColor':'white'});
		$('#gender').val($(this).val());
	});
	
});
</script>

</head>
<body>
   <img id="top_bar" alt="" src="../semiview/images/top_bar.jpg" />
   <div class="go_main">
      <a href="*">
         <img id="logo" alt="home" src="../semiview/images/logo.png" />
      </a>
   </div>
   <h1 style="padding-top: 20px; text-align: center;">
      <img id="sign_img" src="../semiview/images/top_banner.png" />
   </h1>
   <div id="signUp">
      <form name="frm" id="frm" method="post" >
         <div class="form-group">
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디" maxlength="20"/>
            <div id="idCheck"></div>
         </div>
         <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" />
         </div>
         <div id="passwordCheck"> </div>
         <div class="form-group">
            <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" />
         </div>
         <div id="password2Check"> </div>
         <div class="form-group">
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" />
         </div>
         <div id="nicknameCheck"> </div>
         <div class="form-group">
            <input type="text" name="email" id="email" placeholder="이메일" style="width:200px;"/>@
            <input type="text" name="email2" id="email2" placeholder="이메일주소" style="width:167px;"/>
         </div>
         <div id="emailCheck"> </div> 
         <div id="email2Check"> </div>
         <div class="form-control" class="genderclass" style="height:40px;">
         	   <label class="btn btn-primary">
               		<input type="button" id="male" name="gender" value="남자" checked/>
               </label>
               <label class="btn btn-primary">
                  <input type="button" id="female" name="gender" value="여자" />
                </label>
               		<input type="hidden" id="gender" name="gender" value=""/>
         </div>
         <div class="form-control" >
            <SELECT name="pass_ques" id="selectPassword" style="width:390px; border-radius:10px; height:30px;">
               <OPTION value="1">첫째 아이의 태명은 무엇입니까?</OPTION>
               <OPTION value="2">아이의 이름은 무엇입니까?</OPTION>
               <OPTION value="3">아이가 가장 좋아하는 음식은 무엇입니까?</OPTION>
            </SELECT>
         </div>
         <div id="pass_quesCheck"> </div>
         <div class="form-control">
            <input type="text" id="pass_answ" name="pass_answ" placeholder="비밀번호 찾기 답" />
         </div>
         <div id="pass_answCheck"> </div>
         <div>
            <input type="button" class="btn btn-primary from-control" id="signBtn" value="회원가입"/>
         </div>
      </form>

   </div>
</body>
</html>
