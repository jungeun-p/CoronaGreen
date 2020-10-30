<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/green_news.css">
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/*$(function() {
		var list = $
		{
			map.list
		}
		;
		var array = new Array();
		$.each(list, function(index, value) {
			array[index] = value;
		})
		$
				.ajax({
					type : "post",
					url : "resources/json/navernews.json",
					data : "json",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						for (var i = 0; i < data.news.length; i++) {
							var title = data.news[i].title.trim();
							var link = data.news[i].link.trim();
							var img = data.news[i].img.trim();
							var content = data.news[i].content.trim();
							if (content.length > 87) {
								content = content.substr(0, 86) + "...";
							}
							if (title.length > 40) {
								title = title.substr(0, 39) + "...";
							}

							if (array.indexOf(title) == -1) {
								$(".news__section1__news__section")
										.append(
												"<div class='news__section1__content'>"
														+ "<div class='content__heart'>"
														+ "<img onclick='bookmarkChk(this)'class='heart' src='resources/img/heart(empty).png'>"
														+ "</div>"
														+ "<div class='content__box' onclick='origin(\""
														+ link
														+ "\")'>"
														+ "<div class='content__img__box'>"
														+ "<a> <input id='link' type='hidden' value=\"" + link + "\"/>"
														+ "<img src=\"" + img + "\">"
														+ "</a>"
														+ "</div>"
														+ "<div class='content__text'>"
														+ "<p class='content__title'>"
														+ title
														+ "</p>"
														+ "<p class='content__content'>"
														+ content + "</p>"
														+ "</div>" + "</div>"
														+ "</div>");
							} else {
								$(".news__section1__news__section")
										.append(
												"<div class='news__section1__content'>"
														+ "<div class='content__heart'>"
														+ "<img onclick='bookmarkChk(this)' class='heart' src='resources/img/heart.png'>"
														+ "</div>"
														+ "<div class='content__box' onclick='origin(\""
														+ link
														+ "\")'>"
														+ "<div class='content__img__box'>"
														+ "<a> <input id='link' type='hidden' value=\"" + link + "\"/>"
														+ "<img src=\"" + img + "\">"
														+ "</a>"
														+ "</div>"
														+ "<div class='content__text'>"
														+ "<p class='content__title'>"
														+ title
														+ "</p>"
														+ "<p class='content__content'>"
														+ content + "</p>"
														+ "</div>" + "</div>"
														+ "</div>");
							}
						}

					},
					error : function() {
						alert("실패");
					}
				})

	})
	
	function bookmarkChk(heart) {
		var link = $(heart).parent().next().children().children().children(
				'input').val();
		var img = $(heart).parent().next().children().children('a').children()
				.attr('src');
		var title = $(heart).parent().next().children().next().children(
				'.content__title').text();
		var content = $(heart).parent().next().children().next().children(
				'.content__content').text();
		var id = $
		{
			id
		}
		;
		if (id == null) {
			alert("북마크는 로그인 후 이용 가능합니다.");
			location.href = "loginform.do";
		} else {
			$.ajax({
				url : "bookmarkcheck.do?id=" + encodeURIComponent(id)
						+ "&title=" + encodeURIComponent(title) + "&content="
						+ encodeURIComponent(content) + "&link="
						+ encodeURIComponent(link) + "&img="
						+ encodeURIComponent(img),
				type : "get",
				success : function(data) {
					if (data == "DELETE") {
						alert("북마크가 삭제 되었습니다.");
						$(heart).attr('src', 'resources/img/heart(empty).png');
					} else {
						alert("북마크가 추가 되었습니다.");
						$(heart).attr('src', 'resources/img/heart.png');
					}
				},
				error : function() {
					alert("실패~");
				}
			})
		}

	}

	function origin(url) {
		window.open(url);
	}*/
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>

	<section class="news">
		<section class="news__section1__news__section">
			<div class="news__section1__content">
				<div class="content__box">
					<div class="content__img__box">
						<a href=""> <img src="" alt="">
						</a>
					</div>
				</div>
				<div class="content__heart">
					<div class="background__bg"></div>
					<img src="resources/img/heart(empty).png" class="heart" />
					<p class="content__title">+ title +</p>
				</div>
			</div>
		</section>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
<script>
const content = document.querySelector('.news__section1__content');
const heart = document.querySelector('.content__heart');

content.addEventListener('mouseover', () => {
    heart.style.visibility = 'visible';
})
content.addEventListener('mouseout', () => {
    heart.style.visibility = 'hidden';
})
</script>
</html>