<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/green_qna_list.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
    <section class="qnalist">
        <div class="qnalist__wrap">
        
            <div class="qnalist__section1__frequent">
            	<div class="qnalist__section1__frequent__title">
            		자주 받는 QNA
            	</div>
                <div class="qnalist__section1__frequent__content">
            		내영        
                </div>
            </div>
            
            <div class="qnalist__section2__border">
            	<div class="qnalist__section2__border__title">
            		QNA 게시판
            	</div>
                    <table border=1 class="qnalist__section2__border__table">
                        <col width="10%">
                        <col width="50%">
                        <col width="20%">
                        <col width="20%">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성 날짜</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                        </tr>    <tr>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                        </tr>    <tr>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                            <td>3</td>
                        </tr>
                    </table>
                    <div class="qnalist__section2__border__btnwrap">
                    	<input type="button" value="QNA 작성" class="qnalist__section2__btninsert"/>
                    </div>
            </div>

        </div>
                

    </section>
    	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>