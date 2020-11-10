

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

   	notify(data);
  
};
//서버와 연결을 끊었을때
sock.onclose = function() {
  	console.log('connect close');
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}



