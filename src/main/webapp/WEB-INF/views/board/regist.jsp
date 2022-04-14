<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sign/log.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
<h2>게시물 작성하기</h2>
<hr>
	<c:choose>
		<c:when test="${member == null }">
			<script>
				alert("로그인이 필요합니다. 로그인 창으로 이동합니다.");
				location.href="/page/login";
			</script>
		</c:when>
	
		<c:otherwise>
			<form action="/board/regist" method="post">
				<table>
					<tr>
						<th width="30%" align="center">제목</th>
						<td width="70%" align="left"><input type="text" name="title" required="required" maxlength="50"></td>
					</tr>
					<tr>
						<th width="30%" align="center">내용</th>
						<td width="70%"><textarea cols="50" rows="10" name="content" style="resize: none;" ></textarea></td>
					</tr>
					<tr>
						<th width="30%">작성자</th>
						<td width="70%"><input type="text" name="id" value="${member.id }" readonly="readonly"></td>
					</tr>
				</table>
				<p><button type="submit">등록하기</button>
				<button type="reset">다시 작성</button>
				<input type="button" value="뒤로가기" onclick="location.href='/board/list'">
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>