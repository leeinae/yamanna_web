<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<h3>친구 선택</h3>
	<form id="fridenForm" action="${pageContext.request.contextPath }/createMeeting" method="post">
		<c:forEach items="${requestScope.list }" var="user">
			<input type="checkbox" name="friend" value="${user.id }">id : ${user.id }, nickname : ${user.nickname }</><br>
		</c:forEach>
		<button type="submit">장소 찾기</button>
	</form>
</body>
</html>