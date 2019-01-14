



//댓글 입력
function insertHandOutComment(){
	var handout_post_num = $('#handout_post_num').val();
	var nickname = $('#nickname').val();
	var comment_content = $('#comment_content').val();
	var image = $('#image').val();
	
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'handOutCommentInsert',
		data : {
			handout_post_num : handout_post_num, nickname:nickname,comment_content:comment_content,image:image
		},
		success : function(){
			$('#commContent').empty(); //commentList 의 자식 삭제. (객체는 남아있고 자식 요소만 삭제 된다.)
			listView(handout_post_num); //listView 재호출
			
		},
		error : function() {
			alert("error");
		}

	});
	
}

//댓글 출력
function listView(handout_post_num){
	
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url:'handOutCommentList?handout_post_num='+handout_post_num,
		success: show,
		error: function(){
			alert("error");
		}
	});
};//end listView()////////////////

//댓글 출력 성공 메소드
function show(comment) {
	
	for (index in comment) {
	 
		
		var div = $('<div style="clear: both;"></div>'); //div 생성.
		$('#commContent').append(div); //새로 만든 div 추가
		//이미지 div 생성
		var imgDiv = $('<div style="float: left;"></div>'); 
		$(div).append(imgDiv);
		var img = $('<img id="comm_img" style="width:50px; height: 50px;" src="../semiview/images/handout/'+comment[index].image+'"/>');
		$(imgDiv).append(img);
		//가운데 div 에 nickname, write_time, content 넣기
		var centerDiv = $('<div style="float: left;"></div>');
		$(div).append(centerDiv);
		var nickname = $('<span id="comm_nickname">'+comment[index].nickname+'&nbsp;&nbsp;&nbsp;'+'</span>');
		$(centerDiv).append(nickname);
		var write_time = $('<span id="comm_write_time">'+comment[index].write_time+'</span>');
		$(centerDiv).append(write_time);
		var content = $('<p id="comm_content">'+comment[index].content+'</p>');
		$(centerDiv).append(content);
		//버튼 div 생성
		var btnDiv = $('<div style="float: right;"></div>');
		$(div).append(btnDiv);
		var inputupdate = $('<input type="button" id="commUpdateBtn" name="commUpdateBtn" value="댓글수정"/>');
		$(btnDiv).append(inputupdate);
		var inputdelete = $('<input type="button" id="commDeleteBtn" name="commDeleteBtn" value="댓글삭제"/>');
		$(btnDiv).append(inputdelete);
		var handout_comm_num = $('<input type="hidden" id="handout_comm_num" name="hanout_comm_num" value="'+comment[index].handout_comm_num+'"/>');
		$(btnDiv).append(handout_comm_num);
		
		var tfDiv = $('<div class = "tfDiv" style = "display : none;" ></div>'); //수정 버튼을 띄울떄 나올 div.
		$(div).append(tfDiv);
		var tf = $('<textarea rows="4" cols="45" id="commtf" name="commtf" placeholder="수정사항을 입력해주세요." ></textarea>');
		$(tfDiv).append(tf);
		var inputUpdate = $('<input type="image" value="'+comment[index].handout_comm_num+'" src="../semiview/images/handout/checked.png" id = "inputUpdate" style = "width: 30px; height: 30px; size: 30px; padding-left:20px;"/>');
		$(tfDiv).append(inputUpdate);
		}
		
		
}


//댓글 업데이트 버튼
function UpdateHandOutComment(handout_comm_num, comm_content, handout_post_num){
	
		
		$.ajax({
			type: 'POST',
			dataType: 'text',
			url: 'handOutCommentUpdate',
			data: 'handout_comm_num='+handout_comm_num+'&comm_content='+comm_content+'&handout_post_num='+handout_post_num,
			success: update,
			error: function(){
				alert("댓글 수정 오류");
			}
		
	});
}
//댓글 업데이트 성공 메소드
function update(comment){
	
	$('#commContent').empty();
	listView(comment); //listView 재호출
	//댓글 수정이 안료 되었으면 수정창은 안보이게 하고 댓글 입력 창을 다시 띄워준다.
}


//댓글 삭제
function DeleteHandOutComment(handout_comm_num, handout_post_num){
	
	
	$.ajax({
		type:'GET',
		dataType: 'text',
		url:'handOutCommentDelete?handout_comm_num='+handout_comm_num+'&handout_post_num='+handout_post_num,
		success: function(){
			$('#commContent').empty(); //commentList 의 자식 삭제. (객체는 남아있고 자식 요소만 삭제 된다.)
			listView(handout_post_num); //listView 재호출
			
		},
		error: function(comment){
			alert('error');
		}
	});
}




