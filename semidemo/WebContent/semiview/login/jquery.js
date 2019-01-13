function idcheck(id) {
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'IdCheckServlet',
		data : {
			id : id
		},
		success : function(res) {
			result = res;

			if (result == 'success') {
				idChk = true;
				console.log(idChk);
				$('#idCheck').text('사용 가능한 아이디 입니다');
				$('#idCheck').css('color', 'blue');
			} else if (result == 'fail') {
				idChk = false;
				console.log(idChk);
				$('#idCheck').text('이미 사용중인 아이디입니다.');
				$('#idCheck').css('color', 'red');
			}

		}
	});

}// ajax

function nicknameCheck(nickname) {

	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'NicknameCheckServlet',
		data : {
			nickname : nickname
		},
		success : function(res) {
			result = res;

			if (result == 'success') {
				nicknameChk = true;
				console.log(nicknameChk);
				$('#nicknameCheck').text('사용 가능한 닉네임 입니다.');
				$('#nicknameCheck').css('color', 'blue');
			} else if (result == 'fail') {
				nicknameChk = false;
				console.log(nicknameChk);
				$('#nicknameCheck').text('이미 사용중인 닉네임입니다.');
				$('#nicknameCheck').css('color', 'red');
			}

		}
	});

}// ajax
