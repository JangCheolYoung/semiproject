$(document).ready(function(){
	var emailAdd;
	 var regEmail= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;
     var regEmail2= /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	$('#findIdBtn').on('click',function() {
		emailAdd = $('#find_email').val() + '@'+ $('#find_email2').val();
    	 	if($(this).val()==""){
                $('#findId').text('');
    	 		
    	 	}else if (emailAdd != null) {
               // ajax 실행!
               {
            		  $.ajax({
            			type:'POST',
            			dataType:'text',
            			url:'FindIdServlet',
            			data:{emailAdd:emailAdd},
            			success:function(res){
            				var result=res
            				if(result=='null'){
            					$('#findId').text('이메일에 해당하는 아이디가 없습니다.');
            					$('#findId').css('color', 'red');
            				} else if(result!=null){
            					$('#findId').text('ID = ' + res);
            					$('#findId').css('color', 'blue');
            				}
            			}
            		});
               }//ajax
            }//else if
     });//click function////////////////////
});