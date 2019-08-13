<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin: 15px;
	overflow-y: scroll;
}
</style>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		var middleX = ${requestScope.middlePoint.xpos }
		var middleY = ${requestScope.middlePoint.ypos }
		alert("무게중심 좌표 : ("+middleX+", "+middleY+")");
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/pointSearch?apiKey=키값&lang=0&x="+middleX+"&y="+middleY+"&radius=500&stationClass=2";
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
						data.nickname = "${member.nickname}";
						data.xpos = "${member.xpos}";
						data.ypos = "${member.ypos}";
						userList.push(data);
					</c:forEach>
					var jsonUserList = JSON.stringify(userList);
					alert(jsonUserList);
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
				var url = "https://api.odsay.com/v1/api/searchPubTransPathR?apiKey=키값/2qM2Lw&lang=0"+
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
		calc(userInfo);
	}
	
/* userList[i][j]
i는 사용자, j는 지하철 역 */
function calc(dataList) {
  	var avgList=new Array();
  	//평균 계산, [0][0] --> [1][0] --> [2][0]
	for(var j=0; j<dataList[0].length; j++) {
		var time =0;
		for(var i=0; i<dataList.length; i++){
			time += dataList[i][j];
			alert(i +" / "+ j + " = "+dataList[i][j]);
		}
		time = time / dataList.length;
		avgList.push(time);
		alert(avgList);
	}
}
</script>
</head>
<body>
<h1>모임 장소</h1>
<h2>중간 지점 좌표 [ ${requestScope.middlePoint.xpos }, ${requestScope.middlePoint.ypos } ]</h2>
<br>
<c:set var="members" value="${requestScope.userList }"></c:set>
<h1>미팅 생성 멤버 수 : ${fn:length(members) }</h1>
<hr>
<h2>참여 멤버</h2>
<c:forEach items="${members }" var="user">
	<h3>${user }</h3>
</c:forEach>
<br>
<div id="resultDiv">
<!-- 결과창 -->
</div>

</body>
</html>