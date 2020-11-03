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
<!-- d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>
<!-- d3.js cloud -->
<script src="https://cdn.jsdelivr.net/gh/holtzy/D3-graph-gallery@master/LIB/d3.layout.cloud.js"></script>
<link href="resources/css/green_chart.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
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
		<div class="chart__wrap">
			<p>word cloud chart</p>
			<div id="cloud"></div>
		</div>
		<div class="chart__wrap">
			<p>일일확진자</p>
			<div class="canvas" id="svg1"></div>
		</div>
		<!-- 선별진료소 -->
		<div class="chart__wrap">
			<div class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; color: black; border-radius: 30px;"></div>
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95fe911fd6cd905e50198f215562879d&libraries=services"></script>
<script src="resources/js/green_map.js"></script>
<!-- d3.js -->
<script src="resources/js/green_chart.js"></script>
<!-- d3.js_colud -->
<script src="resources/js/green_chart_word.js"></script>
</html>