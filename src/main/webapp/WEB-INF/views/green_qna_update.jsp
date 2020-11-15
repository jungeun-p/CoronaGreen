<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_qna_update.css" rel="stylesheet" type="text/css"/>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: 370,
	        focus: true, 
	        lang : 'ko-KR'
	  });
})
	  
</script>
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
						<textarea id="summernote" rows="10" cols="80" maxlength="1300" name ="content" class="qnaupdate__input__content">${list.content }</textarea>
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
<style>
p {
	margin-top: 15px;
}
</style>
</html>