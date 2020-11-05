   var socket=null;
	var recipient="${list.id}"
	var sender="${dto.id}"
	var title="${list.title}"
   var alarm_message={
	   	"recipient":recipient,	
	   	"sender":sender,		
	   	"alarm_title":"답글이 작성되었습니다.",
	   	"alarm_content":"작성하신  '"+title+"' 글에 답글이 작성되었습니다." 
   };
   
  
   
         	 
//메시지 전송
	function sendMessage(){
		let today= new Date();
		let alarm_date=today.toLocaleString();
		alarm_message.alarm_date=alarm_date;	//날짜생성
		
		console.log("msg",alarm_message);
		
		//스크랩 알림 DB저장
		/*
			$.ajax({
				type : 'post',
				url : '/mentor/member/saveAlarm',
				data : JSON.stringify(AlarmData),
				contentType: "application/json; charset=utf-8",
				dataType : 'text',
				success : function(data){
					if(socket){
						let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq;
						console.log("msgmsg : " + socketMsg);
						socket.send(socketMsg);
					}
		 
				},
				error : function(err){
					console.log(err);
				}
			});
		*/

		if(socket){
		console.log("socket존재")
		socket.send(JSON.stringify(alarm_message));		//json형태의 String으로 보내줌 
		document.getElementsByClassName("class__qnaReinsert")[0].submit();
		}
   	}
   
 