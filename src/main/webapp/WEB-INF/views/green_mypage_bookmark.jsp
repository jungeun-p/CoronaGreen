<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/green_mypage_bookmark.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/green_mypage_bookmark.js" defer></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">

</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>

	<section class="bookmark">
		<nav class="bookmark__side__nav">
			<p class="bookmark__side__nav__p">
				<a href="mypage_update.do" class="nav__link">EDIT MY PROFILE</a>
			</p>
			<p class="bookmark__side__nav__p">
				<a href="bookmarklist.do" class="nav__link">BOOKMARK</a>
			</p>
		</nav>
	</section>


	<section class="news__section1__news__section">
		<c:choose>
			<c:when test="${empty list }">
				<div class="book__mark__check">NO BOOKMARK</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="bookmarklist">
					<div class="news__section1__content">
						<div class="content__heart">
							<img class="heart" src="resources/img/heart(empty).png" onclick="bookmarkDel(this, '${dto.id}')">
						</div>
						<div class="content__box">
							<div class="content__img__box" onclick="origin('${bookmarklist.link}');">
								<a> 
								<input type="hidden" value="${bookmarklist.link }"/>
								<img src="${bookmarklist.img }">
								</a>
							</div>
							<div class="content__text">
								<p class="content__title">${bookmarklist.title }</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<!-- <div class="bookmark__section">
	        <ul class="bookmark__section1 bookmark__section__ul">
				<li class="bookmark__section1__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
				<li class="bookmark__section1__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
				<li class="bookmark__section1__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
			</ul>
			<ul class="bookmark__section2 bookmark__section__ul">
				<li class="bookmark__section2__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
				<li class="bookmark__section2__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
				<li class="bookmark__section2__content">
					<div class="content__img__box">
						<img src="" alt="content">
						<div class="content__heart">
							<img src="resources/img/heart.png" alt="찜">
						</div>
					</div>
					<div class="content__text">
						<p class="content__text__p">
							ALL ABOUT <br>
							INFORMATION OF<br>
							COVID 19 <br>
							provides information
						</p>
					</div>
				</li>
			</ul>
		</div> -->
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>