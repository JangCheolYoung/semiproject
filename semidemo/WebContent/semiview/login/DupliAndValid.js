      var regId = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,12}$/;
      var regPassword = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&_*])[a-zA-Z0-9!@#$%^&*_]{8,16}$/;
      var regNickname= /^[a-zA-Zㄱ-ㅎ가-힣0-9]{2,12}$/;
      var regEmail= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i;
      var regEmail2= /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      var regFind_pass_ques;
      var regFind_pass_answ = /^[a-zA-Zㄱ-ㅎ가-힣]{1,100}$/;
      
        var inval_Arr=new Array(5).fill(false);
       
	var result;
	var idChk;
	var nicknameChk;
	var emailChk;
$(document).ready(function(){
   
     $("#id").blur(function() {
    	 	if($(this).val()==""){
                $('#idCheck').text('');
    	 		
    	 	}else if(regId.test($(this).val()) != true){
               console.log(regId.test($(this).val()));
                $('#idCheck').text('첫글자는 영문자, 전체 조합은 영문자, 숫자 5~15 글자이어야 합니다.');
                $('#idCheck').css('color', 'red');
             }else if (regId.test($(this).val()) == true) {
               // ajax 실행!
               {
            	   var id = $('#id').val();
            		  $.ajax({
            			type:'POST',
            			dataType:'text',
            			url:'IdCheckServlet',
            			data:{id:id},
            			success:function(res){
            				 result = res;
            				 
            				if(result=='success'){
            					idChk=true;
				               console.log(idChk);
            					$('#idCheck').text('사용 가능한 아이디 입니다');
            					$('#idCheck').css('color', 'blue');
            				}else if(result=='fail'){
            					idChk=false;
				               console.log(idChk);
            					$('#idCheck').text('이미 사용중인 아이디입니다.');
            					$('#idCheck').css('color', 'red');
            				} 
            					
            			}
            		}); 
            		
               }//ajax
               
            }//else if 
            
            
     });//blur function////////////////////
     $("#password").blur(function() {
         if($(this).val()==""){
             $('#passwordCheck').text('');
         }else if (regPassword.test($(this).val())) {
            console.log(regPassword.test($(this).val()));
            $("#passwordCheck").text('');
         } else {
            $('#passwordCheck').text('패스워드는 영문자, 숫자, 특수문자 포함 8~16글자이어야 합니다..');
            $('#passwordCheck').css('color', 'red');
               }
      });
      $("#password2").blur(function() {
         if($(this).val()==""){
             $('#password2Check').text('');
         }else if ($("#password").val()==$("#password2").val()) {
            $("#password2Check").text('');
         } else {
            $('#password2Check').text('패스워드가 다릅니다.');
            $('#password2Check').css('color', 'red');
         }
      });
        
      $("#nickname").blur(function() {
         if($(this).val()==""){
            $('#nicknameCheck').text('');
         }else if (regNickname.test($(this).val())) {
            console.log(regNickname.test($(this).val()));
            $("#nicknameCheck").text('');
         } else {
            $('#nicknameCheck').text('닉네임은 특수문자 제외 2~12 글자이어야 합니다.');
            $('#nicknameCheck').css('color', 'red');
         }
        });
      
      
      
      $("#nickname").blur(function() {
  	 	if($(this).val()==""){
              $('#nicknameCheck').text('');
  	 		
  	 	}else if(regNickname.test($(this).val()) != true){
             console.log(regNickname.test($(this).val()));
              $('#nicknameCheck').text('닉네임은 특수문자 제외 2~12 글자이어야 합니다.');
              $('#nicknameCheck').css('color', 'red');
           }else if (regNickname.test($(this).val()) == true) {
             // ajax 실행!
             {
          	   var nickname = $('#nickname').val();
          		  $.ajax({
          			type:'POST',
          			dataType:'text',
          			url:'NicknameCheckServlet',
          			data:{nickname:nickname},
          			success:function(res){
          				
          				 result = res;
          				 
          				if(result=='success'){
          					nicknameChk=true;
				               console.log(nicknameChk);
          					$('#nicknameCheck').text('사용 가능한 닉네임 입니다.');
          					$('#nicknameCheck').css('color', 'blue');
          				}else if(result=='fail'){
          					nicknameChk=false;
				               console.log(nicknameChk);
          					$('#nicknameCheck').text('이미 사용중인 닉네임입니다.');
          					$('#nicknameCheck').css('color', 'red');
          				} 
          					
          			}
          		}); 
          		
             }//ajax
             
          }//else if 
          
          
   });//blur function////////////////////
   
      $("#email").blur(function() {
         if($(this).val()==""){
            $('#emailCheck').text('');
         }else if (regEmail.test($(this).val())) {
             console.log(regEmail.test($(this).val()));
            $("#emailCheck").text('');
         } else {
             console.log(regEmail.test($(this).val()));
            $('#emailCheck').text('이메일 양식을 지켜주세요.');
            $('#emailCheck').css('color', 'red');
         }
        });
      $("#email2").blur(function() {
    	  var email=$("#email").val()+"@"+$("#email2").val();
         if($(this).val()==""){
            $('#email2Check').text('');
         }else if (regEmail2.test($(this).val())!=true) {
        	 $('#email2Check').text('이메일주소 양식을 지켜주세요.');
        	 $('#email2Check').css('color', 'red');
        	 
         } else if(regEmail2.test($(this).val())==true){
        	 
             // ajax 실행!
             {
          	   var id = $('#email2').val();
          		  $.ajax({
          			type:'POST',
          			dataType:'text',
          			url:'EmailCheckServlet',
          			data:{email:email},
          			success:function(res){
          				 result = res;
          				if(result=='success'){
          					emailChk=true;
				            console.log(emailChk);
          					$('#email2Check').text('사용 가능한 이메일입니다');
          					$('#email2Check').css('color', 'blue');
          				}else if(result=='fail'){
          					emailChk=false;
				            console.log(emailChk);
          					$('#email2Check').text('이미 사용중인 이메일입니다.');
          					$('#email2Check').css('color', 'red');
          				} 
          					
          			}
          		}); 
          		
             }//ajax
             
          }//else if 
          
          
   });//blur function////////////////////
      
      $("#pass_answ").blur(function() {
         if($(this).val()==""){
            $('#pass_answCheck').text('');
         }else if (regFind_pass_answ.test($(this).val())) {
            console.log(regFind_pass_answ.test($(this).val()));
            $("#pass_answCheck").text('');
         } else {
            $('#pass_answCheck').text('패스워드 찾기 질문에 대한 답변을 작성해주세요.');
            $('#pass_answCheck').css('color', 'red');
         }
      });

     
   
     
     $('#signBtn').on('click', function(){
      //아이디
          if(regId.test($('#id').val())){
            inval_Arr[0]=true;
            console.log(inval_Arr[0]);
         }else{
            inval_Arr[0]=false;
            console.log(inval_Arr[0]);
            alert('아이디를 확인하세요');
            return false;
         } 
      	
      		if(idChk==false){
            inval_Arr[0]=false;
            console.log(inval_Arr[0]);
            alert('아이디를 확인하세요');
            return false;
      		}
         
         
         //비밀번호
         if(regPassword.test($('#password').val())&&($('#password').val()==($('#password2').val()))){
            inval_Arr[1]=true;
            console.log(inval_Arr[1]);
         }else{
            inval_Arr[1]=false;   
            console.log(inval_Arr[1]);
            alert('비밀번호를 확인하세요');
            return false;
         }
        // 닉네임 정규식
        if (regNickname.test($('#nickname').val())) {
           inval_Arr[2] = true;   
            console.log(inval_Arr[2]);
        } else {
           inval_Arr[2] = false;
            console.log(inval_Arr[2]);
            alert('닉네임을 확인하세요');
           return false;
        }
       
         // 이메일1 정규식
          if(regEmail.test($('#email').val())){
           inval_Arr[3] = true;
            console.log(inval_Arr[3]);
        }else{
           inval_Arr[3]=false;
            console.log(inval_Arr[3]);
            alert('이메일을 확인하세요');
           return false;
        }
       // 이메일2 정규식
          if(regEmail.test($('#email').val())){
           inval_Arr[4] = true;
            console.log(inval_Arr[4]);
        }else{
           inval_Arr[4]=false;
            console.log(inval_Arr[4]);
            alert('이메일주소를 확인하세요');
           return false;
        }   
       
        var validAll = true;
        for(var i = 0; i < inval_Arr.length; i++){
           
           if(inval_Arr[i] == false){
              validAll = false;
              console.log(validAll);
           }
        }
        
        if(validAll == true){ // 유효성 모두 통과
        	alert('회원가입이 성공적으로 완료되었습니다!');
        	$('#email').val($('#email').val()+'@'+$('#email2').val());
	        $('#frm').attr('action', 'signUpWrite.do');
	        $('#frm').submit();
        } else{
        	alert('회원가입 안됐어요!');
        	return false ;
        } 
        
     });
     
     
});
///////////////////////중복검사