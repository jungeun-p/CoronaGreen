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
	
	<section class="qna">
		<div class="select_border">
			
			<div class="div_title">
			    <div class="select select_title"><p id="t">TITLE</p></div> 
			    <!-- div p하면 풋터랑 충돌나서 p태그에 id값 넣어줬습니다. -->
			    <div></div>
			</div>
			
			<hr width="90%" align="center" color= "black">
			
			<div class="div_content">
			    <div class="select_content"><input type="text" id="mycontent" placeholder="content" required="required" title="n" /></div>
			    <!-- div p하면 풋터랑 충돌나서 p태그에 id값 넣어줬습니다. -->
			    <div class="select_button">
			    	<input type="button" value="UPDATE" id="update_b" onclick=""/>
			    	<input type="button" value="DELETE" id="update_b2" onclick=""/>
			    </div>
			</div>
			
			<hr align="center" width="90%" color= "black">
			
			<div class="div_admin">
			    <div class="admin_1 select_admin"><p id="admin">ADMIN</p></div>
			    <!-- div p하면 풋터랑 충돌나서 p태그에 id값 넣어줬습니다. -->
			    <div class="admin_2 select_admin"><input type="text" id="myadmin" required="required" title="n" /></div>
			</div>
			
			<hr align="center" width="90%" color= "black">
			
			<div class="div_admin2">
			    <div class="admin2_1 select_admin2"><p id="admin2">ADMIN</p></div>
			    <!-- div p하면 풋터랑 충돌나서 p태그에 id값 넣어줬습니다. -->
			    <div class="admin2_2 select_admin2"><textarea id="myadmin2" cols="80" rows="8" ></textarea></div>
			</div>
				
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>