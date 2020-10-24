function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 주소 변수
            var addr = '';
            // 참고항목 변수
            var extraAddr = '';

            // 사용자가 선택한 주소가 도로명주소일 때
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                // 사용자가 선택한 주소가 지번주소일 때 
                addr = data.jibunAddress;
            }

			// 우편번호와 주소 정보를 해당 필드에 넣는다.

			$("#roadFullAddr1").val(data.zonecode);
			$("#roadFullAddr2").val(addr);
			
			$("#addr_check").text("");

			/*
			 * document.getElementById('signUpUserPostNo').value =
			 * data.zonecode; //5자리 새우편번호 사용
			 * document.getElementById('signUpUserCompanyAddress').value =
			 * fullRoadAddr;
			 * document.getElementById('signUpUserCompanyAddressDetail').value =
			 * data.jibunAddress;
			 */
		}
	}).open();
}

var check = false;
var array = new Array(6).fill(false);
/*
 * $("#user_id").blur(function(){ if ($('#user_id').val() == "") {
 * $('#id_check').text('아이디를 입력해주세요'); $('#id_check').css('color', 'red');
 * array[0] = false; } }) $("#user_id").keyup(function() { // id = "id_reg" /
 * name = "userId" var user_id = $('#user_id').val(); $.ajax({ url :
 * 'idcheck.do?id='+user_id, type : 'get', success : function(data) { var idJ =
 * /^[A-Za-z0-9]{6,12}$/; var idJ2 = /[A-Za-z0-9]/ var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 * var hangle2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{6,12}$/;
 * 
 * if (data == 1) { // 1 : 아이디가 중복되는 문구 $("#id_check").text("사용중인 아이디입니다");
 * $("#id_check").css("color", "red"); array[0] = false; } else {
 * 
 * if(idJ.test(user_id) && !hangle.test(user_id)){ // 0 : 아이디 길이 / 문자열 검사
 * $("#id_check").text("사용가능한 아이디입니다"); $('#id_check').css('color', 'blue'); //
 * $("#reg_submit").prop("disabled", false); array[0] = true;
 * 
 *  } else if(user_id == ""){
 * 
 * $('#id_check').text('아이디를 입력해주세요'); $('#id_check').css('color', 'red');
 * array[0] = false; } else if((hangle.test(user_id) && hangle2.test(user_id)) ||
 * (idJ.test(user_id)) || ((user_id.search(idJ2) >=0 && user_id.search(hangle)
 * >=0)) && user_id.length >= 6) { $('#id_check').text("아이디는 영문 숫자만 가능합니다.");
 * $('#id_check').css('color', 'red'); array[0] = false; } else {
 * $('#id_check').text("아이디는 6~12자 이내로 입력해주세요."); $('#id_check').css('color',
 * 'red'); array[0] = false; } } var odd = function(element) { return (element ==
 * false); }; if (array.some(odd) == true) { check = false; } else { check =
 * true; }
 * 
 * 
 * 
 * 
 * if (check) { $("#reg_submit").prop("disabled", false); } else {
 * $("#reg_submit").prop("disabled", true); } }, error : function() {
 * console.log("실패"); } });
 * 
 * 
 * });
 */

var reg1 = /^[a-z0-9]{8,20}$/;
var reg2 = /[a-z]/g;
var reg3 = /[0-9]/g;

var num = /[0-9]/g;
var eng = /[a-z]/ig;
var spe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;
var blank = /₩s/;



/*
 * $("#mypw1").blur(function(){ var user_pw1 = $("#mypw1").val().trim(); var
 * user_pw2 = $("#mypw2").val().trim(); if (user_pw1 == "") {
 * $("#pw_check1").text("비밀번호를 입력해주세요."); $('#pw_check1').css('color', 'red');
 * array[1] = false; } else if (reg1.test(user_pw1) == false) {
 * $("#pw_check1").text("비밀번호 8~20자 이내로 입력해주세요."); $('#pw_check1').css('color',
 * 'red'); array[1] = false; } else if (user_pw1.search(reg2) < 0 ||
 * user_pw1.search(reg3) < 0) { $("#pw_check1").text("숫자와 영문을 조합해주세요.");
 * $('#pw_check1').css('color', 'red'); array[1] = false; } else {
 * $("#pw_check1").text(""); array[1] = true; }
 * 
 * if((user_pw1 != user_pw2) && user_pw2 != "") { $("#pw_check2").text("비밀번호가
 * 일치하지 않습니다."); $('#pw_check2').css('color', 'red'); array[2] = false; } else
 * if ((user_pw1 == user_pw2) && user_pw2 != "") { $("#pw_check2").text("");
 * array[1] = true; }
 *  })
 * 
 * $("#mypw2").blur(function(){ var user_pw1 = $("#mypw1").val().trim(); var
 * user_pw2 = $("#mypw2").val().trim(); if (array[1] == true) { if (user_pw2 ==
 * "") { $("#pw_check2").text("비밀번호 재확인을 입력해주세요."); $('#pw_check2').css('color',
 * 'red'); array[2] = false; } else if(user_pw1 != user_pw2) {
 * $("#pw_check2").text("비밀번호가 일치하지 않습니다."); $('#pw_check2').css('color',
 * 'red'); array[2] = false; } else { $("#pw_check2").text(""); array[2] = true; } } })
 * 
 */
var phoneJ = /(^01([0|1|6|7|8|9]))([0-9]{3,4})([0-9]{4})$/;
/*
 * $("#myph").blur(function(){ var myph = $("#myph").val().trim();
 * console.log(myph); if (myph == "") { $("#myph_check").text("핸드폰 번호를
 * 입력해주세요."); $("#myph_check").css("color","red"); array[3] = false; } else if
 * (phoneJ.test(myph) == false) { $("#myph_check").text("핸드폰 번호를 정확히 입력해주세요");
 * $("#myph_check").css("color","red"); array[3] = false; } else {
 * $("#myph_check").text(""); array[3] = true; } })
 */

var mailJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
/*
 * $("#email").blur(function(){ var email = $("#email").val().trim();
 * console.log(email); if (email == "") { $("#email_check").text("이메일을
 * 입력해주세요."); $("#email_check").css("color", "red"); array[5] = false; } else if
 * (mailJ.test(email) == false) { $("#email_check").text("이메일을 정확히 입력해주세요.");
 * $("#email_check").css("color", "red"); array[5] = false; } else {
 * $("#email_check").text(""); array[5] = true; } })
 */

/*
 * $("#email").blur(function(){ if ($('#email').val() == "") {
 * $('#email_check').text('이메일을 입력해주세요'); $('#email_check').css('color', 'red');
 * array[5] = false; } }) $("#email").blur(function() { // id = "id_reg" / name =
 * "userId" var user_email = $('#email').val().trim(); $.ajax({ url :
 * 'emailcheck.do?email='+user_email, type : 'get', success : function(data) {
 * var mailJ =
 * /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 * 
 * if (data == 1) { // 1 : 아이디가 중복되는 문구 $("#email_check").text("사용중인 이메일입니다.");
 * $("#email_check").css("color", "red"); array[5] = false; } else {
 * 
 * if(mailJ.test(user_email)){ // 0 : 아이디 길이 / 문자열 검사
 * $("#email_check").text("사용가능한 이메일입니다."); $('#email_check').css('color',
 * 'blue'); // $("#reg_submit").prop("disabled", false); array[5] = true;
 * 
 *  } else if(user_email == ""){
 * 
 * $('#email_check').text('이메일을 입력해주세요.'); $('#email_check').css('color',
 * 'red'); array[5] = false; } else { $('#email_check').text("정확한 이메일을
 * 입력해주세요."); $('#email_check').css('color', 'red'); array[5] = false; }
 *  } var odd = function(element) { return (element == false); }; if
 * (array.some(odd) == true) { check = false; } else { check = true; }
 * 
 * 
 * 
 * 
 * if (check) { $("#reg_submit").prop("disabled", false); } else {
 * $("#reg_submit").prop("disabled", true); } }, error : function() {
 * console.log("실패"); } });
 * 
 * 
 * });
 */

$("input").blur(function() {
	var odd = function(element) {
		return (element == false);
	};
	if (array.some(odd) == true) {
		check = false;
	} else {
		check = true;
	}

	if (check) {
		//$("#reg_submit").prop("disabled", false);
	} else {
		//$("#reg_submit").prop("disabled", true);
	}
})

if ($("#email").val() != "") {
	$.ajax({
				url : 'emailcheck.do?email=' + user_email,
				type : 'get',
				success : function(data) {
					var user_email = $("#email").val();
					var mailJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#email_check").text("사용중인 이메일입니다.");
						$("#email_check").css("color", "red");
						array[5] = false;
					} else {

						if (mailJ.test(user_email)) {
							// 0 : 아이디 길이 / 문자열 검사
							$("#email_check").text("사용가능한 이메일입니다.");
							$('#email_check').css('color', 'blue');
							// $("#reg_submit").prop("disabled", false);
							array[5] = true;

						} else if (user_email == "") {

							$('#email_check').text('이메일을 입력해주세요.');
							$('#email_check').css('color', 'red');
							array[5] = false;
						} else {
							$('#email_check').text("정확한 이메일을 입력해주세요.");
							$('#email_check').css('color', 'red');
							array[5] = false;
						}

					}
					var odd = function(element) {
						return (element == false);
					};
					if (array.some(odd) == true) {
						check = false;
					} else {
						check = true;
					}

					if (check) {
						//$("#reg_submit").prop("disabled", false);
					} else {
						//$("#reg_submit").prop("disabled", true);
					}
				},
				error : function() {
					console.log("실패");
				}
			});

}

// 아이디 체크
var id = function() {
	if ($('#user_id').val() == "") {
		$('#id_check').text('아이디를 입력해주세요');
		$('#id_check').css('color', 'red');
		array[0] = false;
	}
	var user_id = $('#user_id').val();
	$.ajax({
		url : 'idcheck.do?id=' + user_id,
		type : 'get',
		success : function(data) {
			var idJ = /^[A-Za-z0-9]{6,12}$/;
			var idJ2 = /[A-Za-z0-9]/
			var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var hangle2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{6,12}$/;

			if (data == 1) {
				// 1 : 아이디가 중복되는 문구
				$("#id_check").text("사용중인 아이디입니다");
				$("#id_check").css("color", "red");
				array[0] = false;
			} else {

				if (idJ.test(user_id) && !hangle.test(user_id)) {
					// 0 : 아이디 길이 / 문자열 검사
					$("#id_check").text("사용가능한 아이디입니다");
					$('#id_check').css('color', 'blue');
					// $("#reg_submit").prop("disabled", false);
					array[0] = true;
				} else if (user_id == "") {

					$('#id_check').text('아이디를 입력해주세요');
					$('#id_check').css('color', 'red');
					array[0] = false;
				} else if ((hangle.test(user_id) && hangle2.test(user_id))
						|| (idJ.test(user_id))
						|| ((user_id.search(idJ2) >= 0 && user_id
								.search(hangle) >= 0)) && user_id.length >= 6) {
					$('#id_check').text("아이디는 영문 숫자만 가능합니다.");
					$('#id_check').css('color', 'red');
					array[0] = false;
				} else {
					$('#id_check').text("아이디는 6~12자 이내로 입력해주세요.");
					$('#id_check').css('color', 'red');
					array[0] = false;
				}
			}
			var odd = function(element) {
				return (element == false);
			};
			if (array.some(odd) == true) {
				check = false;
			} else {
				check = true;
			}

			if (check) {
				//$("#reg_submit").prop("disabled", false);
			} else {
				//$("#reg_submit").prop("disabled", true);
			}

		},
		error : function() {
			console.log("실패");
		}
	});
	return array[0];
}
var user_pw1 = $("#mypw1").val();
var user_pw2 = $("#mypw2").val();
// 비밀번호 체크
var pw = function() {
	var real = false;
	var user_pw1 = $("#mypw1").val().trim();
	var user_pw2 = $("#mypw2").val().trim();
	if (user_pw1 == "") {
		$("#pw_check1").text("비밀번호를 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		array[1] = false;
	} else if (user_pw1.length < 8 || user_pw1.length > 20) {
		$("#pw_check1").text("비밀번호 8~20자 이내로 입력해주세요.");
		$("#pw_check2").text("");
		$('#pw_check1').css('color', 'red');
		array[1] = false;
		return real;
	} else if ((user_pw1.search(num) < 0 && user_pw1.search(eng) < 0) || (user_pw1.search(eng) < 0 && user_pw1.search(spe) < 0) || (user_pw1.search(spe) < 0 && (user_pw1.search(num) < 0))) {
		$("#pw_check1").text("영문, 숫자, 특수문자 중 2가지 이상 혼합하여 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		$("#pw_check2").text("");
		array[1] = false;
		console.log("비번"+array[1]);
		console.log("비번체크"+array[2]);
		console.log("비번리얼"+real);
		return real;
	} else {
		$("#pw_check1").text("");
		array[1] = true;
		real = true;
	}

	if ((user_pw1 != user_pw2) && user_pw2 != "") {
		$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
		$('#pw_check2').css('color', 'red');
		array[2] = false;
	} else if ((user_pw1 == user_pw2) && user_pw1 != "") {
		$("#pw_check2").text("");
		array[2] = true;
		//real = true;
	}
	console.log("비번"+array[1]);
	console.log("비번체크"+array[2]);
	console.log("비번리얼"+real);
	return real;
}

// 비밀번호 확인 체크
var pwchk = function() {
	var real = false;
	var user_pw1 = $("#mypw1").val().trim();
	var user_pw2 = $("#mypw2").val().trim();
	if (array[1] == true) {
		if (user_pw2 == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if ((user_pw1 != user_pw2) && user_pw1 == "") {
			$("#pw_check2").text("");
			array[2] = false;
		} else if (user_pw1.length < 8) {
			$("#pw_check2").text("");
			array[2] = false
		} else if (user_pw1 != user_pw2) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (user_pw1 == ""){
			$("#pw_check2").text("");
			array[2] = false;
		} else {
			$("#pw_check2").text("");
			array[2] = true;
			real = true;
		}
	} else {
		if (user_pw2 == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if ((user_pw1 != user_pw2) && user_pw1 == "") {
			$("#pw_check2").text("");
			array[2] = false;
		} else if (user_pw1.length < 8) {
			$("#pw_check2").text("");
			array[2] = false
		} else if (user_pw1 != user_pw2) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (user_pw1 == ""){
			$("#pw_check2").text("");
			array[2] = false;
		} else {
			$("#pw_check2").text("");
			array[2] = true;
			real = true;
		}
		
	}
	console.log("비번체크"+array[2]);
	console.log("비번체크리얼"+real);
	console.log("비번"+array[1]);
	return real;
}

// 핸드폰번호 체크
var phone = function() {
	var real = false;
	var myph = $("#myph").val().trim();
	console.log(myph);
	if (myph == "") {
		$("#myph_check").text("핸드폰 번호를 입력해주세요.");
		$("#myph_check").css("color", "red");
		array[3] = false;
	} else if (phoneJ.test(myph) == false) {
		$("#myph_check").text("핸드폰 번호를 정확히 입력해주세요");
		$("#myph_check").css("color", "red");
		array[3] = false;
	} else {
		$("#myph_check").text("");
		array[3] = true;
		real = true;
	}
	return real;
}

// 이메일 체크
var email = function() {
	if ($('#email').val() == "") {
		$('#email_check').text('이메일을 입력해주세요');
		$('#email_check').css('color', 'red');
		array[5] = false;
	}

	var user_email = $('#email').val().trim();
	$
			.ajax({
				url : 'emailcheck.do?email=' + user_email,
				type : 'get',
				success : function(data) {
					var mailJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#email_check").text("사용중인 이메일입니다.");
						$("#email_check").css("color", "red");
						array[5] = false;
					} else {

						if (mailJ.test(user_email)) {
							// 0 : 아이디 길이 / 문자열 검사
							$("#email_check").text("사용가능한 이메일입니다.");
							$('#email_check').css('color', 'blue');
							// $("#reg_submit").prop("disabled", false);
							array[5] = true;
						} else if (user_email == "") {

							$('#email_check').text('이메일을 입력해주세요.');
							$('#email_check').css('color', 'red');
							array[5] = false;
						} else {
							$('#email_check').text("정확한 이메일을 입력해주세요.");
							$('#email_check').css('color', 'red');
							array[5] = false;
						}

					}
					var odd = function(element) {
						return (element == false);
					};
					if (array.some(odd) == true) {
						check = false;
					} else {
						check = true;
					}

					if (check) {
						//$("#reg_submit").prop("disabled", false);
					} else {
						//$("#reg_submit").prop("disabled", true);
					}
				},
				error : function() {
					console.log("실패");
				}
			});
	return array[5];
}

var addr = function() {
	if ($("#roadFullAddr1").val() == "" ||
			$("#roadFullAddr2").val() == "" ) {
		array[4] = false;
	} else {
		array[4] = true;
	}
}

$("#reg_submit").click(function() {
	id();
	pw();
	pwchk();
	phone();
	email();
	addr();
	if (!id()) {
		$("#user_id").focus();
		return false;
	} else if (!pw()) {
		$("#mypw1").focus();
		return false;
	} else if (!pwchk()) {
		$("#mypw2").focus();
		return false;
	} else if (!phone()) {
		$("#myph").focus();
		return false;
	} else if (!email()){
		$("#email").focus();
		return false;
	} else if ($("#roadFullAddr1").val() == "" || $("#roadFullAddr2").val() ==""){
		$("#addr_check").text("주소 검색을 해주세요.");
		$("#addr_check").css("color","red");
		$("#addrsearch").focus();
		return false;
	} else {
		$("#roadFullAddr1").prop("disabled",false);
		$("#roadFullAddr2").prop("disabled",false);
		return true;
	}
})


var blank_del = function() {
	var user_pw1 = $("#mypw1");
	user_pw1.val(user_pw1.val().replace(/(\s*)/g,""));
}

var blank_del2 = function() {
	var user_pw2 = $("#mypw2");
	user_pw2.val(user_pw2.val().replace(/(\s*)/g,""));
}
$("#user_id").blur(function(){
	var user_id = $("#user_id");
	user_id.val(user_id.val().replace(/(\s*)/g,""));
	id();
	addr();
})
$("#user_id").keyup(function() {
	var user_id = $("#user_id");
	user_id.val(user_id.val().replace(/(\s*)/g,""));
	id();
	addr();
})
$("#mypw1").blur(function() {
	blank_del();
	pw();
	addr();
})
$("#mypw2").blur(function() {
	blank_del2();
	pwchk();
	addr();
})
$("#myph").blur(function() {
	var user_ph = $("#myph");
	user_ph.val(user_ph.val().replace(/(\s*)/g,""));
	phone();
	addr();
})
$("#email").keyup(function() {
	var user_email = $("#email");
	user_email.val(user_email.val().replace(/(\s*)/g,""));
	email();
	addr();
})

$("#email").blur(function() {
	var user_email = $("#email");
	user_email.val(user_email.val().replace(/(\s*)/g,""));
	email();
	addr();
})
