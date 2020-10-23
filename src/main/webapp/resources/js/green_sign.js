function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);

			$("#roadFullAddr1").val(data.zonecode);
			$("#roadFullAddr2").val(fullRoadAddr);
			
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

var user_email = $("#email").val();
if (user_email != "") {
	$.ajax({
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

// 비밀번호 체크
var pw = function() {
	var real = false;
	var user_pw1 = $("#mypw1").val().trim();
	var user_pw2 = $("#mypw2").val().trim();
	if (user_pw1 == "") {
		$("#pw_check1").text("비밀번호를 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		array[1] = false;
	} else if (reg1.test(user_pw1) == false) {
		$("#pw_check1").text("비밀번호 8~20자 이내로 입력해주세요.");
		$('#pw_check1').css('color', 'red');
		array[1] = false;
	} else if (user_pw1.search(reg2) < 0 || user_pw1.search(reg3) < 0) {
		$("#pw_check1").text("숫자와 영문을 조합해주세요.");
		$('#pw_check1').css('color', 'red');
		array[1] = false;
	} else {
		$("#pw_check1").text("");
		array[1] = true;
		real = true;
	}

	if ((user_pw1 != user_pw2) && user_pw2 != "") {
		$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
		$('#pw_check2').css('color', 'red');
		array[2] = false;
	} else if (((user_pw1.search(reg2) < 0 || user_pw1.search(reg3) < 0) || (user_pw2.search(reg2) < 0 || user_pw2.search(reg3) < 0)) && (user_pw1 == user_pw2)) {
		$("#pw_check2").text("");
		array[2] = false;
	} else if ((user_pw1 == user_pw2) && user_pw1 != "") {
		$("#pw_check2").text("");
		array[1] = true;
		real = true;
	}
	return real;
}

// 비밀번호 확인 체크
var pwchk = function() {
	var real = false;
	var user_pw1 = $("#mypw1").val().trim();
	var user_pw2 = $("#mypw2").val().trim();
	console.log(user_pw1 + " " + user_pw2);
	if (array[1] == true) {
		if (user_pw2 == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (user_pw1 != user_pw2) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (((user_pw1.search(reg2) < 0 || user_pw1.search(reg3) < 0) || (user_pw2.search(reg2) < 0 || user_pw2.search(reg3) < 0)) && (user_pw1 == user_pw2)) {
			$("#pw_check2").text("");
			array[2] = false;
		} else if ((user_pw1 == user_pw2) && user_pw1 != "") {
			$("#pw_check2").text("");
			array[2] = true;
			real = true;
		}
	} else {
		if (user_pw2 == "") {
			$("#pw_check2").text("비밀번호 재확인을 입력해주세요.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (user_pw1 != user_pw2) {
			$("#pw_check2").text("비밀번호가 일치하지 않습니다.");
			$('#pw_check2').css('color', 'red');
			array[2] = false;
		} else if (((user_pw1.search(reg2) < 0 || user_pw1.search(reg3) < 0) || (user_pw2.search(reg2) < 0 || user_pw2.search(reg3) < 0)) && (user_pw1 == user_pw2)) {
			$("#pw_check2").text("");
			array[2] = false;
		} else if ((user_pw1 == user_pw2) && user_pw1 != "") {
			$("#pw_check2").text("");
			array[2] = true;
			real = true;
		}
		
	}
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
$("#user_id").blur(function(){
	id();
	addr();
})
$("#user_id").keyup(function() {
	id();
	addr();
})
$("#mypw1").blur(function() {
	pw();
	addr();
})
$("#mypw2").blur(function() {
	pwchk();
	addr();
})
$("#myph").blur(function() {
	phone();
	addr();
})
$("#email").keyup(function() {
	email();
	addr();
})

$("#email").blur(function() {
	email();
	addr();
})
