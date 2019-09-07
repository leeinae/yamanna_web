<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<form id="fridenForm" action="${pageContext.request.contextPath }/createMeeting" method="post">
		<h3>미팅 이름</h3>
		<input type="text" name="meetName" value="야만나" onfocus="this.value=''"/>
		<h3>날짜 선택</h3>
		<input type="text" id="datepicker" name="date"><br>
		<script>
			$("#datepicker").datepicker({
					minDate: 0,
					dateFormat : 'yy-mm-dd',
					showOn : "both",
					buttonText: "날짜 선택"
				});
		</script>
		<h3>친구 선택</h3>
		<c:forEach items="${requestScope.list }" var="user">
			<input type="checkbox" name="friend" value="${user.id }">id : ${user.id }, nickname : ${user.nickname }</><br>
		</c:forEach>
		<button type="submit">장소 찾기</button>
	</form>
</body>
</html>