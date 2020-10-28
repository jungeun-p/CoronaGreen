function payment() {
	var IMP = window.IMP;
	IMP.init("imp74386888");

	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param

		pg : "html5_inicis",
		pay_method : "card",
		merchant_uid : "merchant-" + new Date().getTime(),
		name : '[CoronaGreen] 후원',
		amount : $("#mywon").val(),
		buyer_email : $("#email").val(),
		buyer_name : $("#id").val(),
		buyer_tel : $("#phone").val(),
		buyer_addr : $("#addr").val(),
		buyer_postcode : '123-456',
	}, function(rsp) { // callback
		if (rsp.success) {
			// jQuery로 HTTP 요청
			jQuery.ajax({
				url : "https://www.myservice.com/payments/complete", // 가맹점
																		// 서버
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : {
					imp_uid : rsp.imp_uid,
					merchant_uid : rsp.merchant_uid
				}
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직

				location.href = "donationres.do?id=" + $("#id").val() + "&won=" + $("#mywon").val();
			})
			location.href = "donationres.do?id=" + $("#id").val() + "&won=" + $("#mywon").val();

			// 결제 성공하고나서 controller가서 후원 목록에 인서트해주고 main으로 간다. (영석 파이널)
		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			self.close();
		}
	});
}


$("#mywon").keyup(function() {
	$("#mywon").val($("#mywon").val().replace(/(^0+)/, ""));
	donation();
	/*
	 * if (user_won.length == 1 && user_won == "0") { $("#mywon").val(""); }
	 */

})

var donation = function() {
	var won = /^[0-9]*$/;
	var user_won = $("#mywon").val();
	if (user_won == "") {
		$("#donation_check").text("값을 입력해주세요.");
		$("#donation_check").css("color", "red");
		$("#button_t").prop("disabled", true);
	} else if (user_won.length < 4 || user_won.length > 6) {
		$("#donation_check").text("최소 금액은 1,000원부터 최대금액은 999,999원 입니다.");
		$("#donation_check").css("color", "red");
		$("#button_t").prop("disabled", true);
	} else if (won.test(user_won) == false) {
		$("#donation_check").text("숫자만 입력 가능합니다.");
		$("#donation_check").css("color", "red");
		$("#button_t").prop("disabled", true);
	} else {
		$("#donation_check").text("");
		$("#button_t").prop("disabled", false);
	}
}