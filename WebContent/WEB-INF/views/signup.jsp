<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749&libraries=services"></script>
<script>

	var container = document.getElementById("map");
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	}
	var map = new kakao.maps.Map(container, options);
	var geocoder = new kakao.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(37.537187, 127.005476),
	    map: map
	});
	
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addrInput").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    alert("정상 실행");
                    if (status === kakao.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
						alert(result);
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        container.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                    } else{
                    	alert("걸림");
                    }
                });
            }
        }).open();
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
		<input type="text" id="addrInput" placeholder="주소"/>
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/><br>
		<button type="submit">가입 완료</button>
	</form>
	<div id="map" style="width:500px;height:400px;">
	</div>
</body>
</html>