<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
<div style="font-size: small; float: right;">
	<c:choose>
		<c:when test="${member != null }">
			${member.id } &nbsp;|&nbsp; <a href="/page/logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			guest &nbsp;|&nbsp; <a href="/page/login">로그인</a>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>