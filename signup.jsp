<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<style type="text/css">

input{
	height: 40px;
}

#question, #answer {
	width: 300px;
}

#signup_input {
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
}

#commit {
	text-align: center;
}

#idcheck, #nickcheck{
	float: right;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
<h1 style="text-align: center">회원가입</h1>

	<div id="signup">
		<table id="signup_input">
			<tr>
				<td><input type="id" id="id" name="id" placeholder="아이디" /> <input
					type="button" id="idcheck" value="중복확인" /></td>
			</tr>
			<tr>
				<td><input type="password" id="pass" name="pass"
					placeholder="비밀번호" /></td>
			</tr>
			<tr>
				<td><input type="password" id="pass" name="pass"
					placeholder="비밀번호 확인" /></td>
			</tr>
			<tr>
				<td><input type="text" id="nickname" name="nickname"
					placeholder="닉네임" /> <input type="button" id="nickcheck"
					value="중복확인" /></td>
			</tr>

			<tr>
				<td><span>남성</span><span>여성</span></td>
			</tr>

			<tr>
				<td><input type="email" name="email" placeholder="이메일" /></td>
			</tr>

			<tr>
				<td><input type="text" id="question" name="question"
					placeholder="비밀번호 찾기 질문" /></td>
			</tr>
			<tr>
				<td><input type="text" id="answer" name="answer"
					placeholder="비밀번호 찾기 답" /></td>
			</tr>
		</table>
	</div>
	<div id="commit">
		<input type="button" value="회원가입" id="signBtn" />
		<input type="button" value="취소" id="cancelBtn" />
	</div>
</body>
</html>