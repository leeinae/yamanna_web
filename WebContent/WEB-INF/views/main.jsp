<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
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
  </head>

  <body>
    <!--::header part start::-->
    <header>
    	<jsp:include page="header.jsp"></jsp:include>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 offset-lg-1">
            <div class="banner_text">
              <div class="banner_text_iner">
                <h5>대중교통 기반 중간 지점 찾기</h5>
                <h1>YAMANNA</h1>
                <h1>야만나</h1>
				<a href="${pageContext.request.contextPath }/meeting" class="btn_1">모임 생성</a>	
				</div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- banner part start-->

    <!--::client logo part end::-->
    <section class="client_logo">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-12">
            <div
              class="client_logo_slider owl-carousel d-flex justify-content-between"
            >
              <div class="single_client_logo">
                <img src="resources/img/logo/ODsay_bi.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/kakaoLogo.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/sang.jpg" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/daum_map.png" alt="" height="150px"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--::client logo part end::-->

    <!-- our_service start-->
    <section class="our_service">
      <div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-4">
					<div class="section_tittle">
					<br>
						<p>내가 속한 모임</p>
						<h2>My Meeting</h2>
					</div>
				</div>
			</div>
        <div class="row">
					<c:forEach items="${requestScope.list }" var="list">
						<div class="col-sm-6 col-xl-4">
							<div class="single_feature">
								<div class="single_service">
									<span>${list[0].mdate }</span>
									<h4>${list[0].mname }</h4>
									<p>${list[0].pname }</p>
									<h5>
										<c:forEach items="${list[1] }" var="member" varStatus="index">
								            ${member.nickname }
											<c:if test="${!index.last }">
												,
											</c:if>
										</c:forEach>
									</h5>
									<br>
									<br> <a href="/meeting/${list[0].mno }"
										class="genric-btn primary circle">더보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
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
              <a href="index.html">
                <img src="img/footer_logo.png" alt="" />
              </a>
              <ul>
                <li><a href="#">Work</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
              <div class="social_icon">
                <a href="#"><i class="ti-facebook"></i></a>
                <a href="#"><i class="ti-twitter-alt"></i></a>
                <a href="#"><i class="ti-dribbble"></i></a>
                <a href="#"><i class="ti-instagram"></i></a>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 col-md-3">
            <div class="single-footer-widget footer_2">
              <h4>Company</h4>
              <ul>
                <li>
                  <a href="#">Media</a>
                </li>
                <li>
                  <a href="#">Carrier</a>
                </li>
                <li>
                  <a href="#">Testimonials</a>
                </li>
                <li>
                  <a href="#">FAQ</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 col-md-3">
            <div class="single-footer-widget footer_2">
              <h4>Resources</h4>
              <ul>
                <li>
                  <a href="#">UI kit</a>
                </li>
                <li>
                  <a href="#">WordPress theme</a>
                </li>
                <li>
                  <a href="#">Illustration</a>
                </li>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <img src="resources/img/animate_icon/icon_2.png" class="animation_icon_2" alt="">

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