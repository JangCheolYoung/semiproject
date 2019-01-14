<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="../semiview/login/css/login.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var id = getCookie("id");
	    $("input[name='id']").val(id); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var id = $("input[name='id']").val();
	            setCookie("id", id, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("id");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var id = $("input[name='id']").val();
	            setCookie("id", id, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
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
		<img id="login_img" src="../semiview/images/login.png" />
	</h1>
	<div id="login">
		<form action="loginPro.do" name="form" id="form" method="post" style="width:550px;">
			<div class="form-group">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디" maxlength="20" style="width:295px;"/>
				<input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="idSaveCheck" checked=""
				style="position:relative; top:15px;" />아이디저장
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" style="width:400px;"/>
			</div>
			
			<button type="submit" id="loginBtn" style="border-radius:5px; height:35px; font-size:20px;">로그인</button>
			<div></div>
			<div class="spacer">
				<div class="spacer_left"
				style="width: 170px; background-color:#FFcccc; margin: 5px; padding:8px; 
				border-radius: 5px; position:relative; left:68px; float:left;">
					<a href="signup.do" class="link1" style="text-decoration: none; color: white; font-size:18px">회원가입</a>
				</div>
				<div class="spacer_right"
				style="width: 193px; background-color:#FFcccc; margin: 5px; padding:8px; 
				border-radius: 5px; position:relative; left:68px; float:left;">
					<a href="find.do" class="link2" style="text-decoration: none; color: white; font-size:18px">아이디/비밀번호찾기</a>
				</div>
			</div>

		</form>
	</div>
		
</body>
</html>