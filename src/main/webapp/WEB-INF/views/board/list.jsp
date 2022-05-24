<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../sign/log.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	ul li {
		list-style: none;
		display: inline;
		margin: 0 10px 0 10px;
	}
</style>
</head>
<body>
<h2>게시물 목록</h2>
<hr>
<input type="button" onclick="location.href='/board/regist'" value="게시물 작성"></button>
<div id="contents">
	<table width="100%">
		<thead>
			<tr align="center">
				<th width="10%">게시번호</th>
				<th width="30%">제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
				<th width="20%">수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="board">
				<tr align="center">
					<td><c:out value="${board.bno }" /></td>
					<td><a class='move' href='<c:out value="${board.bno }" />'><c:out value="${board.title }" /></a></td>
					<td><c:out value="${board.id }" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div id="pages" align="center">
	<ul>	
		<c:if test="${page.prev}">
        	<li class='page_button previous'><a href="${page.startPage -1 }">이전</a></li>
        </c:if>
        
        <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
            <li class='page_button ${page.paging.pageNum == num ? "active":""} '><a href="${num }">${num}</a></li>
        </c:forEach>
        
        <c:if test="${page.next}">
            <li class='page_button next'><a href="${page.endPage +1 }">다음</a></li>
        </c:if>
     </ul>
</div>

<form id="pagingForm" action="/board/list" method="get">
	<input type="hidden" name='pageNum' value='${page.paging.pageNum}'>
	<input type="hidden" name='amount' value='${page.paging.amount}'>
</form>

<script type="text/javascript">
$(document).ready(function(){
	var pagingForm = $("#pagingForm");
	$(".page_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		pagingForm.find("input[name='pageNum']").val($(this).attr("href"));
		pagingForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		pagingForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		pagingForm.attr("action", "/board/get");
		pagingForm.submit();
	});
	
});
</script>
</body>
</html>
