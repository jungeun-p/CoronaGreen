<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/green_map.css" rel="stylesheet" type="text/css"/>
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
	<section class="charts">
		<div class="chart__wrap">
			<p>word cloud chart</p>
		</div>
		<div class="chart__wrap">
			<p>일일확진자</p>
		</div>
		<!-- 선별진료소 -->
		<div class="chart__wrap">
			<div class="map_wrap">
    			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    		<div id="menu_wrap" class="bg_white">
	        		<div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="선별진료소" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
	        		</div>
	        	<hr>
	        	<ul id="placesList"></ul>
	        	<div id="pagination"></div>
			    </div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95fe911fd6cd905e50198f215562879d&libraries=services"></script>
	<script src="resources/js/green_map.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(window).scroll(function(){
$(".main__image").css("opacity", 1 - $(window).scrollTop() / 1000);
});
</script> 
</html>