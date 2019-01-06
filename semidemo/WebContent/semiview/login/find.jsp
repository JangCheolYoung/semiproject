<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

<style type="text/css">
#top_bar {
	position: absolute;
	width: 100%;
	height: 80px;
	margin: auto;
}

#logo {
	position: relative;
	height: 80px; display : block;
	margin: auto;
	display: block;
}

body {
	width: 100%;
	height: 100%;
	background-color: #fff;
	overflow-x: hidden;
	overflow-y: auto;
	"
}

#find_img {
	margin-top: 50px; 
	width : 350px;
}

table {
	height: 250px;
	margin: 0px auto;
}

tr {
	height: 50px;
}

td {
	text-align: right;
}

input[type="text"] {
	width: 180px;
}

select {
	width: 186px;
	height: 24px;
}

p {
	text-align: left;
	margin-top: 50px;
	margin-bottom: -40px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
	<img id="top_bar" alt="" src="../semiview/images/top_bar.jpg">
	<a href="*"><img id="logo" alt="home" src="../semiview/images/logo.png"></a>
	<center>
		<img id="find_img" alt="" src="../semiview/images/find_img.png" />
		<div style="width: 500px; margin-top: 10px;">

			<div>
				<span id="tab_btn1" onclick="tabSwitch(1)" style="cursor: pointer"><img
					src="../semiview/images/id1.png"></span>&nbsp;&nbsp;&nbsp;&nbsp; <span
					id="tab_btn2" onclick="tabSwitch(2)" style="cursor: pointer"><img
					src="../semiview/images/pass1.png"></span>
			</div>

			<div id="tab_disp1"
				style="border: 1px solid #e7e7e7; width: 100%; height: 250px;">
				<form>
					<table>
						<tr>
							<td><label for="find_email"><p>이메일</p></label></td>
						</tr>
						<tr>
							<td><input type="text" id="find_email"><span>
									@</span> <input type="text" list="email"> <datalist id="email">
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="gmail.com">지메일</option>
								</datalist></td>
						</tr>
						<tr>
							<td colspan="2"><input type="image" src="../semiview/images/ok1.png"
								alt="확인" /></td>
						</tr>
					</table>
				</form>
			</div>

			<div id="tab_disp2"
				style="border: 1px solid #e7e7e7; width: 100%; height: 250px;">
				<form>
					<table>
						<tr>
							<td><label for="find_id">아이디 </label></td>
							<td><input type="text" id="find_id"></td>
						</tr>
						<tr>
							<td>비밀번호 질문</td>
							<td><select>
									<option>기억에 남는 선생님 성함?</option>
									<option>제일 감명깊게 읽은 책은?</option>
									<option>어렸을 때 별명은?</option>
							</select></td>
						</tr>
						<tr>
							<td><label for="find_a">답 </label></td>
							<td><input type="text" id="find_a"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="image" src="../semiview/images/ok1.png"
								alt="확인"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<script src="../semiview/login/tab.js" type="text/javascript"></script>
	</center>
</body>
</html>
