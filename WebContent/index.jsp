<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Main</title>

<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700|Roboto:400,500"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/main_do.css">
</head>

<body>

	<!-- Start Header Area -->
	<header class="default-header">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="index.jsp"> <img
					src="img/logo.png" alt="">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>

				<div
					class="collapse navbar-collapse justify-content-end align-items-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li><a class="active" href="index.jsp">홈</a></li>
						<li><a href="desc.jsp">제품소개</a></li>
						<c:choose>
							<c:when test="${empty id}">
								<li><a href="memberLogin.jsp">학습현황</a></li>
							</c:when>
							<c:when test="${!empty id}">
								<li><a href="learningStatus_day.do">학습현황</a></li>
							</c:when>
						</c:choose>

						<!-- <li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								학습현황
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="projects.jsp">Projects</a>
								<a class="dropdown-item" href="elements.jsp">Elements</a>
							</div>
						</li> -->
						<c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">랭킹</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="ranking_day.do">랭킹</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">Q&A</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="boardList.do">Q&A</a></li>
							</c:when>
						</c:choose>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							id="navbardrop" data-toggle="dropdown"> My page </a>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${empty id}">
											<a class="dropdown-item" href="memberLogin.jsp">공부하기</a> 
									</c:when>
									<c:when test="${!empty id}">
											<a class="dropdown-item" href="timeSetSelect.do">공부하기</a> 
									</c:when>
								</c:choose>
							</div></li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty id}">
					<div class="login-div">
						<a class="login-logout" href="memberLogin.jsp" onclick="">로그인</a>
					</div>
				</c:when>
				<c:when test="${!empty id}">
					<div class="login-div">
						<a class="login-logout" href="memberLogout.do" onclick="">로그아웃</a>
					</div>
				</c:when>
			</c:choose>
		</nav>
	</header>
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="home-banner-area relative" id="home"
		data-parallax="scroll" data-image-src="img/header.jpg">
		<div class="overlay-bg overlay"></div>
		<h1 class="template-name">VALKYRIE</h1>
		<div class="container">
			<div class="row fullscreen">
				<div class="banner-content col-lg-12">
					<p>집에 있는 시간이 많아진 요즘</p>
					<h1>
						VALKYRIE <br>IS THE FUTURE
					</h1>
					<c:choose>
						<c:when test="${empty id}">
								<a href="memberLogin.jsp" class="primary-btn">Going To Study</a>
						</c:when>
						<c:when test="${!empty id}">
								<a href="timeSetSelect.do" class="primary-btn">Going To Study</a>
						</c:when>
					</c:choose>

				</div>
			</div>
		</div>
		<div class="head-bottom-meta">
			<div class="d-flex meta-left no-padding">
				<a href="#"><span class="fa fa-facebook-f"></span></a> <a href="#"><span
					class="fa fa-twitter"></span></a> <a href="#"><span
					class="fa fa-instagram"></span></a>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start features Area -->
	<section class="features-area section-gap-top" id="news">
		<div class="container">
			<div class="row feature_inner">
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-1"></div>
						</div>
						<!-- <i class="fi flaticon-compass"></i> -->
						<h4>LED알람</h4>
						<p>한 번만 설정하면 스케줄에 맞는 LED알람이 자동으로</p>
						<p>스톱워치 등 시끄러운 알람 NO</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-2"></div>
						</div>
						<h4>자동 밝기 조절</h4>
						<p>
							주변 환경에 따라 밝기가 자동<br> 조절되어 시력 보호 효과 UP
						</p>
						<p>0~255단계 밝기 조절 가능</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-3"></div>
						</div>
						<h4>학습 시간 확인</h4>
						<p>일간 / 주간 / 월간 총 학습시간, 평균 학습시간을 한 눈에</p>
						<p>공부 / 쉬는 시간 비율 확인 가능</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-4"></div>
						</div>
						<h4>학습 시간 랭킹</h4>
						<p>
							나와 같은 카테고리인 회원들의<br>
							일간 / 주간 / 월간 총 학습시간
						</p>
						<p>랭킹 확인 가능</p>
					</div>
				</div> 
			</div>
		</div>
	</section>
	<!-- End features Area -->

	<!-- Start About Area -->
	<section class="about-area section-gap-bottom">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-7 col-md-12 about-left">
					<img class="img-fluid" src="img/main_about.png" alt="">
				</div>
				<div class="col-lg-5 col-md-12 about-right">
					<div class="section-title text-left">
						<h4>Valkyrie</h4>
						<h2>
							LED알람<br />스마트스탠드
						</h2>
					</div>
					<div>
						<p>
							집중력 저하의 주요원인은 스마트폰을 들여다보는 것! <br> 스마트폰이나 별도의 장치 없이 공부 시간 알람
							설정이 가능하고 <br> 눈의 피로도를 줄여줄 수 있는 스마트스탠드 <br> 발키리를 만나보세요.
						</p>
					</div>
					<c:choose>
						<c:when test="${empty id}">
							<a href="memberLogin.jsp" class="primary-btn">제품 주문하러 가기</a>
						</c:when>
						<c:when test="${!empty id}">
							<a href="order.jsp" class="primary-btn">제품 주문하러 가기</a>
						</c:when>
					</c:choose>

				</div>
			</div>
		</div>
	</section>
	<!-- End About Area -->
	<section class="offer-area relative">
		<div class="container">
			<div class="row align-items-center justify-content-end">
				<div class="col-lg-8 offer-right">
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title text-left mb-5">
								<h4>Valkyrie</h4>
								<h2>사용 설명서</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#"> <br> <br>
									<h4>1. 마이 페이지</h4>
								</a>
								<p>
									1. 회원가입 후 학습시간과 쉬는 시간을 설정합니다. <br> 2. 나의 학습 시간은 학습 현황
									페이지에서 확인할 수 있습니다. <br> <br> <br>
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>2. 공부하기</h4>
								</a>
								<p>
									1. 마이페이지에서 공부 시작 버튼을 누르면 타이머가 자동으로 전송됩니다. <br> 2. 설정한 학습
									시간이 지나면, 쉬는 시간에 맞는 조명이 밝혀집니다. 3. 공부가 끝나면, 일시정지 버튼을 눌러 일반
									스탠드/무드등처럼 사용이 가능합니다.
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>3. Valkyrie제품</h4>
								</a>
								<p>1. 스탠드에 부착된 버튼으로 자동 밝기 조절/수동 밝기 조절 모드를 선택할 수 있습니다.</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>4. Ranking 페이지</h4>
								</a>
								<p>
									1. 랭킹 페이지에서는 다른 사람의 학습 시간을 알 수 있습니다. <br> <br>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start Project Area -->
	<section class="project-area section-gap-top" id="project">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="section-title text-center">
						<h4>발키리</h4>
						<h2>개발 과정</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="filters mb-5">
						<ul>
							<li class="active" data-filter=".all">All</li>
							<li data-filter=".popular">Back-end</li>
							<li data-filter=".latest">Front-end</li>
							<li data-filter=".following">Arduino</li>
							<li data-filter=".upcoming">Together</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="filters-content">
				<div class="row grid">
					<div class="col-lg-4 col-md-6 grid-sizer"></div>

					<div class="col-lg-4 col-md-6 grid-item all following"
						data-wow-delay="0s">
						<div class="single-project">
							<div class="relative">
								<div class="thumb">
									<img class="image img-fluid" src="img/projects/arduino.jpg"
										alt="">
								</div>
								<div class="middle">
									<h4>Arduino 코딩</h4>
									<div class="cat">보드에 코드를 입력하는 모습</div>
								</div>
								<a class="overlay" href="#"></a>
							</div>
						</div>
					</div>

					<div class="col-lg-8 grid-item col-md-6 all popular">
						<div class="single-project">
							<div class="relative">
								<div class="thumb">
									<img class="image img-fluid" src="img/projects/back.jpg" alt="">
								</div>
								<div class="middle">
									<h4>Back-end</h4>
									<div class="cat">Arduino와 Web을 연결하는 모습</div>
								</div>
								<a class="overlay" href="#"></a>
							</div>
						</div>
					</div>



					<div class="col-lg-8 grid-item col-md-6 all upcoming">
						<div class="single-project">
							<div class="relative">
								<div class="thumb">
									<img class="image img-fluid" src="img/projects/together.jpg"
										alt="">
								</div>
								<div class="middle">
									<h4>Together</h4>
									<div class="cat">서로 협력하면서 나아가는 모습</div>
								</div>
								<a class="overlay" href="#"></a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 grid-item col-md-6 all latest">
						<div class="single-project">
							<div class="relative">
								<div class="thumb">
									<img class="image img-fluid" src="img/projects/front.png"
										alt="">
								</div>
								<div class="middle">
									<h4>Front-end</h4>
									<div class="cat">사용자 UI 및 Web 디자인하는 모습</div>
								</div>
								<a class="overlay" href="#"></a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- End Project Area -->

	<!-- Start callto Area -->
	<section class="callto-area section-gap relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row">
				<div class="call-wrap mx-auto">
					<h1>View Our Project</h1>
					<a id="play-home-video" class="video-play-button"> <span></span>
					</a>
					<p>05:35</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End callto Area -->

	<!-- Start testimonial Area -->
	<section class="testimonial-area relative section-gap-top bg-white"
		id="testimonial">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title text-center">
						<h4>Developers</h4>
						<h2>OUR TEAM</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-testimonial">
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/yi.png" alt="">
						</div>
						<div class="desc">
							<p>저도 같은 공부로 힘든 시절을 보낸 사람으로, 제가 공부할 때 이 제품이 있었으면 지금쯤 더 높은 위치에
								있었을텐데 호호호..</p>
							<h4>김예인</h4>
							<div class="bottom">
								<p>팀장 & 아두이노</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/ej.png" alt="">
						</div>
						<div class="desc">
							<p>백엔드 코드...정말 쉬웠어요. 쉽지만 꽉차고 알찬 기능!! 다 제 능력이죠. 다른 회사 이사님들 많이
								봐주세요 ^^</p>
							<h4>신은정</h4>
							<div class="bottom">
								<p>백앤드</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/dw.png" alt="">
						</div>
						<div class="desc">
							<p>공부하는 사람들에게 정말 강추합니다. 버튼 몇 개로 공부시간을 정리해주고 누적해주다니... 이런 제품
								어디없습니다.</p>
							<h4>정다운</h4>
							<div class="bottom">
								<p>아두이노</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/hy.png" alt="">
						</div>
						<div class="desc">
							<p>이거 만들기 정말 힘들었어요. 얼마나 자식같은 존재인지.... 이 제품에 있는 기능 좋아요...좋습니다
							</p>
							<h4>오현종</h4>
							<div class="bottom">
								<p>아두이노</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/hj.png" alt="">
						</div>
						<div class="desc">
							<p>집에서 혼자 공부하기 정말 힘들어요. 그런데 이 제품과 같이 공부하면서 누적되는 시간과 통계가 눈에
								보이니 동기부여가 많이 됐어요!</p>
							<h4>도한재</h4>
							<div class="bottom">
								<p>프론트엔드</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End testimonial Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Creators</h4>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">스몰비즈니스</a></li>
						<li><a href="#">크리에이터</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Partners</h4>
					<ul>
						<li><a href="#">비즈니스 ．광고</a></li>
						<li><a href="#">스토어 개설</a></li>
						<li><a href="#">지역업체 등록</a></li>

					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Developers</h4>
					<ul>
						<li><a href="#">발키리 개발자 센터</a></li>
						<li><a href="#">오픈 API</a></li>
						<li><a href="#">오픈소스</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Information</h4>
					<ul>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
					</ul>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Valkyrie &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					Valkyrie, inc<i class="fa fa-heart-o" aria-hidden="true"></i>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook-f"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a> <a href="#"><i
						class="fa fa-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
		console.log("${id}");
	</script>
</body>

</html>