<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="resources/css/green_mypage_update.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/green_mypage_update.js" ></script>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<section class="update__section">
        <nav class="update__side__nav">
            <p class="update__side__nav__p">
                <a href="mypage_update.do" class="nav__link">EDIT MY PROFILE</a>
            </p>
            <p class="update__side__nav__p">
                <a href="bookmarklist.do" class="nav__link">BOOKMARK</a>
            </p>
        </nav>
	    <div class="update__form__wrap">
	        <form action="mypage_updateres.do" method="post" class="update__form">
	            <ul class="update__form__ul">
	                <li class="form__title">
	                    UPDATE
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">ID</span>
	                    <input type="text" name="id" readonly value="${dto.id }">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">PW</span>
	                    <input type="text"  id="pw" name="pw"  required="required" placeholder="변경할 비밀번호를 입력해주세요">
	                </li>
	                <li class="update__form__li__result">
	                	<div id="pw_check1" class="check"></div>
	                </li>
	                <li class="update__form__li">
                        <span class="form__text"></span>
	                    <input type="text" id="pwchk" name="passwordconfirm" class="password__confirm"  required="required" placeholder="같은 비밀번호를 입력해주세요">
	                </li>
	                  <li class="update__form__li__result">
	                	<div id="pw_check2" class="check"></div>
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">EMAIL</span>
	                    <input type="text" name="email" readonly value="${dto.email }">
	                </li>
	                <li class="update_                                                                                                                  _form__li">
                        <span class="form__text">P.H</span>
	                    <input type="text" name="phone" readonly value="${dto.phone }" id="phon__input">
	                </li>
	                <li class="update__form__li">
                        <span class="form__text">ADDRESS</span>
	                    <input type="text" name="address" readonly value="${dto.address }">
	                </li>
	                <li class="update__form__li update__form__li__submit">
<!-- 	               <input class="update__submit" type="button" value="UPDATE" onclick="pw_check()"/> -->
	                   <input id="change" class="update__submit changepw__button__input" type="button" value="UPDATE" disabled="disabled" onclick="pw_check()"/>
	                   <!-- 탈퇴버튼 이거 써야됨! -->
	                 <%-- <input type="button" value="SECESSION" class="update__submit changepw__button__input" onclick='secession("<%=dto.getId() %>");'/> --%>
	                </li>
	                <li>
	                	<div class="update__message"></div>
	                </li>
	            </ul>
	        </form>
	    </div>
	</section>

	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
<script type="text/javascript">
function secession(id) {
	 var confirm_test = confirm("정말로 탈퇴 하시겠습니까?");
	  if ( confirm_test == true ) {
	        // 확인(예) 버튼 클릭 시 이벤트
		  location.href = "secession.do?id="+id;
	    } else if ( confirm_test == false ) {
	        // 취소(아니오) 버튼 클릭 시 이벤트
	    }
}
</script>
</html>