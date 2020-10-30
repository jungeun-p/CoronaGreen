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
<link href="resources/css/header.css" rel="stylesheet" type="text/css" />
<!-- menubar js -->
<script src="resources/js/header.js" defer></script>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700;900&display=swap"
	rel="stylesheet">
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
				<a href="#"><p class="category__name">ABOUT</p></a> <a
					href="news.do"><p class="category__name">NEWS</p></a> <a
					href="policylist.do"><p class="category__name">POLICY</p></a> <a
					href="qnalist.do"><p class="category__name">QnA</p></a>
			</div>
			<div class="menubar__user__menu">
				<%
					if (dto == null) {
				%>
				<a href="loginform.do"><p class="menubar__sign">SIGN IN</p></a>
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
	<a href="#"><p class="menubar__sign"><%=dto.getId()%></p></a>
	<!--user menu-->
	<!--login:visible-->
	<nav class="menubar__user">
		<div class="user__category">
			<!-- 현모 마이페이지 부분 -->
			<a href="mypage_update.do"><p class="category">MY PAGE</p></a> <a
				href="logout1.do"><p class="category">SIGN OUT</p></a>
		</div>
	</nav>
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
		<div class="chatbot__box">
			<p>🙋‍♀ ASK</p>
		</div>
	</section>
	<!-- donation -->
	<section class="donation">
		<div class="donation__box" onclick="donation();">
			<p>💰 DONATION</p>
		</div>
	</section>
</body>
</html>