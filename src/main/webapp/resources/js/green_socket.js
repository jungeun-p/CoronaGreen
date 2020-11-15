
$(document).ready(function (){
	 if(WebSocket.readyState!==0){
			 connectWs();
			 }
});


function connectWs(){
	   
	 sock = new WebSocket("wss://coronagreen.cf/socket.do");
	 


//웹 소켓이 열리면 호출 
	sock.onopen = function() {
		console.log("시작해볼까")
 };

//서버로부터 메시지를 받았을 때
sock.onmessage = function(evt) {	
 	var data = evt.data;

   	notify(data);
  
};
//서버와 연결을 끊었을때
sock.onclose = function() {
	console.log("끊겼다 다시간다~")
	  setTimeout(function() {
         connectWs();
       }, 1000);
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}



