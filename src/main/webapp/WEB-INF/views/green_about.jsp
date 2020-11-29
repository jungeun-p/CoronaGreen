<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ABOUT</title>
<link rel="stylesheet" href="resources/css/green_about.css">
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css'
	rel='stylesheet' type='text/css'>
<!-- favicon -->
<link rel="shortcut icon" href="resources/img/favicon.ico" />
<link rel="stylesheet" href="resources/css/green_about.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="about__wrap">
		<section class="about">
			<div class="about__image" data-aos="fade-up"
				style="background-image: URL(./resources/img/about_1.jpg);">
				<div class="main__title" data-aos="fade-up">
					<p class="about__title">INFORMATION OF COVID 19</p>
					<p class="about__sub">ALL ABOUT INFORMATION OF COVID 19</p>
					<p class="about__sub">We provides information that is updated
						in real-time updates.</p>
				</div>
			</div>
			<div class="about__first">
				<div class="first__image" data-aos="fade-right">
					<div class="first__image__ball">
						<div class="image__ball" data-aos="zoom-in">
							<p class="ball__sub">일일확진자수</p>
						</div>
						<div class="image__ball" data-aos="zoom-in">
							<p class="ball__sub">누적확진자수</p>
						</div>
						<div class="image__ball" data-aos="zoom-in">
							<p class="ball__sub">뉴스 및 정책</p>
						</div>
					</div>
					<p class="first__image__sub">업데이트되는 코로나 19 데이터를 한 번에 모아 쉽고 간단하게
						이슈를 체크할 수 있습니다. 필요한 뉴스와 정책만 골라 북마크 기능을 통해 저장해보세요!</p>
				</div>
				<div class="first__sub" data-aos="fade-left">REAL-TIME UPDATES
					NEWS & POLICY</div>
			</div>
			<div class="about__second" data-aos="fade-down">
				<div class="second__image">
					<img src="./resources/img/about_3.png">
				</div>
				<div class="test__title">
					<p class="second__title">검역은 당일발생 확진자 정보를 다음날 제공해서 집계를 할수없습니다
						(지역사회 해외유입은 지자체에서 제공할경우 집계가능합니다)</p>
					<p class="second__title">민간이 취합한 집계이므로 공식적인 근거 자료로 활용될수 없고,
						본사이트에서 제공하는 정보 사용/공유로 인해 발생된 문제의 책임은 전적으로 사용자에게 있습니다.</p>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	AOS.init({
		duration : 1400,
	})
</script>
</html>