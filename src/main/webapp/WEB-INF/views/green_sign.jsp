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
			
			<div class="regist__id regist__all">
				<div class="regist__id__title" id="id_t">ID</div>
				<div class="regist__id__input regist__input">
					<input type="text" name="id" class="regist__id__text check__1" id="user_id" placeholder="아이디(6~12자)"/>
				</div>
			</div>
			<div class="check__font" id="id_check"></div>

			<div class="regist__pw regist__all">
				<div class="regist__pw__title" id="pw_t">PW</div>
				<div class="regist__pw__input regist__input">
					<input type="text" name="pw" id="mypw1" class="pw check__1""
						placeholder="비밀번호(숫자,영문,특수문자 2가지이상 조합 8~20자)" required="required"/> 
				</div>
			</div>
			<div class="check__font check__pw" id="pw_check1"></div>
				
			<div class="regist__pwchk regist__all">	
				<div class="regist__pwchk__input regist__input">		
						<input type="text" id="mypw2" class="pw__chk check__1"
						placeholder="비밀번호 확인" required="required"/> <font
						id="Notice" size="2"></font>
				</div>	
			</div>	
			<div class="check__font check__pwchk" id="pw_check2"></div>
		

			<div class="regist__addr regist__all">
				<div class="regist__addr__title" id="addr_t">ADDR</div>
				<div class="regist__addr__post">
					<input type="text" name="addr1" id="roadFullAddr1"
						class="check__1 post__input"  required="required"
						disabled />
				</div>
				<div class="regist__addr__button">
					<input type="button" class="regist__addr__search regist__button" id="addrsearch" onclick="execPostCode();" value="SEARCH"/>
				</div>
			</div>
			
			<div class="regist__addr__roadname regist__all regist__input">
						<input type="text" name="addr2" id="roadFullAddr2"
						class="check__1" required="required"
						disabled />
			</div>
			
			<div class="regist__addr__detail regist__all regist__input">
						<input type="text" name="addr3" id="roadFullAddr3"
						class="check__1"/>
			</div>
			<div class="check__font check__addr" id="addr_check"></div>
			

			<div class="regist__phone regist__all">
				<div class="regist__phone__title" id="phone_t">P.H</div>
				<div class="regist__phone__input regist__input">
					<input type="text" name="phone" id="myph"
						placeholder="전화번호(- 없이 입력)" class="check__1 regist__phone__text"/>
				</div>
				<div class="regist__phone__button">
					<input id="phone_code_send" type="button" class="regist__button" value="CONFIRM"/>
				</div>
			</div>
			<div class="check__font check__phone" id="myph_check"></div>
			
			<div class="regist__phone__cer regist__all">
				<div class="regist__phone__cer__title">CODE</div>
				<div class="regist__phone__cer__input regist__input">
					<input type="text" id="phonecode" class="check__1 regist__phone__cer__text"/>
				</div>
				<div class="regist__phone__cer__button">
					<input id="phone_code_check_button" type="button" class="regist__button" value="CONFIRM" disabled="disabled"/>
				</div>
			</div>
			<div class="check__font check__phone__code" id="phone_code_check"></div>

			<div class="regist_email regist__all">
				<div class="regist__email__title" id="email_t">EMAIL</div>
				<div class="regist__email__input regist__input">
					<%
						 if (request.getAttribute("naveremail") != null) {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일" value="${naveremail }" class="check__1"/><br>
					<%
						} else if (request.getAttribute("kakaoemail") != null) {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일" value="${kakaoemail }" class="check__1"/><br>
					<%
						} else {
					%>
					<input type="text" name="email" id="email"
						placeholder="이메일" class="check__1"/><br>
					<%
						}
					%>
					<!-- <input type="text" name="EMAIL_VALID" id="email_valid"
						placeholder="인증코드">
				</div>
				<div class="EMAIL_3 EMAIL_common">
					<input id="receiver" type="button" value="인증번호발송" onclick=""> -->
				</div>
			</div>
			<div class="check__font check__email" id="email_check"></div>

			<div class="regist__cofirm">
				<div class="regist__confirm__input">
					<input class="regist__confirm__button regist__button" type="submit" value="SIGN" id="reg_submit" class=""/>
				</div>
			</div>
		</div>
</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>


</body>
</html>