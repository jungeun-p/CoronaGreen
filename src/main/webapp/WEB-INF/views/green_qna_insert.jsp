<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_qna_insert.css" rel="stylesheet" type="text/css"/>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: 370,
	        focus: true, 
	        lang : 'ko-KR'
	  });	 	  	  
	  
	  $("#chk").click(function(){
		    if($("#chk").prop("checked")){
		       $("#chk1").val("Y");
		       console.log($("#chk1").val());
		    } else {
		       $("#chk1").val("N");
		       console.log($("#chk1").val());
		    }
		 });
	});
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <section class="qnainsert">
    
		<div class="qnainsert__wrap">
			<form action="qnainsert.do" method="post">
				<div class="qnainsert__top">
				
					<div class="qnainsert__top__title">
						<span class="qnainsert__top__span__title">TITLE </span>
						<input type="hidden" name="id" value="${dto.id }">
						<input type="text" name ="title" class="qnainsert__input__title" maxlength="30" placeholder="제목을 입력해주세요">
						<input type="hidden" id="chk1" value="N" name="secret"/>
						<input type="checkbox" id="chk">비밀글
					</div>
					<div class="qnainsert__top__content">
						<span class="qnainsert__top__span__content">CONTENT </span>
						<textarea id="summernote" rows="10" cols="80" placeholder="내용을 입력해주세요" maxlength="1300" name ="content" class="qnainsert__input__content"></textarea>
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