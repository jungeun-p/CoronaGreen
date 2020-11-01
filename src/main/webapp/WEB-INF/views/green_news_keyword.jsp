<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var list = ${map.list};
	var word = ${keyword};
	var array = new Array();
	$.each(list, function(index, value) {
		array[index] = value;
	})
	$.ajax({
				type : "post",
				url : "resources/json/navernews.json",
				data : "json",
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.news.length; i++) {
						var title = data.news[i].title.trim();
						var content = data.news[i].content.trim();
						var link = data.news[i].link.trim();
						var img = data.news[i].img.trim();
						if (title.length > 40) {
							title = title.substr(0, 39) + "...";
						}

						if (list.indexOf(title) > 0 || list.indexOf(content) > 0) { 
							if (array.indexOf(title) == -1) {
								$(".news__section1__news__section")
									.append(
											"<div class='news__section1__content'>"
													+ "<div class='content__box'>"
													+ "<div class='content__img__box'>"
													+ "<a>"
													+ "<input type='hidden' value=\"" + link + "\"/>"
													+ "<img src=\"" + img + "\">"
													+ "</a>"
													+ "</div>"
													+ "</div>"
													+ "<div class='content__heart'>"
													+ "<div class='background__bg'></div>"
													+ "<img src='resources/img/heart(empty).png' class='heart' onclick='bookmarkChk(this)'/>"
													+ "<p class='content__title' onclick='origin(\"" + link + "\");''>${bookmarklist.title }" + title + "</p>"
													+ "</div>"
													+ "</div>"
									);
						} else {
							$(".news__section1__news__section")
									.append(
											"<div class='news__section1__content'>"
											+ "<div class='content__box'>"
											+ "<div class='content__img__box'>"
											+ "<a>"
											+ "<input type='hidden' value=\"" + link + "\"/>"
											+ "<img src=\"" + img + "\">"
											+ "</a>"
											+ "</div>"
											+ "</div>"
											+ "<div class='content__heart'>"
											+ "<div class='background__bg'></div>"
											+ "<img src='resources/img/heart.png' class='heart' onclick='bookmarkChk(this)'/>"
											+ "<p class='content__title' onclick='origin(\"" + link + "\");''>${bookmarklist.title }" + title + "</p>"
											+ "</div>"
											+ "</div>");
							}
						}
					}

				},
				error : function() {
					alert("실패");
				}
			})

})

function bookmarkChk(heart) {
	var link = $(heart).parent().prev().children().children().children('input').val();
	var img = $(heart).parent().prev().children().children().children('img').attr('src');
	var title = $(heart).next('.content__title').text();
	var id = ${id};
	console.log(id + " " + title + " " + img + " " + link);
	
	if (id == null) {
		alert("북마크는 로그인 후 이용 가능합니다.");
		location.href = "loginform.do";
	} else {
		$.ajax({
			url : "bookmarkcheck.do?id=" + encodeURIComponent(id)
					+ "&title=" + encodeURIComponent(title) + "&link="
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
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<section class="news">
			<section class="news__section1__news__section">
		
			</section>
		</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>