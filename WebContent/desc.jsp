<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	<title>DESC</title>

	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700|Roboto:400,500" rel="stylesheet">
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
				<a class="navbar-brand" href="index.jsp">
					<img src="img/logo.png" alt="">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-end align-items-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li><a class="active" href="index.jsp">Ȩ</a></li>
						<li><a href="desc.jsp">��ǰ�Ұ�</a></li>
						<c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">�н���Ȳ</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="learningStatus_day.do">�н���Ȳ</a></li>
							</c:when>
						</c:choose>						<!-- <li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								�н���Ȳ
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="projects.jsp">Projects</a>
								<a class="dropdown-item" href="elements.jsp">Elements</a>
							</div>
						</li> -->
						<c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">��ŷ</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="ranking_day.do">��ŷ</a></li>
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
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								My page
							</a>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${empty id}">
											<a class="dropdown-item" href="memberLogin.jsp">�����ϱ�</a>  
									</c:when>
									<c:when test="${!empty id}">
											<a class="dropdown-item" href="timeSetSelect.do">�����ϱ�</a> 
									</c:when>
								</c:choose>							</div>
						</li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty id}">
					<div class="login-div">
						<a class="login-logout" href="memberLogin.jsp" onclick="">�α���</a>
					</div>
				</c:when>
				<c:when test="${!empty id}">
					<div class="login-div">
						<a class="login-logout" href="memberLogout.do" onclick="">�α׾ƿ�</a>
					</div>
				</c:when>
			</c:choose>
		</nav>
	</header>
	<!-- End Header Area -->

	<!-- Start top-section Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row justify-content-between align-items-center text-center banner-content">
				<div class="col-lg-12">
					<h1 class="text-white">��ǰ �Ұ�</h1>
					<p>����� ���� ���� Ÿ�����̺� LED�˶� ���ĵ�</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End top-section Area -->

	<!-- Start features Area -->
	<section class="features-area section-gap-top" id="news">
		<div class="container">
			<div class="row feature_inner">
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-1">
							</div>
						</div>
						<!-- <i class="fi flaticon-compass"></i> -->
						<h4>LED�˶�</h4>
						<p>�� ���� �����ϸ� �����ٿ� �´� LED�˶��� �ڵ�����</p>
						<p>�����ġ �� �ò����� �˶� NO</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-2">
							</div>
						</div>
						<h4>�ڵ� ��� ����</h4>
						<p>�ֺ� ȯ�濡 ���� ��Ⱑ �ڵ�<br> �����Ǿ� �÷� ��ȣ ȿ�� UP</p>
						<p>0~255�ܰ� ��� ���� ����</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-3">
							</div>
						</div>
						<h4>�н� �ð� Ȯ��</h4>
						<p>�ϰ� / �ְ� / ���� �� �н��ð�, ��� �н��ð��� �� ����</p>
						<p>���� / ���� �ð� ���� Ȯ�� ����</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="feature-item">
						<div class="desc-img">
							<div class="desc-img-4">
							</div>
						</div>
						<h4>�н� �ð� ��ŷ</h4>
						<p>
							���� ���� ī�װ��� ȸ������<br>
							�ϰ� / �ְ� / ���� �� �н��ð�
						</p>
						<p>��ŷ Ȯ�� ����</p>
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
						<h2>LED�˶�<br/>����Ʈ���ĵ�</h2>
					</div>
					<div>
						<p>
							���߷� ������ �ֿ������ ����Ʈ���� �鿩�ٺ��� ��! <br>
							����Ʈ���̳� ������ ��ġ ���� ���� �ð� �˶� ������ �����ϰ� <br>
							���� �Ƿε��� �ٿ��� �� �ִ� ����Ʈ���ĵ� <br>
							��Ű���� ����������.
						</p>
					</div>
					<c:choose>
						<c:when test="${empty id}">
							<a href="memberLogin.jsp" class="primary-btn">��ǰ �ֹ��Ϸ� ����</a>
						</c:when>
						<c:when test="${!empty id}">
							<a href="order.jsp" class="primary-btn">��ǰ �ֹ��Ϸ� ����</a>
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
								<h2>��� ����</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<br><br>
									<h4>1. ���� ������</h4>
								</a>
								<p>
									1. ȸ������ �� �н��ð��� ���� �ð��� �����մϴ�. <br>
									2. ���� �н� �ð��� �н� ��Ȳ ���������� Ȯ���� �� �ֽ��ϴ�.
									<br><br><br>
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>2. �����ϱ�</h4>
								</a>
								<p>
									1. �������������� ���� ���� ��ư�� ������ Ÿ�̸Ӱ� �ڵ����� ���۵˴ϴ�. <br>
									2. ������ �н� �ð��� ������, ���� �ð��� �´� ������ �������ϴ�.
									3. ���ΰ� ������, �Ͻ����� ��ư�� ���� �Ϲ� ���ĵ�/�����ó�� ����� �����մϴ�.
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>3. Valkyrie��ǰ</h4>
								</a>
								<p>
									1. ���ĵ忡 ������ ��ư���� �ڵ� ��� ����/���� ��� ���� ��带 ������ �� �ֽ��ϴ�.
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="single-offer">
								<a href="#">
									<h4>4. Ranking ������</h4>
								</a>
								<p>
									1. ��ŷ ������������ �ٸ� ����� �н� �ð��� �� �� �ֽ��ϴ�. <br><br>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start testimonial Area -->
	<section class="testimonial-area relative section-gap-top bg-white" id="testimonial">
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
							<p>
								���� ���� ���η� ���� ������ ���� �������, ���� ������ �� �� ��ǰ�� �־�����
								������ �� ���� ��ġ�� �־����ٵ� ȣȣȣ..
							</p>
							<h4>�迹��</h4>
							<div class="bottom">
								<p>���� & �Ƶ��̳�</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/ej.png" alt="">
						</div>
						<div class="desc">
							<p>
								�鿣�� �ڵ�...���� �������. ������ ������ ���� ���!! �� �� �ɷ�����. �ٸ� ȸ�� �̻�Ե�
								���� ���ּ��� ^^
							</p>
							<h4>������</h4>
							<div class="bottom">
								<p>��ص�</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/dw.png" alt="">
						</div>
						<div class="desc">
							<p>
								�����ϴ� ����鿡�� ���� �����մϴ�. ��ư �� ���� ���νð��� �������ְ�
								�������ִٴ�... �̷� ��ǰ �������ϴ�.
							</p>
							<h4>���ٿ�</h4>
							<div class="bottom">
								<p>�Ƶ��̳�</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/hy.png" alt="">
						</div>
						<div class="desc">
							<p>
								�̰� ����� ���� ��������. �󸶳� �ڽİ��� ��������.... �� ��ǰ�� �ִ� ���
								���ƿ�...�����ϴ�
							</p>
							<h4>������</h4>
							<div class="bottom">
								<p>�Ƶ��̳�</p>
							</div>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="" src="img/testimonial/hj.png" alt="">
						</div>
						<div class="desc">
							<p>
								������ ȥ�� �����ϱ� ���� ������. �׷��� �� ��ǰ�� ���� �����ϸ鼭
								�����Ǵ� �ð��� ��谡 ���� ���̴� ����ο��� ���� �ƾ��!
							</p>
							<h4>������</h4>
							<div class="bottom">
								<p>����Ʈ����</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End testimonial Area -->

	<!-- Start brands Area -->
	
	<!-- End brands Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Creators</h4>
					<ul>
						<li><a href="#">��������</a></li>
						<li><a href="#">��������Ͻ�</a></li>
						<li><a href="#">ũ��������</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Partners</h4>
					<ul>
						<li><a href="#">����Ͻ� ������</a></li>
						<li><a href="#">����� ����</a></li>
						<li><a href="#">������ü ���</a></li>
						
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Developers</h4>
					<ul>
						<li><a href="#">��Ű�� ������ ����</a></li>
						<li><a href="#">���� API</a></li>
						<li><a href="#">���¼ҽ�</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Information</h4>
					<ul>
						<li><a href="#">ȸ��Ұ�</a></li>
						<li><a href="#">�̿���</a></li>
						<li><a href="#">��������ó����ħ</a></li>
					</ul>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Valkyrie &copy;
					<script>document.write(new Date().getFullYear());</script>Valkyrie, inc<i class="fa fa-heart-o" aria-hidden="true"></i>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook-f"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-dribbble"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
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
</body>

</html>