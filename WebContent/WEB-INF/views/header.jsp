<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
</head>
<style>
	.social_icon{
		color : white;
	}
</style>
<body>
    <!--::header part start::-->
    <header class="main_menu home_menu">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-12">
            <nav class="navbar navbar-expand-lg navbar-light">
              <a class="navbar-brand" href="${pageContext.request.contextPath }/home">
                <img src="/resources/img/logo.png" alt="logo" width="150px" height="50px"/>
              </a>
              <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
              >
                <span class="ti-menu"></span>
              </button>

              <div
                class="collapse navbar-collapse main-menu-item justify-content-center"
                id="navbarSupportedContent"
              >
                <ul class="navbar-nav align-items-center">
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/myMeeting">내 모임</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/meeting">모임 생성</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/friends">친구 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/myPage">내 위치 변경</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/about">About</a>
                  </li>
                </ul>
              </div>
              <div class="social_icon d-none d-lg-block">
              	<c:choose>
					<c:when test="${sessionScope.userId == null }">
						<a href="${pageContext.request.contextPath }/login">로그인</a>
						<a href="${pageContext.request.contextPath }/signup">회원가입</a>
					</c:when>
					<c:otherwise>
					${sessionScope.userName }님, 환영합니다!
						<a href="${pageContext.request.contextPath }/logout">로그아웃</a><br>
				    </c:otherwise>
    			</c:choose>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </header>
    <!-- Header part end-->
</body>
</html>