<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_main.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%
		if(dto != null) {
	%>
	<script type="text/javascript">
	history.pushState(null, null, "main.do");
	
	window.onpopstate = function(event) {
		history.go(1);
	}
	</script>
	<%
		}
	%>
	<!--main-->
	<section class="main">
		<div class="main__image"
			style="background-image: URL(./resources/img/green_main1.jpg);">
			<div class="main__title">
				<p>INFORMATION OF COVID 19</p>
				<p>ALL ABOUT INFORMATION OF COVID 19</p>
				<p>We provides information that is updated in real-time updates.</p>
			</div>
		</div>
	</section>
	<a href="home.do">이히히</a>
	<a href="home.do">home</a>
	<section class="charts">
		<div class="chart__wrap">
			<p>word cloud chart</p>
		</div>
		<div class="chart__wrap">
			<p>일일확진자</p>
		</div>
		<div class="chart__wrap">
			<p>선별진료소</p>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(window).scroll(function(){
$(".main__image").css("opacity", 1 - $(window).scrollTop() / 1000);
});
</script> 
</html>