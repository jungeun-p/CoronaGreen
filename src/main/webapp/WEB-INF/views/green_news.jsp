<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/green_news.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var list = $
		{
			map.list
		}
		;
		var array = new Array();
		$.each(list, function(index, value) {
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
		<section class="news__section1__news__section">
			<div class="news__section1__content">
				<div class="content__heart">
					<img class="heart" src="resources/img/heart(empty).png">
				</div>
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="">
						</a>
					</div>
					<div class="content__text">
						<p class="content__title">+ title +</p>
						<p class="content__content">+ content +</p>
					</div>
				</div>
			</div>
			<div class="news__section1__content">
				<div class="content__heart">
					<img class="heart" src="resources/img/heart(empty).png">
				</div>
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="">
						</a>
					</div>
					<div class="content__text">
						<p class="content__title">+ title +</p>
						<p class="content__content">+ content +</p>
					</div>
				</div>
			</div>
			<div class="news__section1__content">
				<div class="content__heart">
					<img class="heart" src="resources/img/heart(empty).png">
				</div>
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="">
						</a>
					</div>
					<div class="content__text">
						<p class="content__title">+ title +</p>
						<p class="content__content">+ content +</p>
					</div>
				</div>
			</div>
			<div class="news__section1__content">
				<div class="content__heart">
					<img class="heart" src="resources/img/heart(empty).png">
				</div>
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="">
						</a>
					</div>
					<div class="content__text">
						<p class="content__title">+ title +</p>
						<p class="content__content">+ content +</p>
					</div>
				</div>
			</div>
			<div class="news__section1__content">
				<div class="content__heart">
					<img class="heart" src="resources/img/heart(empty).png">
				</div>
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="">
						</a>
					</div>
					<div class="content__text">
						<p class="content__title">+ title +</p>
						<p class="content__content">+ content +</p>
					</div>
				</div>
			</div>
		</section>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>