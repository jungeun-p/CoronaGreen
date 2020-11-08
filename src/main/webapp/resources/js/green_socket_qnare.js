var socket=null;
var alarm_boardno= document.getElementById("alarm_boardno").value;
var recipient= document.getElementById("recipient").value;
var sender= document.getElementById("sender").value;
var qna_title= document.getElementById("qna_title").value;

var alarm_message={
   	"recipient":recipient,	
   	"sender":sender,		
   	"alarm_title":"답글이 작성되었습니다.",
   	"alarm_content":"작성하신  '"+qna_title+"' 글에 답글이 작성되었습니다.",
   	"alarm_boardno":alarm_boardno,
};

// $(document).ready(function (){
// 	 if(WebSocket.readyState!==0){
// 			console.log("연결된게 없다~");
// 			 connectWs();
// 			 }else{
// 			console.log("연결된게 있다~")
// 			 }
 
// });

// function connectWs(){
//  	console.log("sock만들어졌다~")
//  	 sock = new WebSocket("ws://localhost:8787/green/socket.do");  
// 	 socket = sock; 
	 


// //웹 소켓이 열리면 호출 
// 	sock.onopen = function() {
//     console.log('info: connection opened.');
// };

// //서버로부터 메시지를 받았을 때
// sock.onmessage = function(evt) {	
// 	var data = evt.data;

// 	console.log("ReceivMessage : " + data + "\n");
// 	notify(data);
// /* 	$.ajax({
// 		url : '/mentor/member/countAlarm',
// 		type : 'POST',
// 		dataType: 'text',
// 		success : function(data) {
// 			if(data == '0'){
// 			}else{
// 				$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
// 				$('#alarmCountSpan').text(data);
// 			}
// 		},
// 		error : function(err){
// 			alert('err');
// 		}
// 	});
// */
// /* 
// 	// 모달 알림
// 	var toastTop = app.toast.create({
//      text: "알림 : " + data + "\n",
//      position: 'top',
//      closeButton: true,
//    });
//    toastTop.open();
// 	 */
// };

// //서버와 연결을 끊었을때
// sock.onclose = function() {
// 	console.log('connect close');
// 	/* setTimeout(function(){conntectWs();} , 1000); */
// };

// //에러발생시 
// sock.onerror = function (err) {console.log('Errors : ' , err);};
// }


//메시지 전송
function sendMessage(){
	let today= new Date();
	let alarm_date=today.toLocaleString();
	alarm_message.alarm_date=alarm_date;	//날짜생성

	console.log("msg",alarm_message);
	
//	//스크랩 알림 DB저장
	
 		$.ajax({
 			type : 'post',
 			url : 'qnareAlarm.do',
 			data : JSON.stringify(alarm_message),
 			contentType: "application/json; charset=utf-8",
 			dataType : 'text',
 			success : function(data){
	 				/*if(socket){
	 					let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq;
	 					console.log("msgmsg : " + socketMsg);
	 					socket.send(socketMsg);
 				}*/
				if(data>0){
					console.log(data+"insert완료")
					}else{
						console.log("insert실패")
					}
 			},
 			error : function(err){
 				console.log(err);
 			}
 		});

	if(socket){
	console.log("socket존재")
	socket.send(JSON.stringify(alarm_message));		//json형태의 String으로 보내줌 
	document.getElementsByClassName("class__qnaReinsert")[0].submit();
	}
	}
	

