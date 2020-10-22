var mailJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
$("#id__email").keyup(function(){
	var email_check = $("#id__email").val();
	if (mailJ.test(email_check)) {
		$("#check1").text("");
		$("#emailsend").prop("disabled", false);
	$("#emailsend").click(function(){
		var email = $("#id__email").val();
		var random = $("#random").val();
		$.ajax({
			url : "emailsend.do?email="+email + "&random=" + random,
			type : 'get',
			success: function(data) {
				if(data) {
					alert("회원님의 이메일로 아이디를 보내드렸습니다");
					location.href = "main.do";
				} else {
					alert("입력하신 이메일로는 아이디가 확인되지 않습니다.");
					location.href = "main.do";
				}
			},
			error: function(data){
				alert("에러 발생!");
				return false;
			}
		})
	})
	} else {
		$("#check1").text("이메일 주소를 다시 확인해주세요.");
		$("#check1").css("color","red");
		$("#emailsend").prop("disabled", true);
	}

})

$("#pw__id").keyup(function(){
	var id_check = $("#pw__id").val();
	var email_check2 = $("#pw__email").val();
	console.log(mailJ.test(email_check2));
	if ((id_check != "" && email_check2 != "") && (mailJ.test(email_check2) == true)) {
		if (email_check2 == "") {
			$("#check2").text("");
			$("#emailsend2").prop("disabled", true);
		}
		$("#check2").text("");
		$("#emailsend2").prop("disabled", false);
	} else if (id_check == ""){
		$("#check2").text("아이디를 입력해주세요.");
		$("#check2").css("color", "red");
		$("#emailsend2").prop("disabled", true);
		
	} else if (id_check != "") {
		$("#check2").text("");
	}
	
})

$("#pw__email").keyup(function(){
	var id_check = $("#pw__id").val();
	var email_check2 = $("#pw__email").val();
	if ((id_check != "" && email_check2 != "") && (mailJ.test(email_check2) == true)) {
		$("#check3").text("");
		$("#emailsend2").prop("disabled", false);
	} else if (email_check2 == ""){
		$("#check3").text("이메일을 입력해주세요.");
		$("#check3").css("color", "red");
		$("#emailsend2").prop("disabled", true);
	} else if (mailJ.test(email_check2) == false) {
		$("#check3").text("이메일 주소를 다시 확인해주세요.");
		$("#check3").css("color", "red");
		$("#emailsend2").prop("disabled", true);
	} else if (mailJ.test(email_check2)) {
		$("#check3").text("");
	}
})