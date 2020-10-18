<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/green_changepw.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form class="wrap__changepw">
		<div class="changepw">
			<div class="changepw__title change__all">NEW PW</div>
			
			<div class="changepw__first change__all">
				<div class="changepw__first__title">PW</div>
				<div class="changepw__first__input">
					<input class="changepw__first__text" type="text"/>
				</div>
			</div>
			
			<div class="changepw__second change__all">
				<div class="changepw__second__title">&nbsp;&nbsp;</div>
				<div class="changepw__second__input">
					<input class="changepw__first__text" type="text"/>
				</div>
			</div>
			</div>
			
			<div class="changepw2">
			<div class="changepw__button change__all">
				<input class="changepw__button__input"  type="button" value="change"/>
			</div>
			</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>