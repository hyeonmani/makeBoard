<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../sign/log.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>게시글</h2>
<hr>
	<table>
		<tr>
			<th width="30%" align="center">게시번호</th>
			<td width="70%" align="left">
				<c:out value="${board.bno }" />
			</td>
		</tr>
		<tr>
			<th width="30%" align="center">제목</th>
			<td width="70%">
				<c:out value="${board.title }" />
			</td>
		</tr>
		<tr>
			<th width="30%">작성자</th>
			<td width="70%">
				<c:out value="${board.id }" />
			</td>
		</tr>
		<tr>
			<th width="30%">내용</th>
			<td width="70%">
				<c:out value="${board.content }" />
			</td>
		</tr>
		<tr>
			<th width="30%">게시날짜</th>
			<td width="70%">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" />
			</td>
		</tr>
		<tr>
			<th width="30%">수정날짜</th>
			<td width="70%">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }" />
			</td>
		</tr>
	</table>
	<button data-oper='list'>목록가기</button>
	<c:if test="${member.id == board.id }">
		<button data-oper='modify'>수정하기</button>
	</c:if>
	<form id="pagingForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name='bno' value='<c:out value="${board.bno }"/>'>
		<input type="hidden" name='pageNum' value='<c:out value="${paging.pageNum}" />'>
		<input type="hidden" name='amount' value='<c:out value="${paging.amount}" />'>
	</form>
	
<script type="text/javascript">
	$(document).ready(function(){
		
		var pagingForm = $("#pagingForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			pagingForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			pagingForm.find("#bno").remove();
			pagingForm.attr("action", "/board/list")
			pagingForm.submit();
		});
	});
</script>
	
</body>
</html>