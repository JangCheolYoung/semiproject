$(document).ready(function() {
	var password;

	$('#findPasswordBtn').on('click', function() {
		var find_id = $('#find_id').val();
		var findPass_Ques = $('#findPass_Ques').val();
		var find_a = $('#find_a').val();
		
		{
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : 'FindPasswordServlet',
				data : {find_id : find_id, findPass_Ques:findPass_Ques,find_a:find_a},
				success : function(res) {
					var result = res;
					if(result=='null'){
						$('#findPassword').text('잘못된 정보를 입력하셨습니다.');
						$('#findPassword').css('color', 'red');
					
					}else if(result!=null){
						$('#findPassword').text('password = ' + result);
						$('#findPassword').css('color', 'blue');
					}
				}
			});
		}// ajax
	});// click function////////////////////
});