<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749"></script>
<script>
	window.onload = function() {
		var container = document.getElementById("map");
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		}
		var map = new kakao.maps.Map(container, options);		
	}
</script>
<body>
	<h1>회원 가입 페이지</h1>
	<form method="POST" action="${pageContext.request.contextPath }/signup">
		아이디 : <input type="text" name="id" placeholder="아이디"><br>
		비밀번호 : <input type="text" name="pw" placeholder="비밀번호"><br>
		비밀번호 확인: <input type="text" placeholder="비밀번호 확인"><br>
		닉네임 : <input type="text" name="nickname" placeholder="닉네임"><br>
		이메일 : <input type="text" name="email" placeholder="이메일"><br>
		x : <input type="text" name="xpos" placeholder="x좌표"><br>
		y : <input type="text" name="ypos" placeholder="y좌표"><br>
		<button type="submit">가입 완료</button>
	</form>
	<div id="map" style="width:500px;height:400px;">
	</div>
</body>
</html>