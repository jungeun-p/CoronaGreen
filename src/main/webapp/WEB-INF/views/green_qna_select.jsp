<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA SELECT</title>
<link href="resources/css/green_qna_select.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Open+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

 
</head>
<body>

	
	
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <section class="green__board__select">
    <input type="hidden" id="alarm_boardno" value="${list.boardno }">
	<input type="hidden" id="recipient" value="${list.id }"/>
	<input type="hidden" id="sender" value="${dto.id }"/>
	<input type="hidden" id="qna_title" value="${list.title}"/>
        <div class="board__title">
            <div class="title"><p>TITLE</p></div>
            <div class="title__name">${list.title }</div>
        </div>
        <div class="line"></div>
        <div class="board__content">
            <div class="content">${list.content }</div>
            <c:choose>
            	<c:when test="${dto.id eq list.id }">
		            <div class="content__buttons">
		                <input class="button" type="button" name="" value="UPDATE" onclick="location.href='qnaupdate.do?boardno=${list.boardno}'" />
		                <input class="button" type="button" name="" value="DELETE" onclick="location.href='qnadelete.do?boardno=${list.boardno}'" />
		            </div>
	            </c:when>
	            <c:otherwise></c:otherwise>
            </c:choose>
        </div>
        <div class="line"></div>
        <c:choose>
        	<c:when test="${relist.content != null }">
		        <div class="board__reply">
		            <div class="reply__admin"><p>Admin</p></div>
		            <div class="reply__comments">${relist.content }</div>
		        </div>
	        </c:when>
	        <c:when test="${dto.role eq 'ADMIN' }">
	        	<form action="qnaReinsert.do" class="class__qnaReinsert">
			        <div class="line"></div>
			        <div class="board__reply__insert">
			            <div class="reply__admin">Admin</div>
			            <div class="reply__comments__insert">
			            	<input type="hidden" name="boardno" value="${list.boardno }">
			                <textarea class="comments__text" required="required" name="content">text</textarea>
			                <div class="reply__buttons">
			                    <input class="button" type="button" value="SUBMIT" onclick="sendMessage()" />
			                </div>
			            </div>
			        </div>
		        </form>
	        </c:when>
	        <c:otherwise></c:otherwise>
        </c:choose>
        <script src="resources/js/green_socket_qnare.js"></script>
    </section> 
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>