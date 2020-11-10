$(document).ready(function (){
	//WebSocket 연결의 현재 상태를 반환한다.
	//연결되어 있지 않다면
	 if(WebSocket.readyState!==0){
			 connectWs();
			 }
});

function connectWs(){
	//socket만들어짐
	 sock = new WebSocket("ws://3.35.112.5:8080/coronagreen_websocket/socket.do");  
	 socket = sock; 
	 


//웹 소켓이 열리면 호출 
	sock.onopen = function() {
       console.log('info: connection opened.');
 };

//서버로부터 메시지를 받았을 때
sock.onmessage = function(evt) {	
 	var data = evt.data;

   	notify(data);
  
};
//서버와 연결을 끊었을때
sock.onclose = function() {
  	console.log('connect close');
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}



