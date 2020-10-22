<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_find.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/green_find.js" defer></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div class="wrap__find">
		<form class="wrap__find__id">
			<div class="wrap1">
				<div class="find__id__title find__all">FIND ID</div>
				
				<div class="find__id__certification find__all">
					<div class="find__id__cer__title">EMAIL</div>
					<div class="find__id__cer__input">
						<input id="id__email" name="email" class="find__id__cer__text" type="text"/>
					</div>
					<div class="find__id__cer__button">
						<input id="emailsend" class="find__id__cer__button__input" type="button" value="CONFIRM" disabled="disabled"/>
					</div>
				</div>
				<div id="check1"></div>
				
			</div>
			
			<!-- <div class="wrap2">
				<div class="find__id__certification find__all">
				<div class="find__id__cer__title">CODE</div>
				<div class="find__id__cer__input">
						<input class="find__id__cer__text" type="text"/>
					</div>
					<div class="find__id__cer__button">
					<input class="find__id__cer__button__input" type="submit" value="SEARCH"/>
					</div>
				</div>
			</div> -->
		</form>

		<form class="wrap__find__pw">
		<div class="wrap3">
			<div class="find__pw__title">FIND PW</div>
				<div class="find__pw__id find__all">
					<div class="find__pw__id__title">&nbsp;&nbsp;&nbsp;&nbsp;ID</div>
					<div class="find__pw__id__input">
						<input id="pw__id" class="find__pw__id__text" type="text"/>
					</div>
				</div>
				<div id="check2"></div>
				<div class="find__pw__certification find__all">
					<div class="find__pw__cer__title">EMAIL</div>
					<div class="find__pw__cer__input">
						<input id="pw__email" class="find__pw__cer__text" type="text"/>
					</div>
					<div class="find__pw__cer__button">
						<input id="emailsend2" class="find__pw__cer__button__input" type="button" value="CONFIRM" disabled="disabled"/>
					</div>
				</div>
				<div id="check3"></div>
			</div>
			
			 <div class="wrap4">
				<div class="find__pw__search find__all">
					<input class="find__pw__search__input" type="submit" value="SEARCH"/>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>