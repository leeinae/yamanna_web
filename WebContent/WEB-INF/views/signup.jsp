<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입 페이지</h1>
	<form method="POST" action="${pageContext.request.contextPath }/signup">
		아이디 : <input type="text" name="id" placeholder="아이디"><br>
		비밀번호 : <input type="text" name="pw" placeholder="비밀번호"><br>
		비밀번호 확인: <input type="text" placeholder="비밀번호 확인"><br>
		닉네임 : <input type="text" name="nickname" placeholder="닉네임"><br> 
		이메일  : <input type="text" name="email" placeholder="이메일"><br> 
		x  : <input type="text" name="xpos" placeholder="x좌표"><br> 
		y  : <input type="text" name="ypos" placeholder="y좌표"><br> 
		<button type="submit">가입 완료</button>
	</form>

</body>
</html>