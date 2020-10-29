<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/green_news.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var list = ${map.list};
		var array = new Array();
		$.each(list, function(index,value){
			array[index] = value;
		})
		/* $.ajax({
			type: "post",
			url: "resources/json/navernews.json",
			data: "json",
			contentType: "application/json",
			dataType: "json",
			success: function(data) {
				console.log(data.news.length);
				for (var i = 0; i < data.news.length; i++) {
					var title = data.news[i].title.trim();
					var link = data.news[i].link.trim();
					var img = data.news[i].img.trim();
					var content = data.news[i].content.trim();
					if (array.indexOf(title) == -1) {
					$(".news__section1").append(
							"<li class='news__section1__content'>" +
							"<div class='content__img__box'>"+
							"<a href=\"" + link + "\">" +
							"<img src=\"" + img + "\">"+
							"</a>" +
							"<div class='content__heart'>" +
							"<img class='heart' src='resources/img/heart(empty).png'>" +
							"</div>" +
							"</div>" +
							"<div class='content__text'>" + 
							"<p class='content__text__p'>" +
							"<p>" + title + "</p>" +
							"<p>" + content + "</p>" +
							"</div>" +
							"</li>"
							);
					} else {
						$(".news__section1").append(
								"<li class='news__section1__content'>" +
								"<div class='content__img__box'>"+
								"<a href=\"" + link + "\">" +
								"<img src=\"" + img + "\">"+
								"</a>" +
								"<div class='content__heart'>" +
								"<img class='heart' src='resources/img/heart.png'>" +
								"</div>" +
								"</div>" +
								"<div class='content__text'>" + 
								"<p class='content__text__p'>" +
								"<p>" + title + "</p>" +
								"<p>" + content + "</p>" +
								"</div>" +
								"</li>"
								);
					}
				}
				
			},
			error: function() {
			alert("실패");
			} 
		}) */
	})
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<section class="news">
		<ul class="news__section1 news__section">
			<li class="news__section1__content">
				<div class="content__img__box">
					<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content">
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
			<li class="news__section1__content">
				<div class="content__img__box">
					<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content">
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
			<li class="news__section1__content">
				<div class="content__img__box">
					<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content">
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
		</ul>
		<ul class="news__section2 news__section">
			<li class="news__section2__content">
				<div class="content__img__box">
					<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content">
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
			<li class="news__section2__content">
				<div class="content__img__box">
					<a href="#"><img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content"></a>
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
			<li class="news__section2__content">
				<div class="content__img__box">
					<img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F032%2F2020%2F10%2F26%2F3039588.jpg&type=ofullfill80_80_q75_re2" alt="content">
					<div class="content__heart">
						<img class="heart" src="resources/img/heart.png" alt="찜">
					</div>
				</div>
				<div class="content__text">
					<p class="content__text__p">
						<p>
						코로나19 바이러스 침입한 폐 세포, 6시간 안에 감염 ‘끝’
						</p>
						<p>
						코로나19 바이러스가 침입하면 6시간 안에 감염이 끝나지만, 면역 반응이 활성화하는데는 3일 가량 걸린다는 연구 결과가 나왔다. KAIST 등이 참가한 연구진은 배양한 인간의 폐포(肺胞, 허파꽈리) 세포를 활용해 코로나19...
						</p>
					</p>
				</div>
			</li>
		</ul>
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>