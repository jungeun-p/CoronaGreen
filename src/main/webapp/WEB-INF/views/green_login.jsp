<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/green_login.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript">
	/* history.pushState(null, null, "main.do");
	
	window.onpopstate = function(event) {
		history.go(1);
	} */
</script>
<body>
<%
	
%>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<form class="login_wrap" action="login.do" method="post">
		<div class="login_box">
		
			<div class="login_title login">LOGIN</div>
			
			<div class="login_id login">
				<div class="login_id_title">&nbsp;ID</div>
				<div class="login_id_input">
					<input class="login_text_id" name="id" type="text" required="required"/>
				</div>
			</div>
			
			<div class="login_pw login">
				<div class="login_pw_title">PW</div>
				<div class="login_pw_input">
					<input class="login_text_pw" name="pw" type="text" required="required"/>
				</div>
			</div>
			
			<div class="login_select login">
				<div class="login_select_submit">
					<input class="login_select_button" type="submit" value="LOGIN"/>
				</div>
				<div class="login_select_regist">
					<input class="login_select_button" type="button" value="REGIST" onclick="location.href='regist.do'"/>
				</div>
			</div>
			
			<div class="login_sns login">
				<div id="naver_id_login" class="login_sns_naver sns_button">
					<a href="${url}">
					<img src="./resources/img/naver-icon.png"/>
					<span>NAVER LOGIN</span>
					</a>
				</div>
				<div class="login_sns_kakao sns_button">
					<a href="kakaoregist.do">
					<img src="./resources/img/kakao-icon.png"/>
					<span>KAKAO LOGIN</span>
					</a>
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