<%@page import="com.corona.green.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- menubar css -->
<link href="resources/css/header_login.css" rel="stylesheet"
	type="text/css" />
<!-- menubar js -->
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">

<!-- notification -->
<script src="resources/js/green_notification.js"></script>
<script src="resources/js/green_socket.js"></script>



</head>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>
	<!--header_1-->
	<nav class="menubar">
		<div class="menubar__menu">
			<div class="menubar__category">
				<a href="main.do">
					<p class="category__name__logo">CORONA GREEN</p>
				</a>
			</div>
			<div class="menubar__category">
				<a href="greenabout.do"><p class="category__name">ABOUT</p></a> <a
					href="news.do"><p class="category__name">NEWS</p></a> <a
					href="policylist.do"><p class="category__name">POLICY</p></a> <a
					href="qnalist.do"><p class="category__name">QnA</p></a>
			</div>
			<div class="menubar__user__menu">
				<%
					if (dto == null) {
				%>
				<p class="menubar__sign">SIGN IN</p>
			</div>
		</div>
		<div class="logo">
			<a href="main.do">
				<p class="menubar__logo">CORONA GREEN</p>
				<p class="menubar__title">ALL ABOUT INFORMATION OF COVID 19</p>
				<p class="menubar__title">Provides information that is updated
					in real-time updates.</p>
			</a>
		</div>
	</nav>
	<div class="background"
		style="background-image: URL(./resources/img/corona-green-logo.png);"></div>
	<%
		} else {
	%>
	<p class="menubar__sign"><%=dto.getId()%></p>
	<!--user menu-->
	<!--login:visible-->
	<%
		if (dto.getRole().equals("USER")) {
	%>
	<nav class="menubar__user">
		<div class="user__category">
			<!-- 현모 마이페이지 부분 -->
			<p class="category"></p> 
			<p class="category"></p>
		</div>
	</nav>
	<%
		} else {
	%>
	<nav class="menubar__admin">
		<div class="user__category">
			<!-- 현모 마이페이지 부분 -->
			<p class="category"></p>
			<p class="category"></p>
		</div>
	</nav>
	<%
		}
	%>
	</div>
	</div>
	<div class="logo">
		<a href="main.do">
			<p class="menubar__logo">CORONA GREEN</p>
			<p class="menubar__title">ALL ABOUT INFORMATION OF COVID 19</p>
			<p class="menubar__title">Provides information that is updated in
				real-time updates.</p>
		</a>
	</div>
	</nav>
	<div class="background"
		style="background-image: URL(./resources/img/corona-green-logo.png);"></div>
	<%
		}
	%>
	<!--chat-->
	<section class="chatbot">
		<a href="http://pf.kakao.com/_lxiWGK/chat" target="_blank">
			<div class="chatbot__box">
				<p class="chat__title">🙋‍♀ ASK</p>
			</div>
		</a>
	</section>
	<!-- donation -->
	<section class="donation">
		<div class="donation__box" onclick="donation();">
			<p class="dona__title">💰 DONATION</p>
		</div>
	</section>
</body>
</html>