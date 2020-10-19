<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA SELECT</title>

<link href="resources/css/green_qna_select.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Open+Sans&display=swap" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>

</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
	
    <section class="green__board__select">
        <div class="board__title">
            <div class="title"><p>TITLE</p></div>
            <div class="title__name">{title}</div>
        </div>
        <div class="line"></div>
        <div class="board__content">
            <div class="content">Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text.</div>
            <div class="content__buttons">
                <input class="button" type="button" name="" value="UPDATE" onclick="" />
                <input class="button" type="button" name="" value="DELETE" onclick="" />
            </div>
        </div>
        <div class="line"></div>
        <div class="board__reply">
            <div class="reply__admin"><p>{admin.id}</p></div>
            <div class="reply__comments">Contrary to popular belief, Lorem Ipsum is not simply random text.</div>
        </div>
        <div class="line"></div>
        <div class="board__reply__insert">
            <div class="reply__admin">{admin.id}</div>
            <div class="reply__comments__insert">
                <textarea class="comments__text" required="required" >text</textarea>
                <div class="reply__buttons">
                    <input class="button" type="submit" value="SUBMIT" />
                </div>
            </div>
        </div>
    </section> 
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>