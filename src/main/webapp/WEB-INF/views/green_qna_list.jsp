<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/green_qna_list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(document).ready(function(){
		<c:if test="${serchtext == null}">
			$("#serchpaging").css("display","none");
			$("#paging").css("display","block");
		</c:if>
		<c:if test="${serchtext != null}">
			$("#serchpaging").css("display","block");
			$("#paging").css("display","none");
		</c:if>
	})
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="qnalist.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
		<c:if test="${serchtext != null}">
			location.href="serch.do?nowPage=${paging.nowPage}&serchselect=title&serchtext=${serchtext}&cntPerPage="+sel;
		</c:if>
	}
</script>
<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 부트스트랩 끝 -->

<script type="text/javascript" src="resources/js/green_qna_list.js"></script>

<style type="text/css">
#serchpaging{
	display:none;
}

#paging{
	display: block;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	vertical-align: middle;
	text-align: center;
	border: 1px solid lightgray;
}
.qnalist__section2__border__title{
	width: 21%;
	margin-bottom: 30px;
}

p {
	margin-top: 15px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>	
	<section class="qnalist">
		<div class="qnalist__wrap">

			<div class="qnalist__section__frequent">
			   <ul class="qnalist__list">
			     <li>
			      <p class="qnalist__section__frequent__title">확진자수는 매일 업데이트 되나요?</p>
			      <div class="qnalist__section__frequent__content">확진자수는 포털 사이트에서 업데이트되는 코로나 확진자 수를 매일 정각 오전 9시 기준으로 업데이트 됩니다.</div>
			    </li>
			    <li>
			      <p class="qnalist__section__frequent__title">정책과 뉴스는 어디서 가져오나요?</p>
			      <div class="qnalist__section__frequent__content">포털사이트와 정부 24에서 제공되는 데이터를 업데이트 하고 있습니다.</div>
			    </li>
			    <li>
			      <p class="qnalist__section__frequent__title">정책과 뉴스를 가져올 때 특정한 기준이 있나요?</p>
			      <div class="qnalist__section__frequent__content">포털사이트에서 가장 많이 검색된 뉴스와, 가장 빠르게 업로드 된 기사와 정책을 기준으로 데이터를 업데이트 하고 있습니다.</div>
			     </li>
			    </ul>
			</div>

		<div id="outter">
			
			<div style="float: right;" id="pagingselbox">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div>
			
			<div class="qnalist__section2__border">
				<!-- <div class="qnalist__section2__border__title">QNA 게시판</div> -->
				<table border=1 class="qnalist__section2__border__table table table-striped">
					<col width="10%">
					<col width="10%">
					<col width="50%">
					<col width="15%">
					<col width="15%">
					<tr>
						<th>번호</th>
						<th>비밀글</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성 날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty viewAll }">
							<tr>
								<td colspan="5" align="center">------작성된 문의글이 없습니다-------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${viewAll }" var="list">
								<tr>
									<td>${list.boardno }</td>
									<td>${list.secret }</td>
									<c:choose>
										<c:when test="${dto.role eq 'ADMIN' }">
											<td><a href="qnadetail.do?boardno=${list.boardno }" onclick="">${list.title }</a></td>
										</c:when>
										<c:when test="${list.id eq dto.id && list.secret eq 'Y' }">
											<td><a href="qnadetail.do?boardno=${list.boardno }" onclick="">${list.title }</a></td>
										</c:when>
										<c:when test="${list.secret != 'Y' }">
											<td><a href="qnadetail.do?boardno=${list.boardno }" onclick="">${list.title }</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="#" onclick="alert('비밀글 입니다.');">${list.title }</a></td>
										</c:otherwise>									
									</c:choose>
									<td>${list.id }</td>
									<td>${list.regdate }</td>
								</tr>
							</c:forEach>						
						</c:otherwise>
					</c:choose>
				</table>
				<div style="text-align: center;" id="paging">		
					<c:if test="${paging.startPage != 1 }">
						<a href="qnalist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="qnalist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="qnalist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				<!-- serch.do -->
				<div style="text-align: center;" id="serchpaging">		
					<c:if test="${paging.startPage != 1 }">
						<a href="serch.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&serchselect=title&serchtext=${serchtext}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="serch.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&serchselect=title&serchtext=${serchtext}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="serch.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&serchselect=title&serchtext=${serchtext}">&gt;</a>
					</c:if>
				</div>
				<!-- serch.do end -->
			</div>	
		</div><!-- outer -->
				<div class="qnalist__section2__border__btnwrap">
					<form action="serch.do" method="post">
						<select name="serchselect">
							<option value="title">제목</option>
							<option value="id">작성자</option>
						</select>
						<input type="text" name="serchtext">
						<input type="submit" value="검색">
					</form>
					<input type="button" value="QNA 작성"
						class="qnalist__section2__btninsert"
						onclick="location.href='qnainsertForm.do'" />
				</div>
		</div> <!-- qnalistwrap -->


	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>