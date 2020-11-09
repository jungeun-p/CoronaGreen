// var socket=null;
//   var alarm_boardno= document.getElementById("alarm_boardno").value;
//   var recipient= document.getElementById("recipient").value;
//   var sender= document.getElementById("sender").value;
//   var qna_title= document.getElementById("qna_title").value;
//   // test
//   console.log("alarm_boardno"+alarm_boardno);
//   console.log("recipient"+recipient);
//   console.log("sender"+sender);
//   console.log("qna_title"+qna_title);

//   var alarm_message={
//      	"recipient":recipient,	
//      	"sender":sender,		
//      	"alarm_title":"답글이 작성되었습니다.",
//      	"alarm_content":"작성하신  '"+qna_title+"' 글에 답글이 작성되었습니다.",
//      	"alarm_boardno":alarm_boardno
//   };

$(document).ready(function (){
	 if(WebSocket.readyState!==0){
			console.log("연결된게 없다~");
			 connectWs();
			 }else{
			console.log("연결된게 있다~")
			 }
});

function connectWs(){
 	console.log("sock만들어졌다~")
	 sock = new WebSocket("wss://coronagreen.cf/socket.do");  
	 socket = sock; 
	 


//웹 소켓이 열리면 호출 
	sock.onopen = function() {
       console.log('info: connection opened.');
 };

//서버로부터 메시지를 받았을 때
sock.onmessage = function(evt) {	
 	var data = evt.data;

   	console.log("ReceivMessage : " + data + "\n");
   	notify(data);
  
};
//서버와 연결을 끊었을때
sock.onclose = function() {
  	console.log('connect close');
  	/* setTimeout(function(){conntectWs();} , 1000); */
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}



