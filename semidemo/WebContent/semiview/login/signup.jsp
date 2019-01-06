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


<script type="text/javascript" src="../semiview/login/jquery.js"></script>

</head>
<body>
	<img id="top_bar" alt="" src="../semiview/images/top_bar.jpg">
	<div class="go_main"><a href="*"><img id="logo" alt="home" src="../semiview/images/logo.png"></a></div>
	<h1 style="text-align: center">
		<img id="sign_img" src="../semiview/images/top_banner.png" />
	</h1>
	<div id="signUp">
		<form name="frm" id="frm" method="get" action="">
			<div>
				<input type="id" id="id" name="id" placeholder="아이디" />
			</div>
			<div></div>
			<div>
				<input type="password" id="password" name="password"
					placeholder="비밀번호" />
			</div>
			<div></div>
			<div>
				<input type="password" id="password2" name="password2"
					placeholder="비밀번호 확인" />
			</div>
			<div></div>
			<div>
				<input type="text" id="nickname" name="nickname" placeholder="닉네임" />
			</div>
			<div></div>
			<div>
				<input type="text" name="email" id="email" placeholder="이메일" />
			</div>
			<div></div>
			<div id="gender">
				<input type="button" id="male" name="gender" value="남성" /> <input
					type="button" id="female" name="gender" value="여성" />
			</div>
			<div></div>
			<div>
				<input type="text" id="pass_ques" name="pass_ques"
					placeholder="비밀번호 찾기 질문" />
			</div>
			<div></div>
			<div>
				<input type="text" id="pass_answ" name="pass_answ"
					placeholder="비밀번호 찾기 답" />
			</div>
			<div></div>
			<div>

				<input type="submit" value="회원가입" id="signBtn" />
			</div>
		</form>

	</div>
</body>
</html>