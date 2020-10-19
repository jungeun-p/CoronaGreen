<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/green_login.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	<form class="login_wrap" action="login.do" method="post">
		<div class="login_box">
		
			<div class="login_title login">LOGIN</div>
			
			<div class="login_id login">
				<div class="login_id_title">&nbsp;ID</div>
				<div class="login_id_input">
					<input class="login_text_id" name="id" type="text"/>
				</div>
			</div>
			
			<div class="login_pw login">
				<div class="login_pw_title">PW</div>
				<div class="login_pw_input">
					<input class="login_text_pw" name="pw" type="text"/>
				</div>
			</div>
			
			<div class="login_select login">
				<div class="login_select_submit">
					<input class="login_select_button" type="submit" value="LOGIN"/>
				</div>
				<div class="login_select_regist">
					<input class="login_select_button" type="button" value="SIGN" onclick=""/>
				</div>
			</div>
			
			<div class="login_sns login">
				<div class="login_sns_naver sns_button">
					<img src="./resources/img/naver-icon.png"/>
					<span>NAVER LOGIN</span>
				</div>
				<div class="login_sns_kakao sns_button">
					<img src="./resources/img/kakao-icon.png"/>
					<span>KAKAO LOGIN</span>
				</div>
			</div>
			
			<div class="login_find login">
				<div class="login_find_IDPW">FIND ID & PW</div>
			</div>
			
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>