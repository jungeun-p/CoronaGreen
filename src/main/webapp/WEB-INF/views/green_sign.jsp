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
<form id="registform" action="registres.do" method="post">
	<section class="regist">
		<div class="reg_border">
			<h3>SIGN</h3>
			<div class="divID">
				<div class="ID_1 ID_common" id="id_t">ID</div>
				<div class="ID_2 ID_common">
					<input type="text" name="id" class="myid" id="user_id" placeholder="아이디를 입력하세요."
						required="required" title="n" class="check__1"/>
				</div>
				<div class="check_font" id="id_check"></div>
			</div>

			<div class="divPW">
				<div class="PW_1 PW_common" id="pw_t">PW</div>
				<div class="PW_2 PW_common">
					<input type="password" name="pw" id="mypw1" class="pw"
						placeholder="비밀번호를 입력하세요." required="required" class="check__1"/> <br> <span
						id="pw_text">8~15자리의 영문,숫자,특수문자의 입력이 가능합니다.</span><br> 
						
						<div class="check_font" id="pw_check1"></div>
						
						<input type="password" id="mypw2" class="pw"
						placeholder="비밀번호를 확인하세요." required="required" class="check__1"/> <font
						id="Notice" size="2"></font>
						
						<div class="check_font" id="pw_check2"></div>
				</div>
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
						 if (session.getAttribute("naveremail") != null) {
					%>
					<input type="email" name="email" id="email"
						placeholder="이메일을 입력하세요." value="${naveremail }" class="check__1"/><br>
					<%
						} else if (session.getAttribute("kakaoemail") != null) {
					%>
					<input type="email" name="email" id="email"
						placeholder="이메일을 입력하세요." value="${kakaoemail }" class="check__1"/><br>
					<%
						} else {
					%>
					<input type="email" name="email" id="email"
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
				<div class="Button_1 Donation_Button">
					<input type="submit" value="회원가입" id="reg_submit" class="button_t" disabled="disabled"/>
				</div>
			</div>
		</div>
	</section>
</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>


</body>
</html>