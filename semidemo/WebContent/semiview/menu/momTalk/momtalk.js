var titleNum; //전역변수로 선언

//게시글+댓글 삭제요청
function allDelete(momtalk_post_num){
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'MomtalkAllDelete?momtalk_post_num='+momtalk_post_num,
		success:function(res){
			//alert("성공!");
			//alert("댓글이 있던 게시물 num = "+res);
			//$('div[class = "resultDiv"]').focus();
			alert("삭제되었습니다.");
		},
		error:function(res){
			alert("실패!");
		}
	});
}

//댓글입력요청
function listInput(momtalk_post_num, content, nickname){
	$.ajax({
		type:'POST',
		dataType:'text',
		url:'MomtalkCommInput',
		data:'momtalk_post_num='+titleNum+'&content='+content+'&nickname='+nickname,
		success:function(res){
			//alert("성공!");
			//alert("댓글이 입력된 게시물 num = "+res);
			listView(res);
		},
		error:function(res){
			//alert("실패!");
		}
	});
}


//댓글삭제요청
function listDelete(momtalk_comm_num, momtalk_post_num){
	//alert(momtalk_comm_num + ", " + momtalk_post_num);
	
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'MomtalkCommListDelete?momtalk_comm_num='+momtalk_comm_num+'&momtalk_post_num='+momtalk_post_num,
		success:function(res){
			//alert("성공!");
			//alert("댓글이 있던 게시물 num = "+res);
			listView(res);
		},
		error:function(res){
			alert("실패!");
		}
	});
}


//댓글수정요청
function listModi(momtalk_comm_num, momtalk_post_num, content){
	//alert(momtalk_comm_num + ", " + momtalk_post_num + ", " + content);
	
	$.ajax({
		type:'POST',
		dataType:'text',
		url:'MomtalkCommListModi',
		data:'momtalk_comm_num='+momtalk_comm_num+'&momtalk_post_num='+momtalk_post_num+'&content='+content,
		success:function(res){
			//alert("성공!");
			//alert("댓글이 있던 게시물 num = "+res);
			listView(res);
		},
		error:function(res){
			alert("실패!");
		}
	});
}




//댓글리스트요청
function listView(momtalk_post_num){
	titleNum = momtalk_post_num;
	//alert("listView");	
	$.ajax({
		type:'GET',
		dataType : 'json',
		url:'MomtalkCommList?momtalk_post_num='+momtalk_post_num,
		success: viewMessage
	});
};///////////////////////////////////////////////////////

//댓글 리스트 응답.
function viewMessage(res){
	//alert("viewMessage");	
	//alert("viewMessage In");
	//CommentListController 의 out.print(arr); 값을 res 로 받는다.
	//alert(res); //확인할때는 위에 dataType을 text로 변경해서 확인해본다.
	
	var commId = "#commList"+titleNum; // 해당 게시물의 댓글게시물로 접근하기 위해 id값을 지정해 둔 변수
	$(commId).empty(); //이미 불러져 있던 기좁 값들을 삭제하고 출력하기 위한 과정
	
	//값 출력
	for (index in res){
		//alert("viewMessage for In")
		//console.log("viewMessage for In");
		//console.log(res[0].nickname);
		var div = $('<div class = "commDiv"></div>'); //div 생성.
		$(commId).append(div); //새로 만든 div 추가
		
		var input = $('<input type = "hidden" name = "momtalk_comm_num" value="'+res[index].momtalk_comm_num+'" />');
		$(div).append(input);
		
		var image = $('<img class = "commImage" src="../semiview/images/momtalk/commImage.png" style = "width: 45px; height: 45px; size: 45px; padding-top:10px;"/>');
		$(div).append(image);
		var span1 = $('<span>&nbsp;&nbsp;'+res[index].nickname+'&nbsp;&nbsp;</span>');
		$(div).append(span1);
		var span2 = $('<span>|&nbsp;&nbsp;'+res[index].write_time+'</span>');
		$(div).append(span2);
		var p1 = $('<p style = "background-color : #FFCCCC;">'+res[index].content+'</p>');
		$(div).append(p1);
		
		//style = "display : none;"
		var tfDiv = $('<div class = "tfDiv" style = "display : none;" ></div>'); //수정 버튼을 띄울떄 나올 div.
		$(div).append(tfDiv);
			var tf = $('<textarea rows="4" cols="45" id="commtf" name="commtf" placeholder="수정사항을 입력해주세요." ></textarea>');
			$(tfDiv).append(tf);
			var inputModi = $('<input type="image" value="수정하기" src="../semiview/images/momtalk/checked.png" class = "inputModi" style = "width: 30px; height: 30px; size: 30px; padding-left:20px;"/>');
			$(tfDiv).append(inputModi);
		
		
		var inputupdate = $('<input type="image" src="../semiview/images/momtalk/commmodi.png" class = "commModi" style = "width: 30px; height: 30px; size: 30px; padding-right:20px; float : right;"/>');
		$(div).append(inputupdate);
		var inputdelete = $('<input type="image" src="../semiview/images/momtalk/commdelete.png" class = "commDel" style = "width: 30px; height: 30px; size: 30px; padding-right:10px; float : right;"/>');
		$(div).append(inputdelete);
	}
	
};//end viewMessage()///////
