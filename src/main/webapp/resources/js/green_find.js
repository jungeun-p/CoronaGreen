var mailJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
$("#id__email").keyup(function(){
	var email_del = $("#id__email");
	var email_check = email_del.val().replace(/(\s*)/g,"");
	email_del.val(email_del.val().replace(/(\s*)/g,""));

	if (email_check == "") {
		$("#check1").text("이메일을 입력해주세요.");
		$("#check1").css("color","red");
		$("#emailsend").prop("disabled", true);
	}else if (mailJ.test(email_check)) {
		$("#check1").text("");
		$("#emailsend").prop("disabled", false);
	} else {
		$("#check1").text("이메일 주소를 다시 확인해주세요.");
		$("#check1").css("color","red");
		$("#emailsend").prop("disabled", true);
	}

})
	$("#emailsend").click(function(){
		var email = $("#id__email").val();
		$.ajax({
			url : "emailsend.do?email="+email,
			type : 'POST',
			success: function(data) {
				if(data) {
					$("#check1").text("회원님의 이메일로 아이디를 발송했습니다.");
					$("#check1").css("color","blue");
				} else {
					$("#check1").text("입력하신 이메일로는 아이디가 확인되지 않습니다.");
					$("#check1").css("color","red");
				}
			},
			error: function(){
				alert("에러 발생!");
			}
		})
	})







$("#pw__id").keyup(function(){
	//var id_check = $("#pw__id").val();
	var id_del = $("#pw__id");
	var id_check = id_del.val().replace(/(\s*)/g,"");
	id_del.val(id_del.val().replace(/(\s*)/g,""));
	var email_check2 = $("#pw__email").val();
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
	var email_del = $("#pw__email");
	var email_check2 = email_del.val().replace(/(\s*)/g,"");
	email_del.val(email_del.val().replace(/(\s*)/g,""));
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


$("#emailsend2").click(function(){
	var id = $("#pw__id").val();
	var email = $("#pw__email").val();
$.ajax({
	url: "emailsendcode.do?id=" + id + "&email=" + email,
	type: "POST",
	success: function(data){
		if (data == "NO") {
			$("#pw__email__code").prop("disabled",true);
			$("#check4").text("입력하신 정보는 존재하지 않습니다.");
			$("#check4").css("color", "red");
		} else {
			$("#pw__email__code").prop("disabled",false);
			$("#check4").text("이메일이 발송되었습니다. 코드를 입력해주세요.");
			$("#check4").css("color", "red");
			console.log(data);
			$("#pw__email__code").keyup(function(){
				var user_code_del = $("#pw__email__code");
				var user_code = user_code_del.val().replace(/(\s*)/g,"");
				user_code_del.val(user_code_del.val().replace(/(\s*)/g,""));
				if (data == user_code) {
					$("#check4").text("인증번호가 일치합니다");
					$("#check4").css("color", "blue");
					$("#search").prop("disabled", false);
				} else {
					$("#check4").text("인증번호가 일치하지 않습니다.");
					$("#check4").css("color", "red");
					$("#search").prop("disabled", true);
				}
			})
		}
	}, error: function() {
		alert("통신실패");
	}
	})
})


/*$("#pw__email__code").keyup(function(){
	var random_code = $("#code").val();
	var user_code_del = $("#pw__email__code");
	var user_code = user_code_del.val().replace(/(\s*)/g,"");
	user_code_del.val(user_code_del.val().replace(/(\s*)/g,""));
	if (random_code == user_code) {
		$("#check4").text("인증번호가 일치합니다");
		$("#check4").css("color", "blue");
		$("#search").prop("disabled", false);
	} else {
		$("#check4").text("인증번호가 일치하지 않습니다.");
		$("#check4").css("color", "red");
		$("#search").prop("disabled", true);
	}
})*/

