<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749&libraries=services"></script>
<script>
var map;
va"WebContent/resources/img/logo.png"r container;
var options;

$(document).ready(function() {
	container = document.getElementById("map");
	options = {
		center : new kakao.maps.LatLng("${requestScope.meeting.ypos }", "${requestScope.meeting.xpos }"),
		level : 3,
		draggable: false
		
	}
	map = new kakao.maps.Map(container, options);
	
	var imgSrc = '/resources/img/location.png', // 마커이미지의 주소입니다    
    imgSize = new kakao.maps.Size(53, 58), // 마커이미지의 크기입니다 
    imgOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다 
	
	var markerImg = new kakao.maps.MarkerImage(imgSrc,imgSize, imgOption),
		markerPosition = new kakao.maps.LatLng("${requestScope.meeting.ypos }", "${requestScope.meeting.xpos }"); 
	
	// 마커를 생성합니다
	var imgMarker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImg // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	imgMarker.setMap(map);
	
});
</script>
</head>
<body>
	<h1>${requestScope.meeting.mname }</h1>
	<h2>${requestScope.meeting.mdate }</h2>
	<h2>${requestScope.meeting.pname }</h2>
	<h2>${requestScope.meeting.url }</h2>
	<h2>${requestScope.meeting.pphone }</h2>
	<h2>${requestScope.meeting.praddr }</h2>
	<h2>${requestScope.meeting.paddr }</h2>
	
	<c:forEach items="${requestScope.member }" var="user">
		<h2>${user.id}</h2>
	</c:forEach>
	
	<div id="map" style="width:500px; height:400px;"></div>
</body>
</html>