<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Yamanna</title>
<link rel="icon" href="resources/img/favicon.png" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<!-- animate CSS -->
<link rel="stylesheet" href="resources/css/animate.css" />
<!-- owl carousel CSS -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css" />
<!-- themify CSS -->
<link rel="stylesheet" href="resources/css/themify-icons.css" />
<!-- flaticon CSS -->
<link rel="stylesheet" href="resources/css/flaticon.css" />
<!-- font awesome CSS -->
<link rel="stylesheet" href="resources/css/magnific-popup.css" />
<!-- swiper CSS -->
<link rel="stylesheet" href="resources/css/slick.css" />
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/modal.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
						output += "<button onClick='addFriend(\""+data.id+"\")' class='genric-btn primary circle small'>친구 추가</button>";
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
<style>
	.user {
		padding: 20px 20px;
	    background: #fbf9ff;
	    margin-top: 10px;
	    display: flex;
	}
	
	.user img {
		width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    margin-right: 30px;
	}
</style>

</head>

<body>
	<!--::header part start::-->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<!-- Header part end-->

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg align-items-center">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-sm-6">
					<div class="breadcrumb_tittle">
						<p>만나고 싶은 친구를 추가하세요.<br>ID로 검색할 수 있습니다!</p>
						<h2>친구 관리</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- our_service start-->
	<section class="sample-text-area">
		<div class="container box_1170">
			<h2>친구 목록</h2><br>
			<div>
				<c:forEach items="${requestScope.list }" var="user">
					<div class="user col-sm-6">
						<img src="resources/img/user.png" alt="">
						<div class="userInfo">
							<h3>${user.id }</h3>
							<p>${user.nickname}</p>
						</div>
					</div>
				</c:forEach>
				<br>
			</div>
			<button id="btn" onClick="btnClick()" class="genric-btn primary circle large">친구 추가</button>

			<div id="modal">
				<div id="modal-content">
					<span class="close" onClick="spanClick()">&times;</span>
					<h2>친구 ID 검색</h2>
					
					<table>
						<tr>
							<td width="75%">
								<input type="text" id="id" name="id" placeholder="ID를 입력하세요" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID를 입력하세요'"
									required class="single-input">						
							</td>
							<td>
								<button id="search" onClick="sendForm()" class="genric-btn primary-border circle small">검색</button>											
							</td>
						</tr>
					</table>					
					
					<div id="friendDiv">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- our_service part end-->

	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-3 col-xl-3">
					<div class="single-footer-widget footer_1">
						<a href="index.html"> <img src="resources/img/footer_logo.png"
							alt="" />
						</a>
						<ul>
							<li><a href="#">Work</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
						<div class="social_icon">
							<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
								class="ti-twitter-alt"></i></a> <a href="#"><i
								class="ti-dribbble"></i></a> <a href="#"><i class="ti-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 col-md-3">
					<div class="single-footer-widget footer_2">
						<h4>Company</h4>
						<ul>
							<li><a href="#">Media</a></li>
							<li><a href="#">Carrier</a></li>
							<li><a href="#">Testimonials</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 col-md-3">
					<div class="single-footer-widget footer_2">
						<h4>Resources</h4>
						<ul>
							<li><a href="#">UI kit</a></li>
							<li><a href="#">WordPress theme</a></li>
							<li><a href="#">Illustration</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 col-md-3">
					<div class="single-footer-widget footer_2">
						<div class="single_contact_info">
							<h3>London - UK</h3>
							<p>127, Manchaster city, London</p>
							<p>+008 728 362 278</p>
						</div>
						<div class="single_contact_info">
							<h3>New York - USA</h3>
							<p>127, Manchaster city, London</p>
							<p>+008 728 362 278</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="copyright_part_text text-center">
						<div class="row">
							<div class="col-lg-12">
								<p class="footer-text m-0">
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									All rights reserved | This template is made with <i
										class="ti-heart" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">Colorlib</a>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->

	<!-- jquery plugins here-->
	<script src="resources/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="resources/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="resources/js/jquery.magnific-popup.js"></script>
	<!-- isotope js -->
	<script src="resources/js/isotope.pkgd.min.js"></script>
	<!-- particles js -->
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<script src="resources/js/custom.js"></script>
</body>
</html>