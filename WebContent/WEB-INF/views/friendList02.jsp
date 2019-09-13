<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
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
			type: "POST",
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data){
				if(data == false) {
					alert("이미 친구입니다!");
				} else {
					alert("추가 되었습니다! 만남을 생성해보세요");
					$('#modal').css("display","none");
					location.reload();
				}
				$("#id").val("");
			},
			error : function(re, status, error) {
				alert(error);
			}
			
		});
	}
</script>
<script>
	var modal = $('#modal');
	
	var btn = document.getElementById("btn");
	
	var span = document.getElementsByClassName("close")[0];                                          
	
	
	function btnClick() {
		$('#modal').css("display","block");
	}
	
	function spanClick() {
		$('#modal').css("display","none");	
	}

	window.onclick = function(event) {
	    if (event.target == modal) {
			$('#modal').css("display","none");	
	    }
	}

</script>
</head>
<body>
<button id="btn" onClick="btnClick()">친구 추가</button>
<h2>친구 목록</h2>
<c:forEach items="${requestScope.list }" var="user">
	<h3>아이디 : "${user.id }", 닉네임 : "${user.nickname}"</h3>
</c:forEach>

<div id="modal">
	<div id="modal-content">
		<span class="close" onClick="spanClick()">&times;</span>
		<h2>친구 ID 검색</h2>
		
		<input type="text" placeholder="ID를 입력하세요" id="id" name="id">
		<button id="search" onClick="sendForm()">검색</button>
		
		<div id="friendDiv">
		</div>
	</div>
</div>
</body>
</html>