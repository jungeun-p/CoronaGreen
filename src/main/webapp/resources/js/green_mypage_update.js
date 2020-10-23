

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