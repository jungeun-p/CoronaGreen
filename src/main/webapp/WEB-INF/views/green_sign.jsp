<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGIST</title>

<link href="resources/css/green_sign.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/green_sign.js" defer></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form class="wrap" id="registform" action="registres.do" method="post">
		<div class="wrap__regist">
			<div class="regist__title">SIGN</div>
			<div class="regist__id">
				<div class="regist__id__title" id="id_t">ID</div>
				<div class="regist__id__input">
					<input type="text" name="id" class="regist__id__text check__1" id="user_id" placeholder="아이디는 영문, 숫자(8~20자)만 가능합니다."/>
				</div>
			</div>
			<div class="check_font" id="id_check"></div>

			<div class="regist__pw">
				<div class="regist__pw__title" id="pw_t">PW</div>
				<div class="regist__pw__input">
					<input type="text" name="pw" id="mypw1" class="pw"
						placeholder="비밀번호를 입력하세요." required="required" class="check__1"/> 
						
				</div>
						<div class="check_font" id="pw_check1"></div>
						
						<input type="text" id="mypw2" class="pw"
						placeholder="비밀번호를 확인하세요." required="required" class="check__1"/> <font
						id="Notice" size="2"></font>
						
						<div class="check_font" id="pw_check2"></div>
			</div>

			<div class="divADDR">
				<div class="ADDR_1 ADDR_common" id="addr_t">ADDRESS</div>
				<div class="ADDR_2 ADDR_common">
					<input type="text" name="addr1" id="roadFullAddr1"
						class="form-control roadFullAddr"  required="required"
						disabled />
						<input type="text" name="addr2" id="roadFullAddr2"
						class="form-control roadFullAddr" required="required"
						disabled />
						<input type="text" name="addr3" id="roadFullAddr3"
						class="form-control roadFullAddr"/>
				</div>
				<div class="ADDR_3 ADDR_common">
					<input type="button" class="" id="addrsearch" onclick="execPostCode();" value="주소검색"/>
				</div>
				<div id="addr_check"></div>
			</div>

			<div class="divPHONE">
				<div class="PHONE_1 PHONE_common" id="phone_t">P.H</div>
				<div class="PHONE_2 PHONE_common">
					<input type="text" name="phone" id="myph"
						placeholder="전화번호를 '-'없이 입력하세요." required="required" class="check__1"/>
				</div>
				<div class="check_font" id="myph_check"></div>
			</div>

			<div class="divEMAIL">
				<div class="EMAIL_1 EMAIL_common" id="email_t">EMAIL</div>
				<div class="EMAIL_2 EMAIL_common">
					<%
						 if (request.getAttribute("naveremail") != null) {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일을 입력하세요." value="${naveremail }" class="check__1"/><br>
					<%
						} else if (request.getAttribute("kakaoemail") != null) {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일을 입력하세요." value="${kakaoemail }" class="check__1"/><br>
					<%
						} else {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일을 입력하세요." class="check__1"/><br>
					<%
						}
					%>
					<div class="check_font" id="email_check"></div>
					<!-- <input type="text" name="EMAIL_VALID" id="email_valid"
						placeholder="인증코드">
				</div>
				<div class="EMAIL_3 EMAIL_common">
					<input id="receiver" type="button" value="인증번호발송" onclick=""> -->
				</div>
			</div>

			<div class="div_Button">
			<span id="registcheck">
				<div class="Button_1 Donation_Button">
					<input type="submit" value="GOGO" id="reg_submit" class="button_t"/>
				</div>
				</span>
			</div>
		</div>
</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>


</body>
</html>