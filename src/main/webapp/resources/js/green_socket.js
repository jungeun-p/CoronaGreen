

$(document).ready(function (){
	 if(WebSocket.readyState!==0){
			 connectWs();
			 }
});

function connectWs(){
	   
	 sock = new WebSocket("wss://coronagreen.cf/socket.do");
	 socket = sock; 
	 


//웹 소켓이 열리면 호출 
	sock.onopen = function() {
 };

//서버로부터 메시지를 받았을 때
sock.onmessage = function(evt) {	
 	var data = evt.data;

   	notify(data);
  
};
//서버와 연결을 끊었을때
sock.onclose = function() {
	 setTimeout(function(){conntectWs();} , 1000); 
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}



