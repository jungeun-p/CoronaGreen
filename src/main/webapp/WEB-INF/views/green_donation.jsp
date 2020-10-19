<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DONATION</title>

<link href="resources/css/green_donation.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Open+Sans&display=swap" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<section class="donation">
		<div class="dona_border">
			<h3>DONATION</h3>
			
			<div class="div_Donation">
			    <div class="Donation Donation_desciption"><P id="D_d">💓💓💓</P></div> 
			    <!-- div p하면 풋터랑 충돌나서 p태그에 id값 넣어줬습니다. -->
			</div>
			
			<div class="div_Money">
			    <div class="Money_1 Donation_Money"><input type="text" name="WON" id="mywon" placeholder="후원 할 금액을 정하세요." required="required" title="n" /></div>
			    <div class="Money_2 Donation_Money" id="won_t">WON</div>
			</div>
			
			<div class="div_Button">
			    <div class="Button_1 Donation_Button"><input type="button" value="DONATION" id="button_t" onclick=""/></div>
			</div>
				
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>