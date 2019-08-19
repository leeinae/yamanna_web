<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#LoginBtn").click(function() {
			console.log("클릭");
			var id = $("#id").val();
			var pw = $("#pw").val();
			if(id == "") {
				alert("아이디를 입력하세요");
				$("#id").focus();
				return;
			}
			if(pw == "") {
				alert("비밀번호를 입력하세요");
				$("#pw").focus();
				return;
			}
			document.loginForm.submit();
		});
	})
</script>
</head>
<body>
	<h1>로그인 페이지</h1><hr>
	<form name="loginForm" action="${pageContext.request.contextPath}/logincheck" method="post">
		id : <input type="text" name="id" id="id"><br>
		pw : <input type="text" name="pw" id="pw"><br>
		<button type="button" id="LoginBtn">로그인</button>	
	</form>
	<a href="${pageContext.request.contextPath }/signup"><button>회원가입</button></a>
</body>
</html>