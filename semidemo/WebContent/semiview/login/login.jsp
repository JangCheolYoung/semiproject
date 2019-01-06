<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style>
form, button {
	border: 0;
	margin: 0;
	padding: 0;
}

p, h1 {
	text-align: center;
}

#top_bar {
	position: absolute;
	width: 100%;
	height: 80px;
	margin: auto;
	width: 100%;
}

#logo {
	position: relative;
	height: 80px;
	text-align: center;
}

.go_main {
	text-align: center;
}

.spacer {
	clear: both;
	height: 1px;
}

.myform {
	margin-left: auto;
	margin-right: auto;
	width: 400px;
	padding: 14px;
}

#stylized {
	border-top: solid 20px #FA5882;
	border-bottom: solid 20px #FA5882;
	background: #ebf4fb;
}

#stylized h1 {
	font-weight: bold;
	margin-bottom: 8px;
	font-family: nanumgothic, dotum;
}

#loginimg {
	width: 200px;
	height: 150px;
}

#stylized label {
	display: block;
	font-weight: bold;
	text-align: right;
	width: 140px;
	float: left;
	font-family: tahoma;
}

#stylized .small {
	color: #666666;
	display: block;
	font-size: 11px;
	font-weight: normal;
	text-align: right;
	width: 140px;
	font-family: dotum;
	letter-spacing: -1px;
}

#stylized input {
	float: left;
	font-size: 12px;
	padding: 4px 2px;
	border: solid 1px #aacfe4;
	width: 200px;
	margin: 2px 0 20px 10px;
}

#stylized button {
	clear: both;
	margin-left: 150px;
	width: 125px;
	height: 31px;
	text-align: center;
	line-height: 31px;
	font-size: 11px;
	font-weight: bold;
	font-family: tahoma;
}

#stylized #idrem {
	width: 15px;
	margin: 1px;
}

.idsave {
	margin-top: 5px;
	margin-left: 150px;
	font-size: 13px;
}

.spacer {
	height: 10px;
	text-decoration: none;
	display: block;
}

.spacer .spacer_left {
	float: left;
}

.spacer .spacer_right {
	float: right;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<img id="top_bar" alt="" src="../semiview/images/top_bar.jpg">
	<div class="go_main">
		<a href="*"><img id="logo" alt="home"
			src="../semiview/images/logo.png"></a>
	</div>
	<div id="stylized" class="myform">
		<form id="form" name="form" method="post">
			<h1>
				<img id="loginimg" alt="" src="../semiview/images/login.png">
			</h1>
			<p>아이디와 비밀번호를 입력하세요</p>

			<label>ID <span class="small">이름 입력</span>
			</label> <input type="text" name="name" id="name" /> <label>Password
				<span class="small">패스워드 입력</span>
			</label> <input type="text" name="password" id="password" />
			<button type="submit">로그인</button>
			<br />
			<div class="idsave">
				아이디저장<input type="checkbox" id="idrem" name="idrem" value="idsave">
				<br />



			</div>
			<div></div>
			<div class="spacer">
				<div class="spacer_left">
					<a href="signup.do" class="link1">회원가입</a>
				</div>
				<div class="spacer_right">
					<a href="find.do" class="link2">아이디/비밀번호찾기</a>
				</div>
			</div>

		</form>
	</div>

</body>
</html>