<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749&libraries=services"></script>
<script>
var map;
var container;
var options;

$(document).ready(function() {
	container = document.getElementById("map");
	options = {
		center : new kakao.maps.LatLng(37.60153260191062, 126.95442190501423),
		level : 3
	}
	map = new kakao.maps.Map(container, options);
});
	
    function sample5_execDaumPostcode() {
		var geocoder = new kakao.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(37.537187, 127.005476),
		    map: map
		});
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                console.log(data);
                // 주소 정보를 해당 필드에 넣는다.
                $("#addrInput").html(addr);
                $("#addr").val(addr);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        var coords = new kakao.maps.LatLng(result.y, result.x);
						//x,y좌표를 input태그에 넣어주긔
                        $("#xpos").val(result.x);
                        $("#ypos").val(result.y);
                        // 지도를 보여준다.
                        container.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                    } else {
                    	alert("Kakao Map API Error");
                    }
                });
            }
        }).open();
    }
    
    function signUp() {
    	alert("클릭햇긔");
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
		<input type="hidden" id="xpos" name="xpos" placeholder="x좌표"><br>
		<input type="hidden" id="ypos" name="ypos" placeholder="y좌표"><br>
		<input type="hidden" id="addr" name="addr" placeholder="주소"/>
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/><br>
		<div id="map" style="width:500px; height:400px;"></div>
		<h3 id="addrInput"></h3>
		<button type="submit">가입 완료</button>
	</form>
</body>
</html>