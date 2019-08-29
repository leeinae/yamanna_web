<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function sendForm() {
		var id = $("#id").val();
		var data = {
				"id" : id
		};
		if(id =="") {
			alert("검색할 id를 입력하세요!");
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/searchFriend",
				type : "post",
				dataType: "json",
				contentType:"application/json;charset=UTF-8",
				data : JSON.stringify(data),
				success : function(data) {
					var output="";
					if(data.id == "") {
						output += "<h2>검색된 아이디가 없습니다.</h2>";						
						$("#id").val("");
					} else {
						output += "<h2> 아이디 : "+data.id+"</h2>";						
						output += "<h2> 닉네임 : "+data.nickname+"</h2>";											
						output += "<button onClick='addFriend(\""+data.id+"\")'>친구 추가</button>";
					}
					$("#friendDiv").html(output);
				}, 
				error : function(request, status, error) {
					alert("실패");
				}
			});			
		}
	}
	
	function addFriend(id) {
		var data = {
				"id" : id
		};
		$.ajax({
			url : "${pageContext.request.contextPath}/addFriend",
			type:"POST",
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data){
				alert("여기 성공");
			},
			error : function() {
				alert("여기 실패");
			}
			
		});
	}
</script>
<body>
<h2>친구 ID 검색</h2>

<input type="text" placeholder="ID를 입력하세요" id="id" name="id">
<button id="search" onClick="sendForm()">검색</button>

<div id="friendDiv">
</div>
</body>
</html>