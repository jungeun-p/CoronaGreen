<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CORONA GREEN</title>
<link href="resources/css/green_main.css?after" rel="stylesheet"
	type="text/css" />
<link href="resources/css/green_map.css" rel="stylesheet"
	type="text/css" />
<!-- d3.js css -->
<link href="resources/css/green_chart.css" rel="stylesheet"
	type="text/css" />
<!-- AOS -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!-- favicon -->
<link rel="shortcut icon" href="resources/img/favicon.ico" />
<!-- 맵사이드바 버튼때문에 넣었음 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/header_main.jsp"%>
	<%
		if (dto != null) {
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
	<!-- charts -->
	<section class="charts">
		<div data-aos="fade-down" class="chart__wrap">
			<div id="cloud"></div>
		</div>
		<div class="chart__wrap">
            <div data-aos="fade-left" class="chart__bar">
                <p class="chart__name">일일확진자</p>
                <div class="canvas" id="svg1">
                </div>
            </div>
		</div>
		<div class="chart__wrap">
			<div data-aos="fade-right" class="chart__bubble">
				<p class="chart__name">누적확진자</p>
				<svg class=" bubble" id="svg2">
                </svg>
			</div>
		</div>
		<!-- 선별진료소 -->
		<div data-aos="fade-down" class="chart__wrap" style="z-index: 0;">
			<p class="chart__name__map">선별진료소</p>
			<div class="map_wrap">
				<div class="anchorwrap">
					<span class="closebtn" onclick='closeNav()'><i
						class="fa fa-angle-double-left fa-5" aria-hidden="true"></i></span> <span
						class="openmenu" onclick='openNav()'><i
						class="fa fa-angle-double-right fa-5" aria-hidden="true"></i></span>
				</div>
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden; color: black; border-radius: 30px;">

				</div>
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
					<div id="map_header"></div>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<!-- kakao map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95fe911fd6cd905e50198f215562879d&libraries=services"></script>
<script src="resources/js/green_map.js"></script>
<!-- d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>
<!-- d3.js cloud -->
<script
	src="https://cdn.jsdelivr.net/gh/holtzy/D3-graph-gallery@master/LIB/d3.layout.cloud.js"></script>
<!-- d3.js -->
<script src="resources/js/green_chart.js"></script>
<!-- d3.js_colud -->
<script src="resources/js/green_chart_word.js"></script>
<!-- d3.js_bubble -->
<script src="resources/js/green_chart_bubble.js"></script>
<!--AOS-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	AOS.init({
		duration : 1400,
	})
</script>
</html>