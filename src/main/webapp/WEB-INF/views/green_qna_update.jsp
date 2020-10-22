<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_qna_update.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <section class="qnaupdate">
    
		<div class="qnaupdate__wrap">
			<form action="qnaupdateres.do" method="post">
				<div class="qnaupdate__top">
				
					<div class="qnaupdate__top__title">
						<span class="qnaupdate__top__span__title">TITLE </span>
						<input type="text" name ="title" class="qnaupdate__input__title" maxlength="30" value="${list.title }">
						<input type="hidden" name="boardno" value="${list.boardno }">
					</div>
					<div class="qnaupdate__top__content">
						<span class="qnaupdate__top__span__content">CONTENT </span>
						<textarea rows="10" cols="80" maxlength="1300" name ="content" class="qnaupdate__input__content">${list.content }</textarea>
					</div>
					
				</div>
				
				<div class="qnaupdate__bottom">
				
					<div class="qnaupdate__bottom__btnwrap">
						<input type="submit" value="수정 완료">
					</div>
					
				</div>
			</form>
		</div>
    </section>
    	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>