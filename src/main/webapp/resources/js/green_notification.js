	window.onload=function(){
		if(window.Notification){
			Notification.requestPermission();
		}
	}
	function calculate(){
		setTimeout(function(){
			notify();
		},500)
	}
	
	function notify(data){
		console.log("notification:"+data);
		var js = JSON.parse(data);
		var notification_title=js.alarm_title;
		var notification_content=js.alarm_content +"\n"+js.alarm_date;
		var alarm_boardno=js.alarm_boardno;
		
		console.log(notification_title+"sdsd"+notification_content)
		if(Notification.permission !=='granted'){		
			//권한값이 granted가 아닌경우
			//granted: 사용자가 의도하여 어플리케이션이 알림을 보낼 수 있도록 허가.
			//denied: 사용자가 의도하여 어플리케이션이 알림을 보내는 것을 거부.
			//default: 사용자의 결정은 알 수 없으나, 어플리케이션 기본적으로 denied 와 같이 동작할 것 입니다.
			//notification('제목',{ }')
			alert("알림을 허용해주세요")
			
		}
		else {
			//icon : 생성자의 옵션 파라메터 안에 명시된 알림의 아이콘으로 사용될 이미지의 URL
			//body : 생성자의 옵션 파라메터 안에 명시된 알림의 보문
			var notification =new Notification(notification_title,{
				icon: ' http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
			 	body: notification_content,
			 	});
			 
			 //사용자가 알림을 클릭할 때 마다 호출
			 notification.onclick=function(){
				location.href="qnadetail.do?boardno="+alarm_boardno; 
			 }
			 
			 
		}
	}
	
	
