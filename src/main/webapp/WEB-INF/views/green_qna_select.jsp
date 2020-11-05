<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA SELECT</title>
<link href="resources/css/green_qna_select.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Open+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

 
</head>
<body>

	
	
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <section class="green__board__select">
    <input type="hidden" id="alarm_boardno" value="${list.boardno }">
	<input type="hidden" id="recipient" value="${list.id }"/>
	<input type="hidden" id="sender" value="${dto.id }"/>
	<input type="hidden" id="qna_title" value="${list.title}"/>
        <div class="board__title">
            <div class="title"><p>TITLE</p></div>
            <div class="title__name">${list.title }</div>
        </div>
        <div class="line"></div>
        <div class="board__content">
            <div class="content">${list.content }</div>
            <c:choose>
            	<c:when test="${dto.id eq list.id }">
		            <div class="content__buttons">
		                <input class="button" type="button" name="" value="UPDATE" onclick="location.href='qnaupdate.do?boardno=${list.boardno}'" />
		                <input class="button" type="button" name="" value="DELETE" onclick="location.href='qnadelete.do?boardno=${list.boardno}'" />
		            </div>
	            </c:when>
	            <c:otherwise></c:otherwise>
            </c:choose>
        </div>
        <div class="line"></div>
        <c:choose>
        	<c:when test="${relist.content != null }">
		        <div class="board__reply">
		            <div class="reply__admin"><p>Admin</p></div>
		            <div class="reply__comments">${relist.content }</div>
		        </div>
	        </c:when>
	        <c:when test="${dto.role eq 'ADMIN' }">
	        	<form action="qnaReinsert.do" class="class__qnaReinsert">
			        <div class="line"></div>
			        <div class="board__reply__insert">
			            <div class="reply__admin">Admin</div>
			            <div class="reply__comments__insert">
			            	<input type="hidden" name="boardno" value="${list.boardno }">
			                <textarea class="comments__text" required="required" name="content">text</textarea>
			                <div class="reply__buttons">
			                    <input class="button" type="button" value="SUBMIT" onclick="sendMessage()" />
			                </div>
			            </div>
			        </div>
		        </form>
	        </c:when>
	        <c:otherwise></c:otherwise>
        </c:choose>
          <script type="text/javascript">
var socket=null;
var alarm_boardno= document.getElementById("alarm_boardno").value;
var recipient= document.getElementById("recipient").value;
var sender= document.getElementById("sender").value;
var qna_title= document.getElementById("qna_title").value;
// test
console.log("alarm_boardno"+alarm_boardno);
console.log("recipient"+recipient);
console.log("sender"+sender);
console.log("qna_title"+qna_title);

var alarm_message={
   	"recipient":recipient,	
   	"sender":sender,		
   	"alarm_title":"답글이 작성되었습니다.",
   	"alarm_content":"작성하신  '"+qna_title+"' 글에 답글이 작성되었습니다.",
   	"alarm_boardno":alarm_boardno
};

$(document).ready(function (){
	console.log("socket전")
 connectWs();
	console.log("socket후")
});

function connectWs(){
	console.log("sock만들어졌다~")
	 /* sock = new SockJS("http://localhost:8787/green/socket.do"); */ 
	 sock = new WebSocket("ws://localhost:8787/green/socket.do");  
	console.log("sock만들어졌다~2");
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
/* 	$.ajax({
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
*/
/* 
	// 모달 알림
	var toastTop = app.toast.create({
     text: "알림 : " + data + "\n",
     position: 'top',
     closeButton: true,
   });
   toastTop.open();
	 */
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
	
//	//스크랩 알림 DB저장
	
// 		$.ajax({
// 			type : 'post',
// 			url : '/mentor/member/saveAlarm',
// 			data : JSON.stringify(AlarmData),
// 			contentType: "application/json; charset=utf-8",
// 			dataType : 'text',
// 			success : function(data){
// 				if(socket){
// 					let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq;
// 					console.log("msgmsg : " + socketMsg);
// 					socket.send(socketMsg);
// 				}

// 			},
// 			error : function(err){
// 				console.log(err);
// 			}
// 		});

	if(socket){
	console.log("socket존재")
	socket.send(JSON.stringify(alarm_message));		//json형태의 String으로 보내줌 
	//document.getElementsByClassName("class__qnaReinsert")[0].submit();
	}
	}
	
//메시지 전송
function sendMessage(){
	let today= new Date();
	let alarm_date=today.toLocaleString();
	alarm_message.alarm_date=alarm_date;	 //날짜생성
	
	console.log("msg",alarm_message);
	
	// 스크랩 알림 DB저장
	
 	/* 	$.ajax({
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
 		}); */
	

	if(socket){
	console.log("socket존재")
	socket.send(JSON.stringify(alarm_message));		 //json형태의 String으로 보내줌 
	 document.getElementsByClassName("class__qnaReinsert")[0].submit();
	}
	}

</script>
    </section> 
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>