<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../sign/log.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정/삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>게시물 수정/삭제</h2>
<hr>
<c:choose>
	<c:when test="${member == null }">
		<script>
			alert("로그인이 필요합니다. 로그인 창으로 이동합니다.");
			location.href="/page/login";
		</script>
	</c:when>
	
	<c:otherwise>
		<form role="form" action="/board/modify" method="post">
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
						<input type="text" name="title" value='<c:out value="${board.title }" />'>
					</td>
				</tr>
				<tr>
					<th width="30%">작성자</th>
					<td width="70%">
						<c:out value="${board.id }" />'
					</td>
				</tr>
				<tr>
					<th width="30%">내용</th>
					<td width="70%">
						<textarea name="content" cols="50" rows="10" style="resize: none;"><c:out value="${board.content }" /></textarea>
					</td>
				</tr>
				<tr>
					<th width="30%">게시날짜</th>
					<td width="70%">
						<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />
					</td>
				</tr>
				<tr>
					<th width="30%">수정날짜</th>
					<td width="70%">
						<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate }" />
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="bno" value='<c:out value="${board.bno }" />' >
			<input type="hidden" name="id" value='<c:out value="${board.id }" />' >
			<input type="hidden" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />' >
			<input type="hidden" name="updatedate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />' >
			
			<button type="submit" data-oper="modify">수정하기</button>
			<button type="submit" data-oper="remove">삭제하기</button>
			<button type="submit" data-oper="list">목록보기</button>
			
		</form>
	</c:otherwise>
	
</c:choose>

<script type="text/javascript">
$(document).ready(function(){
	var formObject = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === "remove"){
			formObject.attr("action", "/board/remove");
		} else if(operation === "list"){
			formObject.attr("action", "/board/list").attr("method", "get");
			// 수정하다 리스트로 이동 시 주소창에 다른 정보들도 같이 넘어가는걸 방지하기 위해. 다른 데이터는 날려준다.
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='pageNum']").clone();
			// 복사
			formObject.empty();
			// form태그의 내용 지우기
			formObject.append(pageNumTag);
			formObject.append(amountTag);
		}
		formObject.submit();
	});
});
</script>
</body>
</html>