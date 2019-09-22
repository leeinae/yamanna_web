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
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/bootstrap.min.css" />
<!-- animate CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/animate.css" />
<!-- owl carousel CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/owl.carousel.min.css" />
<!-- themify CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/themify-icons.css" />
<!-- flaticon CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/flaticon.css" />
<!-- font awesome CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/magnific-popup.css" />
<!-- swiper CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/slick.css" />
<!-- style CSS -->
<link rel="stylesheet" href="http://3.19.175.56:8080/Yamanna/resources/css/style.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=카카오 키값&libraries=services"></script>
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
<script>
var map;
var container;
var options;

$(document).ready(function() {
	container = document.getElementById("map");
	options = {
		center : new kakao.maps.LatLng("${requestScope.meeting.ypos }", "${requestScope.meeting.xpos }"),
		level : 3,
		draggable: false
		
	}
	map = new kakao.maps.Map(container, options);
	
	var imgSrc = 'http://3.19.175.56:8080/Yamanna/resources/img/location.png', // 마커이미지의 주소입니다    
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
						<p>${requestScope.meeting.mdate }</p>
						<h2>${requestScope.meeting.mname }</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- our_service start-->
	<section class="sample-text-area">
		<div class="container box_1170">
			<h2>만남 장소</h2><br>
			<div id="map" style="width:500px; height:400px;"></div><br>
			<h2>참여 인원</h2><br>
			<div>
				<c:forEach items="${requestScope.member }" var="user">
					<div class="user col-sm-6">
						<img src="http://3.19.175.56:8080/Yamanna/resources/img/user.png" alt="">
						<div class="userInfo">
							<h3>${user.id }</h3>
							<p>${user.nickname}</p>
						</div>
					</div>
				</c:forEach>
				<br>
				<h2>${requestScope.meeting.pname }</h2>
				<h2>${requestScope.meeting.praddr }</h2>
				<h2>${requestScope.meeting.paddr }</h2>
				<h2>${requestScope.meeting.pphone }</h2>
			</div>
			<a href="${requestScope.meeting.url }">
				<button id="btn" class="genric-btn primary circle large">더보기</button>			
			</a>

		</div>
	</section>
	<!-- our_service part end-->

	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-3 col-xl-3">
					<div class="single-footer-widget footer_1">
						<a href="index.html"> <img src="http://3.19.175.56:8080/Yamanna/resources/img/footer_logo.png"
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
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="/resources/js/jquery.magnific-popup.js"></script>
	<!-- isotope js -->
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/isotope.pkgd.min.js"></script>
	<!-- particles js -->
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/owl.carousel.min.js"></script>
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<script src="http://3.19.175.56:8080/Yamanna/resources/js/custom.js"></script>
</body>
</html>