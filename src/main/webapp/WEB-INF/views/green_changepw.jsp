<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/green_changepw.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/green_changepw.js" defer></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form action="changepwres.do" method="post" class="wrap__changepw">
	<input type="hidden" name="id" value="${id }"/>
		<div class="changepw">
			<div class="changepw__title change__all">NEW PW</div>
			
			<div class="changepw__first change__all">
				<div class="changepw__first__title">PW</div>
				<div class="changepw__first__input">
					<input name="pw" id="pw" class="changepw__first__text" type="password"/>
				</div>
			</div>
			<div id="pw_check1" class="check"></div>
			<div class="changepw__second change__all">
				<div class="changepw__second__title">&nbsp;&nbsp;</div>
				<div class="changepw__second__input">
					<input id="pwchk" class="changepw__first__text" type="password"/>
				</div>
			</div>
			<div id="pw_check2" class="check"></div>
			</div>
			
			<div class="changepw2">
			<div class="changepw__button change__all">
				<input id="change" class="changepw__button__input"  type="submit" value="change" disabled="disabled"/>
			</div>
			</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>