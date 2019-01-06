$(document).ready(function() {
   
   $('#female').on('mousedown', function(){
      $(this).css({'background-color':'#FFB4B9'});
   });
   $('#female').on('mouseup', function(){
	   $(this).css({'background-color':'#FF7DC8'});
   });
});



/*
function validate() {
   var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
   var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   // 이메일이 적합한지 검사할 정규식

   var id = document.getElementById("id");
   var password = document.getElementById("password");
   var password2 = document.getElementById("password");
   var email = document.getElementById("email");

   // ------------ 이메일 까지 -----------

   if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
      return false;
   }

   if (!check(re, password, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
      return false;
   }

   if (join.password.value != join.checkpassword.value) {
      alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
      join.checkpassword.value = "";
      join.checkpassword.focus();
      return false;
   }

   if (email.value == "") {
      alert("이메일을 입력해 주세요");
      email.focus();
      return false;
   }

   if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
      return false;
   }

   if (join.name.value == "") {
      alert("이름을 입력해 주세요");
      join.name.focus();
      return false;
   }

   alert("회원가입이 완료되었습니다.");
}

function check(re, what, message) {
   if (re.test(what.value)) {
      return true;
   }
   alert(message);
   what.value = "";
   what.focus();
   // return false;
}*/