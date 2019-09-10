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
<c:if test="${msg =='success'}">
	<h1>새로운 메인 페이지!</h1>
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
		<input type="button" value="친구 목록" onclick="location='friends'"></input>

		<form action="${pageContext.request.contextPath }/meeting" method="GET">
			<button type="submit" id="meetBtn">모임 생성</button>
		</form>
		<h3>내가 속한 모임</h3>

		<table border="1">
			<thead>
				<tr>
					<th>모임명</th>
					<th>만남 일자</th>
					<th>만남 장소</th>
					<th>참석자</th>
				</tr>
			</thead>
			
			<c:forEach items="${requestScope.list }" var="list">
				<tr>
					<td>${list[0].mname }</td>
					<td>${list[0].mdate }</td>
					<td>${list[0].pname }</td>
					<td>
						<c:forEach items="${list[1] }" var="member" varStatus="index">
							${member.nickname }
							<c:if test="${!index.last }">
								,
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>			
		</table>
	</c:otherwise>
</c:choose>
</body>
</html>