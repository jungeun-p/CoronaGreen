<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_qna_insert.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <section class="qnainsert">
    
		<div class="qnainsert__wrap">
			<form action="qnainsert.do" method="post">
				<div class="qnainsert__top">
				
					<div class="qnainsert__top__title">
						<span class="qnainsert__top__span__title">TITLE </span>
						<input type="text" name ="title" class="qnainsert__input__title" maxlength="30" placeholder="제목을 입력해주세요">
					</div>
					<div class="qnainsert__top__content">
						<span class="qnainsert__top__span__content">CONTENT </span>
						<textarea rows="10" cols="80" placeholder="내용을 입력해주세요" maxlength="1300" name ="content" class="qnainsert__input__content"></textarea>
					</div>
					
				</div>
				
				<div class="qnainsert__bottom">
				
					<div class="qnainsert__bottom__btnwrap">
						<input type="submit" value="작성 완료">
					</div>
					
				</div>
			</form>
		</div>
    </section>
    	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>