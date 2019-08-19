<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.box {
	width: 400px;
	height: AUTO;
	border: 1px solid green;
	border-radius: 5px;
	padding: 15px;
	margilln: 15px;
	overflow-y: scroll;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749"></script>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function loadMap(x, y) {
		var container = document.getElementById("map");
		var options = {
				center : new kakao.maps.LatLng(y, x),
				level : 3
		}
		var map = new kakao.maps.Map(container, options);
		var makerPosition = new kakao.maps.LatLng(y, x);
		var maker = new kakao.maps.Marker({
			position : makerPosition
		});
		maker.setMap(map);
	}
</script>
<script>
var finalUser =[];
var finalStation = [];
	$(document).ready(function() {
		var middleX = ${requestScope.middlePoint.xpos }
		var middleY = ${requestScope.middlePoint.ypos }
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/pointSearch?apiKey=ohO488CvUmCEUaxjQ9eaKqHZ3TXyT7LJZbQt/2qM2Lw&lang=0&x="+middleX+"&y="+middleY+"&radius=500&stationClass=2";
		xhr.open("GET",url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				var resultArr = resultObj["result"]["station"];
				var resultArrCnt = resultObj["result"]["count"];
				if(resultArrCnt==0) {
					alert("지하철이 없습니다");
				} else {
					var userList =[];
					<c:set var="members" value="${requestScope.userList }"></c:set>;
					<c:forEach items="${members}" var="member">
						var data = new Object();
						data.id = "${member.id}";
						data.uno = "${member.uno}"
						data.nickname = "${member.nickname}";
						data.xpos = "${member.xpos}";
						data.ypos = "${member.ypos}";
						userList.push(data);
					</c:forEach>
					var jsonUserList = JSON.stringify(userList);
					loadData(resultArr, userList);
				}
			}
		}
	});
	
	
	function loadData(station, user) {
		alert("station : "+ station.length);
		alert("user : "+user.length);
		//2차원 배열 선언
		const userInfo = new Array();
		
		for(var i=0; i<user.length; i++) {
			var userTime = new Array();
			for(var j=0; j<station.length; j++) {
				var xhr = new XMLHttpRequest();
				var url = "https://api.odsay.com/v1/api/searchPubTransPathR?apiKey=ohO488CvUmCEUaxjQ9eaKqHZ3TXyT7LJZbQt/2qM2Lw&lang=0"+
						"&SX="+ user[i].xpos+"&SY="+user[i].ypos
						+"&EX="+station[j].x+"&EY="+station[j].y+"&OPT=3";

				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var resultObj = JSON.parse(xhr.responseText);
						var resultArr = resultObj["result"]["path"];
						var totalTime = resultArr[0]["info"].totalTime;
  						if (totalTime !="") {
	 						userTime[j] = (totalTime);
 						}
					}
				}
				userInfo[i] = userTime;
				xhr.open("GET",url, false);
				xhr.send();
			}
		}
		var index = calc(userInfo);
		finalUser = user;
		finalStation = station[index];
		loadMap(station[index].x, station[index].y);
	}
	
/* userList[i][j]
i는 사용자, j는 지하철 역
사용자들의 위치로부터 걸리는 평균 시간을 계산하여 최솟값을 가지는 요소의 index 번호를 반환한다.*/
function calc(dataList) {
  	var avgList=new Array();
  	//평균 계산, [0][0] --> [1][0] --> [2][0]
	for(var j=0; j<dataList[0].length; j++) {
		var time =0;
		for(var i=0; i<dataList.length; i++){
			time += dataList[i][j];
		}
		time = time / dataList.length;
		avgList.push(time);
	}
	var min = avgList.reduce(function(previous, current){
		return previous > current ? current : previous;
	});
	alert(min+" 분 : "+avgList.indexOf(min));
	return avgList.indexOf(min);
}

function confirmPlace(user, station) {
	//json 객체로 controller에 전달~
	var Info = new Object();
	Info.user = user;
	Info.meetDate = "${requestScope.date}";
	Info.stationName = station.stationName;
	Info.stationXpos = station.x;
	Info.stationYpos = station.y;
	
	$.ajax({
		type : 'POST',
		dataType: 'json',
		url : "${pageContext.request.contextPath}/finalPlace",
		contentType: 'application/json; charset=utf-8',
		data : JSON.stringify(Info),
		async : false,
		success : function(data) {
			alert("전송 완료");
		}
	});
}
</script>
</head>
<body>
	<h1>모임 장소</h1>
	<h2>중간 지점 좌표 [ ${requestScope.middlePoint.xpos },
		${requestScope.middlePoint.ypos } ]</h2>
	<br>
	<c:set var="members" value="${requestScope.userList }"></c:set>
	<h1>미팅 생성 멤버 수 : ${fn:length(members) }</h1>
	<hr>
	<h2>참여 멤버</h2>
	<c:forEach items="${members }" var="user">
		<h3>${user }</h3>
	</c:forEach>
	<br>
	<div id="map" style="width: 500px; height: 400px;">
		<!-- 결과 지도 창 -->
	</div>
	<br>
	<input type="button" value="야 만나!" onclick="confirmPlace(finalUser, finalStation)">
</body>
</html>