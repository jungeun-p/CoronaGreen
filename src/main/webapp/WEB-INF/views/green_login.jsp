<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

<link href="resources/css/green_login.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="resources/js/green_login.js" defer></script>
</head>
<script type="text/javascript">
	history.pushState(null, null, "main.do");

	window.onpopstate = function(event) {
		history.go(1);
	}
</script>
<body>
	<%
		
	%>
	<%@ include file="/WEB-INF/views/header_main.jsp"%>
	<form action="login.do" method="post" onsubmit="return check()">
		<input type="hidden" value="normal" name="code" />
		<section class="login__form">
			<div class="login__box" style="background-image: URL(./resources/img/color.jpg);">
				<p class="login__title">LOGIN</p>
				<div class="login__id">
					<p class="login__id__title">&nbsp;ID</p>
					<input id="id" class="login_text_id" name="id" type="text"
						required="required" />
				</div>
				<div class="login__pw">
					<p class="login__pw__title">PW</p>
					<input id="pw" class="login_text_pw" name="pw" type="password"
						required="required" />
				</div>

				<div class="login__select">
					<input id="login" class="login__select__button" type="submit"
						value="LOGIN" /> <input class="login__select__button"
						type="button" value="REGIST" onclick="location.href='regist.do'" />
				</div>
				<div class="login__sns">
					<div class="naver__id__login">
						<a href="${url}"> <img src="./resources/img/naver-icon.png" />
						</a>
					</div>
					<div class="kakao__id__login">
						<a id="kakaologin"> <img src="./resources/img/kakao-icon.png" />
						</a>
					</div>
				</div>
				<div class="login_find">
					<a class="find__idpw" href="find.do">
						<p class="login__find__title">FIND ID & PW</p>
					</a>
				</div>
			</div>
		</section>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>