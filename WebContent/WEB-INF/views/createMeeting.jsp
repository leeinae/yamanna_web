<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	$(document).ready(function(){
		$("#search").click(function() {
			var busNo = $('#busNo').val();
			var xhr = new XMLHttpRequest();
			alert(xhr);
			var url = "https://api.odsay.com/v1/api/searchBusLane?apiKey=ohO488CvUmCEUaxjQ9eaKqHZ3TXyT7LJZbQt/2qM2Lw&busNo=" + busNo;
			xhr.open("GET", url, true);
			alert("호출 후 ");
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultObj = JSON.parse(xhr.responseText);
					alert(resultObj.result);
					var resultArr = resultObj["result"]["lane"];
					alert(resultArr);

					var str = "";
					for (var i = 0; i < resultArr.length; i++) {
						str += "<div class='box'>";
						str += "<p>지역이름 : " + resultArr[i].busCityName + "</p>";
						str += "<p>버스회사 : " + resultArr[i].busCompanyNameKor + "</p>";
						str += "<p>버스번호 : " + resultArr[i].busNo + "</p>";
						str += "<p>출발점 / 도착점 : " + resultArr[i].busStartPoint + " - "
							+ resultArr[i].busEndPoint + "</p>";
						str += "</div>";
					}
					document.getElementById("resultDiv").innerHTML = str;
				}
			}
		});		
	});
</script>
</head>
<body>
<div>
<input type="text" id="busNo">
<button type="button" id="search">눌러</button>
</div>
<div id="resultDiv">
<!-- 결과창 -->
</div>
</body>
</html>