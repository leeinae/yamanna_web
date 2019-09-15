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
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
						<h2>About</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- our_service start-->
	<section class="sample-text-area">
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<h3 class="mb-30">About Us</h3>
				<div class="row">
					<div class="col-md-3">
						<img src="resources/img/elements/meeting (1).jpg" alt="" class="img-fluid">
					</div>
					<div class="col-md-9 mt-sm-20">
						<p>야만나는 기존의 중간지점 찾기 어플을 개선하여 각 모임원들에게 비슷한 시간이 소요되는 지점을 찾아 그 근방의 카페, 음식점, 관광명소등을 추천하여 모임의 목적에 맞는 장소를 정할 수 있도록 하는 것이며, 추가적으로 모임 일자와 장소, 모임 참여자 명단등을 표시해주어 모임의 효율적 관리할 수 있도록 만들었습니다.</p>
					</div>
				</div>
			</div>
			<div class="section-top-border text-right">
				<h3 class="mb-30">개발 목표 및 환경 </h3>
				<div class="row">
					<div class="col-md-9">
						<p class="text-right">프로젝트 주제 선정을 위해 팀원들과 회의를 할 때 서로의 위치를 고려하여 회의 장소를 선정하는 과정에서 불편함을 느껴 여러 사람 간의 중간 지점을 찾는 어플을 사용 해 보았으나, 기존의 중간지점을 찾는 프로그램은 모두 좌표간의 무게중심만을 찾아줄 뿐 소요시간을 고려하지 않아 사용에 불편이 많았습니다. 그래서 이를 개선하는데 도움이 될 수 있는 프로젝트를 시작하기로 하였고, 야만나 웹 서비스를 개발하게 되었습니다.</p>
							<p class="text-right">개발 환경 : Spring Tool Suite, Tomcat 9.0<br>
								사용 기술 : Spring MVC, JSP, Mybatis, KakaoMap API, ODsayAPI, 다음우편번호
								API<br>개발 언어 : JAVA 1.8, HTML5, CS3, JavaScript DB : Oracle EE 11.2</p>
						</div>
					<div class="col-md-3">
						<img src="resources/img/elements/meeting (2).jpg" alt="" class="img-fluid">
					</div>
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