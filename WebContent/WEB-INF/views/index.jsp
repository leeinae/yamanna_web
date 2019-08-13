<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메인 페이지</h1>
<c:if test="${msg =='success'}">
	<h2>${sessionScope.userName }님, 환영합니다!</h2>
</c:if>
<hr>
<c:choose>
	<c:when test="${sessionScope.userId == null }">
		<a href="${pageContext.request.contextPath }/login">로그인</a>
		<a href="${pageContext.request.contextPath }/signup">회원가입</a>

	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath }/logout">로그아웃</a><br>
		<form action="${pageContext.request.contextPath }/meeting" method="GET">
			<button type="submit" id="meetBtn">모임 생성</button>
		</form>
	</c:otherwise>
</c:choose>
<hr>
<br>
</body>
</html>