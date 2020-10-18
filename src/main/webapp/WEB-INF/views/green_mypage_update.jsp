<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/green_mypage_update.css">

</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<section class="update__section">
        <nav class="update__side__nav">
            <p class="update__side__nav__p">
                <a href="#" class="nav__link">EDIT MY PROFILE</a>
            </p>
            <p class="update__side__nav__p">
                <a href="#" class="nav__link">BOOKMARK</a>
            </p>
        </nav>
	    <div class="update__form__wrap">
	        <form action="" method="post" class="update__form">
	            <ul class="update__form__ul">
	                <li class="form__title">
	                    UPDATE
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">ID</span>
	                    <input type="text" name="id">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">PW</span>
	                    <input type="text" name="password">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text"></span>
	                    <input type="text" name="passwordconfirm" class="password__confirm">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">EMAIL</span>
	                    <input type="text" name="email">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">P.H</span>
	                    <input type="text" name="phon">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">ADDRESS</span>
	                    <input type="text" name="address">
	                </li>
	                <li class="update__form__li update__form__li__submit">
	                   <input class="update__submit" type="submit" value="UPDATE">
	                </li>
	            </ul>
	        </form>
	    </div>
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>