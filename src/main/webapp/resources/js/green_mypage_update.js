var num = /[0-9]/g;
var eng = /[a-z]/ig;
var spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
var blank = /₩s/;

var reg1 = /^[a-z0-9]{8,20}$/;
var reg2 = /[a-z]/g;
var reg3 = /[0-9]/g;

var check = false;
var pw = function() {
	var user_pw = $("#pw").val().trim();
	var user_pwchk = $("#pwchk").val().trim();
	if (user_pw == "") {
		$("#pw_check1").text("비밀번호를 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		$("#change").prop("disabled", true);
		check = false;
		return false;
	} else if (user_pw.length < 8 || user_pw.length > 20) {
		$("#pw_check1").text("비밀번호 8~20자 이내로 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		$("#change").prop("disabled", true);
		check = false;
		return false;
	} else if ((user_pw.search(num) < 0 && user_pw.search(eng) < 0)
			|| (user_pw.search(eng) < 0 && user_pw.search(spe) < 0)
			|| (user_pw.search(spe) < 0 && (user_pw.search(num) < 0))) {
		$("#pw_check1").text("영문, 숫자, 특수문자 중 2가지 이상 혼합하여 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		$("#change").prop("disabled", true);
		check = false;
		return false;
	} else {
		if (user_pwchk == "") {
			$("#pw_check1").text("");
			$("#change").prop("disabled", true);
			check = true;
		} else {
			$("#pw_check1").text("");
			$("#change").prop("disabled", false);
			check = true;
		}
	}

	if ((user_pw != user_pwchk) && user_pwchk != "") {
		$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
		$('#pw_check2').css('color', 'red');
		$("#change").prop("disabled", true);
	} else if ((user_pw == user_pwchk) && user_pwchk != "") {
		$("#pw_check2").text("");
		$("#change").prop("disabled", false);
		check = true;
	}
}
// 비밀번호 확인 체크
var pwchk = function() {
	var user_pw = $("#pw").val().trim();
	var user_pwchk = $("#pwchk").val().trim();
	if (check == true) {
		if (user_pwchk == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			$("#change").prop("disabled", true);
		} else if ((user_pw != user_pwchk) && user_pw == "") {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else if (user_pw.length < 8) {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else if (user_pw != user_pwchk) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			$("#change").prop("disabled", true);
		} else if (user_pw == "") {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else {
			$("#pw_check2").text("");
			$("#change").prop("disabled", false);
		}
	} else {
		if (user_pwchk == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			$("#change").prop("disabled", true);
		} else if ((user_pw != user_pwchk) && user_pw == "") {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else if (user_pw.length < 8) {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else if (user_pw != user_pwchk) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			$("#change").prop("disabled", true);
		} else if (user_pw == "") {
			$("#pw_check2").text("");
			$("#change").prop("disabled", true);
		} else {
			$("#pw_check2").text("");
			$("#change").prop("disabled", false);
		}
	}
	if (check == false) {
		$("#change").prop("disabled", true);
	}
}

var blank_del = function() {
	var user_pw = $("#pw");
	user_pw.val(user_pw.val().replace(/(\s*)/g,""));
}

var blank_del2 = function() {
	var user_pwchk = $("#pwchk");
	user_pwchk.val(user_pwchk.val().replace(/(\s*)/g,""));
}


$(document).ready(function(){
	$("#pw").blur(function() {
	
	blank_del();
	pw();
})

$("#pwchk").blur(function() {

	blank_del2();
	pwchk();

})
})




function pw_check(){
		
		var pw=$("input[name=pw]").val();
		var pw_check=$("input[name=passwordconfirm]").val();
		var member_pw="${dto.pw}";
		
		$.ajax({
			url : 'pw_check.do?pw='+pw,
			type : 'get',
			success: function(data) {
			alert(data);
				if(pw != pw_check){
				$(".update__message").text("※ 비밀번호가 서로 다릅니다");
			$("input[name=pw]").val("");
			$("input[name=passwordconfirm]").val("");
			$("input[name=passwordconfirm]").focus();
		}else{;
			
			if(data){
				$("input[name=pw]").val("");
				$("input[name=pw]").focus();
				$(".update__message").text("※ 기존 비밀번호와 같을 수 없습니다");
			}else{
				document.getElementsByClassName("update__form")[0].submit();
			}
		}
		
			},
			error: function(data){
				alert("에러 발생!");
				return false;
			}
		})		
	}

