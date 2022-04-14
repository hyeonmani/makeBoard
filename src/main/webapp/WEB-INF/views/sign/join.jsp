<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입</h2>
<hr>
<c:if test="${msg == false }"><p style="color:red;">이미 등록된 아이디입니다.</p></c:if>
	<form action="/page/join" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required="required"
					placeholder="아이디를 입력하세요" maxlength="20"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" required="required"
					placeholder="비밀번호를 입력하세요" maxlength="20"></td>
			</tr>
		</table>
		<p><button type="submit">회원가입</button>
		<button type="reset">다시 작성</button>
	</form>
</body>
</html>