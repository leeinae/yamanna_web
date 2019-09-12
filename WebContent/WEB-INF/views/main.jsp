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
                <img src="resources/img/logo/Logo1.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo2.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo3.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo4.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo5.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo6.png" alt="" />
              </div>
              <div class="single_client_logo">
                <img src="resources/img/logo/Logo1.png" alt="" />
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
        <div class="row">
          <div class="col-sm-6 col-xl-4">
            <div class="single_feature">
              <div class="single_service">
                <span>01</span>
                <h4>
                  User experience <br />
                  design
                </h4>
                <p>
                  There winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle.
                </p>
                <ul>
                  <li><a href="#">Branding and Identity.</a></li>
                  <li><a href="#">Mobile app</a></li>
                  <li><a href="#">Web design</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-xl-4">
            <div class="single_feature">
              <div class="single_service">
                <span>02</span>
                <h4>Web and App development</h4>
                <p>
                  There winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle.
                </p>
                <ul>
                  <li><a href="#">WordPress</a></li>
                  <li><a href="#">iOS & Android</a></li>
                  <li><a href="#">WFront end</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-xl-4">
            <div class="single_feature">
              <div class="single_service">
                <span>03</span>
                <h4>Digital and inovative marketing</h4>
                <p>
                  There winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle.
                </p>
                <ul>
                  <li><a href="#">Lead generation</a></li>
                  <li><a href="#">Social media</a></li>
                  <li><a href="#">Email marketing</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- our_service part end-->

    <!-- our_project part start-->
    <section class="our_project section_padding" id="portfolio">
      <div class="container">
        <div class="row justify-content-between align-items-center">
          <div class="col-lg-4">
            <div class="section_tittle">
              <p>our project</p>
              <h2>Our Projects</h2>
            </div>
          </div>
          <div class="col-lg-5 col-md-6">
            <div class="filters portfolio-filter project_menu_item">
              <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".buildings">Web Design</li>
                <li data-filter=".rebuild">Mobile App</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="more_btn d-none d-md-block">
              <a href="#" class="more_btn_iner">more projects</a>
            </div>
          </div>
        </div>
        <div class="filters-content">
          <div class="row justify-content-between portfolio-grid">
            <div class="col-lg-6 col-sm-6 all buildings">
              <div class="single_our_project">
                <div class="single_offer">
                  <img src="resources/img/project_1.png" alt="offer_img_1" />
                  <div class="hover_text">
                    <p>Web development</p>
                    <a href="#"><h2>Web design & development</h2></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-sm-6 all rebuild">
              <div class="single_our_project">
                <div class="single_offer">
                  <img src="resources/img/project_2.png" alt="offer_img_1" />
                  <div class="hover_text">
                    <p>Web design</p>
                    <a href="#"><h2>Web design & development</h2></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <img src="resources/img/animate_icon/icon_2.png" class="animation_icon_2" alt="">
    </section>
    <!-- our_project part end-->

    <!-- about part start-->
    <section class="creative padding_bottom">
      <div class="container-fluid">
        <div class="row align-items-center justify-content-start">
          <div class="col-md-6 col-xl-6">
            <div class="creative_img">
              <img src="resources/img/creative_img.png" alt="" />
            </div>
          </div>
          <div class="col-md-6 col-xl-4">
            <div class="creative_part_text">
              <h2>We work hard and think creatively</h2>
              <p>
                There winged grass midst moving earth seed herb fifth you
                multiply you divide cattle stars first cattle.
              </p>
              <span
                >âThere winged grass midst moving earth seed herb fifth you
                multiply you divide cattle stars first cattle.</span
              >
              <a
                href="https://www.youtube.com/watch?v=tDiJnd7SM2Y"
                class="popup-youtube"
                ><i class="ti-control-play"></i> See how we work</a
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- about part end-->

    <!--::review_part end::-->
    <h2>내 모임</h2>
    <div class="review_part padding_bottom" id="testimonial">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-7">
            <div class="section_tittle text-center">
              <p>Testimonials</p>
              <h2>What our Client say</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="review_part_text owl-carousel">
              <div class="singler_eview_part">
                <div class="client_info">
                  <img src="resources/img/client_1.png" alt="" />
                  <h4>Justine Miller</h4>
                  <p>Web developer at Envato</p>
                </div>
                <p>
                  âThere winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle was had spirit
                  you're thing, night darkness. Which itself stars creature.
                </p>
              </div>
              <div class="singler_eview_part">
                <div class="client_info">
                  <img src="resources/img/client_2.png" alt="" />
                  <h4>Danny Jonson</h4>
                  <p>Creative director at Apple</p>
                </div>
                <p>
                  âThere winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle was had spirit
                  you're thing, night darkness. Which itself stars creature.
                </p>
              </div>
              <div class="singler_eview_part">
                <div class="client_info">
                  <img src="resources/img/client_1.png" alt="" />
                  <h4>Justine Miller</h4>
                  <p>Web developer at Envato</p>
                </div>
                <p>
                  âThere winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle was had spirit
                  you're thing, night darkness. Which itself stars creature.
                </p>
              </div>
              <div class="singler_eview_part">
                <div class="client_info">
                  <img src="resources/img/client_2.png" alt="" />
                  <h4>Danny Jonson</h4>
                  <p>Creative director at Apple</p>
                </div>
                <p>
                  âThere winged grass midst moving earth seed herb fifth you
                  multiply you divide cattle stars first cattle was had spirit
                  you're thing, night darkness. Which itself stars creature.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <img src="resources/img/animate_icon/icon_3.png" class="animation_icon_3" alt="">
    </div>
    <!--::review_part end::-->

    <!--::cta_part start::-->
    <div class="cta_part">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="cta_iner">
              <h1>Letâs create something awesome together</h1>
              <a href="#" class="btn_1">Discuss project</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--::cta_part end::-->

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