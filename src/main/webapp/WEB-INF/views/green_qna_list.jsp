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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="qnalist.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<section class="qnalist">
		<div class="qnalist__wrap">

			<div class="qnalist__section1__frequent">
				<div class="qnalist__section1__frequent__title">자주 받는 QNA</div>
				<div class="qnalist__section1__frequent__content">내영</div>
			</div>

		<div id="outter">
			
			<div style="float: right;">
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
				<div class="qnalist__section2__border__title">QNA 게시판</div>
				<table border=1 class="qnalist__section2__border__table">
					<col width="5%">
					<col width="5%">
					<col width="50%">
					<col width="20%">
					<col width="20%">
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
										<c:when test="${dto.id eq 'admin' }">
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
				<div style="display: block; text-align: center;">		
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