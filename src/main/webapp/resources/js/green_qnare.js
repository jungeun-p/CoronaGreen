   var socket=null;
   var alarm_message={
	   	recipient:"${list.id}",	
	   	sender:"${dto.id}",		
	   	alarm_title:"답글이 작성되었습니다.",
	   	alarm_content:"작성하신 '{list.title}'글에 답글이 작성되었습니다." 
   };
   
   $(document).ready(function (){
	   connectWs();
   });
 
   function connectWs(){
   	sock = new SockJS( "<c:url value="/echo"/>" );
   	//sock = new SockJS('/socket');
   	socket = sock;

 
 //웹 소켓이 열리면 호출 
   	sock.onopen = function() {
           console.log('info: connection opened.');
     };
 
 //서버로부터 메시지를 받았을 때
    sock.onmessage = function(evt) {	
	 	var data = evt.data;
	   	console.log("ReceivMessage : " + data + "\n");
 
	   	$.ajax({
			url : '/mentor/member/countAlarm',
			type : 'POST',
			dataType: 'text',
			success : function(data) {
				if(data == '0'){
				}else{
					$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
					$('#alarmCountSpan').text(data);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});
 
	   	// 모달 알림
	   	var toastTop = app.toast.create({
            text: "알림 : " + data + "\n",
            position: 'top',
            closeButton: true,
          });
          toastTop.open();
    };
 //서버와 연결을 끊었을때
    sock.onclose = function() {
      	console.log('connect close');
      	/* setTimeout(function(){conntectWs();} , 1000); */
    };
 
    sock.onerror = function (err) {console.log('Errors : ' , err);};
   }
   
         	 
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
		socket.send(alarm_message.stringify(AlarmData));		//json형태의 String으로 보내줌 
		document.getElementsByClassName("class__qnaReinsert")[0].submit();
		}
   	}
   
 