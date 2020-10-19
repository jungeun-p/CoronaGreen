<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGIST</title>

<link href="resources/css/green_sign.css" rel="stylesheet" type="text/css"/>

</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>

    <section class="regist">
    	<div class="reg_border">
			<input type="hidden" name="command" value="registres"/>			
			<h3>SIGN</h3>
			
			<div class="divID">
			    <div class="ID_1 ID_common" id="id_t">ID</div>
			    <div class="ID_2 ID_common"><input type="text" name="ID" id="myid" placeholder="아이디를 입력하세요." required="required" title="n" /></div>
			    <div class="ID_3 ID_common"><input type="button" value="중복체크" id="idchk" onclick="idCheck();"/></div>
			</div>
			
			<div class="divPW">
				<div class="PW_1 PW_common" id="pw_t">PW</div>
				<div class="PW_2 PW_common">
					<input type="password" name="PW" id="mypw1" class="pw" placeholder="비밀번호를 입력하세요." required="required" />
					<br><span id="pw_text">8~15자리의 영문,숫자,특수문자의 입력이 가능합니다.</span><br>
					<input type="password" name="PW" id="mypw2" class="pw" placeholder="비밀번호를 확인하세요." required="required" />
	    			<font id="Notice" size="2"></font>
				</div>
			</div>
			
			<div class="divNAME">
				<div class="NAME_1 NAME_common" id="name_t">NAME</div>
				<div class="NAME_2 NAME_common">
					<input type="text" name="NAME" id="myname" placeholder="이름을 입력하세요." required="required" />
				</div>
			</div>
			
			<div class="divADDR">
				<div class="ADDR_1 ADDR_common" id="addr_t">ADDRESS</div>
				<div class="ADDR_2 ADDR_common">
					<input type="text" name="ADDRESS" id="roadFullAddr" class="form-control" placeholder="주소를 검색하세요." required="required" disabled/>
				</div>
				<div class="ADDR_3 ADDR_common">
					<button type="button" class="" id="addrsearch" onclick="">주소검색</button>
				</div>
			</div>
			
			<div class="divPHONE">
				<div class="PHONE_1 PHONE_common" id="phone_t">P.H</div>
				<div class="PHONE_2 PHONE_common">
					<input type="text" name="PHONE" id="myph" placeholder="전화번호를 '-'없이 입력하세요." required="required" />
				</div>
			</div>
			
			<div class="divEMAIL">
				<div class="EMAIL_1 EMAIL_common" id="email_t">EMAIL</div>
				<div class="EMAIL_2 EMAIL_common">
					<input type="email" name="EMAIL" id="email"  placeholder="이메일을 입력하세요."/><br>
					<input type="text" name="EMAIL_VALID" id="email_valid" placeholder="인증코드">
				</div>
				<div class="EMAIL_3 EMAIL_common">
					<input id="receiver" type="button" value="인증번호발송" onclick="">
				</div>
			</div>

			<div class="div_Button">
			    <div class="Button_1 Donation_Button"><input type="button" value="회원가입" id="button_t" onclick=""/></div>
			</div>
		</div>
    </section>
    
    <%@ include file="/WEB-INF/views/footer.jsp" %>
	

</body>
</html>