<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인성공</title>
</head>
<body>
<c:if test="${msg == false }">
	<p style="color:red;">아이디/비밀번호가 틀렸습니다. 다시 입력하세요.</p>
	<form name="loginForm" action="/page/login" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id" required="required" placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd" name="pwd" required="required" placeholder="비밀번호를 입력하세요"></td>
			</tr>
		</table>
		<p><input type="submit" value="로그인">
		<input type="reset" value="다시입력">
	</form>
</c:if>
<c:if test="${member != null }">
	<script>
		location.href="/board/list";
	</script>
</c:if>
</body>
</html>