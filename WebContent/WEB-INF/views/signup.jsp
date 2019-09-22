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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=카카오 키 값&libraries=services"></script>
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
    
</script>
<script>
	function idCheck() {
		var id = $("#userId").val();
		$.ajax({
			async : true,
			type : "POST",
			data : id,
			url : "${pageContext.request.contextPath}/check",
			dataType:"json",
			contentType: "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt != 0 ){
					alert("이미 존재하는 id 입니다.");
				} else {
					alert("사용가능한 id 입니다.");
				}
			},
			error : function(error){
				alert("error : " + error);
			}
		})
	}
</script>
<style>
	.user {
		padding: 20px 20px;
	    background: orange;
	    margin-top: 10px;
	    display: flex;
	    border-radius: 20px;
	}
	
	.user img {
		width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    margin: 0px 20px;
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
						<h2>회원가입</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- our_service start-->
	<section class="sample-text-area">
		<div class="container box_1170">
				<form id="fridenForm"
					method="POST" action="${pageContext.request.contextPath }/signup">
					<h3 class="text-heading">기본 정보</h3>
					<div class="mt-10">
						<input type="text" name="id" id="userId"
						 placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'"
							onfocus="this.value=''" required class="single-input"/>	
						<button type="button" onclick="idCheck()" class="genric-btn primary circle small">중복 체크</button>				
						<input type="password" name="pw" 
						 placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"
							onfocus="this.value=''" required class="single-input"/>					
						<input type="password"
						 placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'"
							onfocus="this.value=''" required class="single-input"/>					
						<input type="text"
						 placeholder="닉네임" name="nickname" onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임'"
							onfocus="this.value=''" required class="single-input"/>					
						<input type="email"
						 placeholder="이메일" name="email" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"
							onfocus="this.value=''" required class="single-input"/>					
						<input type="hidden" id="xpos" name="xpos" placeholder="x좌표"><br>
						<input type="hidden" id="ypos" name="ypos" placeholder="y좌표"><br>
						<input type="hidden" id="addr" name="addr" placeholder="주소"/>
						<h3 class="text-heading">출발지 입력</h3>
						<button type="button" onclick="sample5_execDaumPostcode()" class="genric-btn primary circle small">주소검색</button>
						<br>
						<div id="map" style="width:500px; height:400px;"></div>
						<h3 id="addrInput"></h3>
					</div>
					<br>
					<button type="submit" class="genric-btn primary circle e-large">가입하기</button>
				</form>
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