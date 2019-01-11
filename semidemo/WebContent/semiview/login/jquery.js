$(document).ready(function() {

	$('#female').on('mousedown', function() {
		$(this).css({
			'background-color' : '#FF73EE'
		});
	});
	$('#female').on('mouseup', function() {
		$(this).css({
			'background-color' : '#FF73EE'
		});
	});

	$('#male').on('mousedown', function() {
		$(this).css({
			'background-color' : '#368AFF'
		});
	});
	$('#male').on('mouseup', function() {
		$(this).css({	
			'background-color' : '#368AFF'
		});
	});

	alert("jquery.js 실행확인");

//로그인 버튼을 클릭했을때
$('#loginBtn').click(function(){
	//아이디값을 가지고 옴
	var id = document.getElementById("id");
	
	// ^ : 시작, $ : 끝을 의미
	// ^[a-zA-Z$_]{1} : 영문자, $,_로 시작
	// [a-zA-Z0-9!@#$%^&*_]{4,7} : 첫시작 문제 제외하고 총 4~7개의 모든문자 가능
	// /^뒤에 바로 오는 조건을 묻는 ()는 시작으로 인식하지 않음
	// (?=.*[a-zA-Z]) : 영문자를 반드시 포함하는지, (?=.*[0-9]) : 숫자를 반드시 포함하는지, (?=.*[!@#$%^&_*]) : 특수문자를 반드시 포함하는지
	var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&_*])[a-zA-Z$_]{1}[a-zA-Z0-9!@#$%^&*_]{4,7}$/;
	//alert(pattern.test(nid)); //test()함수는 조건에 맞는것이 있으면 true, 아니면 false를 리턴
	
	//결과값이 false이면 not(!)을 넣어서 true로 만들어 실행이 되도록 함, 즉 아이디의 조건에 맞지 않으면 실행하여라
	if(!(pattern.test(id))){
		alert('아이디를 확인하세요.');
		return false; //이동 안하도록
	}
	
	-----------------------------------------------------------------------------------
	//비밀번호 값 가지고 옴
	//var password = document.getElementById("password"); 
	
	// [a-zA-Z0-9!@#$%^&*_]{7,10} : 영문자,숫자,특수문자 총 7-10
	// (?=.*[0-9]) : 숫자를 반드시 포함하는지, (?=.*[!@#$%^&_*]) : 특수문자를 반드시 포함하는지
	//var pattern2 = "/^(?=.*[0-9])(?=.*[!@#$%^&_*])[a-zA-Z0-9!@#$%^&*_]{7,10}$/";
	//if(!(pattern2.test(password))){
	//	alert('비밀번호를 확인하세요.');
	//	return false; //이동 안하도록
	//}
	
	
	-----------------------------------------------------------------------------------
	//이동할 페이지 지정
	//form에 action 설정 안되어 있음
	//form안에서 input 타입이 image면 submit 이벤트 등록되어 있음 -> action만 설정해 주면 됨
	$('form').prop('action', 'login.jsp');

});

});
//회원가입 유효성검사
function validate() { 
	var re = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/; // 아이디가 적합한지 검사할 정규식 -영문자로시작, 영문자와 숫자와 _만 가능, 총 5~12글자사이
	var re2 = /^[a-zA-Z]{1}[a-zA-Z0-9!@#$%^&*_]{7,11}$/; // 패스워드가 적합한지 검사할 정규식 -영문자로시작, 그 뒤는 모든 문자가능, 총 8~12글자 사이
	var re3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	var re4 = /^[a-zA-Z]{4,12}$/; //닉네임이 적합한지 검사할 정규식 - 영문자 4~12자리로 구성
	var re5 = /^[a-zA-Zㄱ-ㅎ가-힣.?]{2, 50}$/; //비밀번호 찾기가 적합한지 검사할 정규식 - 영문자,한글, ., ? 가능, 2~50글자 사이
	
	var id = document.getElementById.val();
	var password = document.getElementById.val(); 
	var password2 = document.getElementById.val();
	var email = document.getElementById.val();
	var nickname = document.getElementById.val();
	var findPass_ques = document.getElementById.val();
	var findPass_answ = document.getElementById.val();

	if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) { 
		return false; 
	}
	
	if (!check(re2, password, "패스워드는 8~12자의 영문 대소문자와 숫자로만 입력")) { 
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
	
	if (!check(re3, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}
	
	if (join.nickname.value == "") {
		alert("닉네임을 입력해 주세요");
		join.nickname.focus();
		return false;
	}
	if (!check(re4, nickname, "적합하지 않은 닉네임입니다.")) {
		return false;
	}
	
	if (findPass_ques.value == "") {
		alert("비밀번호 찾기 문항을 입력해 주세요");
		findPass_ques.focus();
		return false;
	}
	
	if (!check(re5, findPass_ques, "적합하지 않은 비밀번호 찾기 형식입니다.")) {
		return false;
	}
	alert("회원가입이 완료되었습니다."); 
	
}//end function validate()/////////////////////
	





























