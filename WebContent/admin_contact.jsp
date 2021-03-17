<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>Admin_Q&A</title>

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
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/board.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>

	<!-- Start Header Area -->
	<header class="default-header">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="admin.jsp"> <img
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
						<li><a href="boardList_admin.do">Q&A</a></li>
					</ul>
				</div>
			</div>
			<div class="login-div">
				<a class="login-logout" href="memberLogout.do" onclick="">로그아웃</a>
			</div>
		</nav>
	</header>
	<!-- End Header Area -->

	<!-- Start top-section Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-admin"></div>
		<div class="container">
			<div
				class="row justify-content-between align-items-center text-center banner-content">
				<div class="col-lg-12">
					<h1 class="text-white">Admin</h1>
					<p>Q&A</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End top-section Area -->

	<!--================Contact Area =================-->
	<section class="contact_area section-gap">
		<div class="container QA_board">
			<div class="board">
				<div class="board-list">
					<table class="tg">
						<colgroup>
							<col style="width: 40px">
							<col style="width: 600px">
							<col style="width: 110px">
							<col style="width: 120px">
							<col style="width: 80px">
						</colgroup>
						<thead>
							<tr>
								<th class="tg-baqh">번호</th>
								<th class="tg-baqh">제목</th>
								<th class="tg-baqh">작성자</th>
								<th class="tg-baqh">작성일</th>
								<th class="tg-baqh">답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td class="tg-baqh">${vo.bNum}</td>
									<td class="tg-0lax"><a href="boardContent_answer.do?bNum=${vo.bNum}&a_content='${vo.a_content}'">${vo.title}</a></td>
									<td class="tg-baqh">${vo.nickName}</td>
									<td class="tg-baqh">${fn:substring(vo.writeDate,0,10)}</td>
									<td class="tg-baqh">${vo.a_check}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- <div id="modal-board-text" class="board-modal">
						<div class="board-modal-content">
							<span class="board-close">&times;</span>
							<div class="question-text">
								<div class="btn-div">
									<button class="delete-btn">삭제하기</button>
								</div>
								<div>
									<p>
										<span>작성자 : </span><span id="nickName">도한재</span>
									</p>
									<p id="content">안녕하세요. 궁금한 사항이... 저 배고파서 짜장면 좀 시켜주세요.</p>
								</div>
								<hr>
								<div>
									<p>
										<span>답변 :</span><span>관리자</span>
									</p>
									<p>
										<span>re :</span> <span id="a_content">네 안녕하세요. 저도 배고파요.</span>
									</p>
								</div>
							</div>
						</div>
					</div> -->
				</div>
				<!-- <div class="write">
					<a href="admin_contact_write.html">답변하기</a>
				</div> -->
			</div>
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Previous"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-left"></span>
						</span>
					</a></li>
					<li class="page-item active"><a href="#" class="page-link">01</a></li><!-- 
					<li class="page-item"><a href="#" class="page-link">02</a></li>
					<li class="page-item"><a href="#" class="page-link">03</a></li>
					<li class="page-item"><a href="#" class="page-link">04</a></li>
					<li class="page-item"><a href="#" class="page-link">05</a></li> -->
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Next"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-right"></span>
						</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</section>

	<!--================Contact Success and Error message Area =================-->
	<div id="success" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="ti-close"></i>
					</button>
					<h2>Thank you</h2>
					<p>Your message is successfully sent...</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Modals error -->

	<div id="error" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="ti-close"></i>
					</button>
					<h2>Sorry !</h2>
					<p>Something went wrong</p>
				</div>
			</div>
		</div>
	</div>
	<!--================End Contact Success and Error message Area =================-->

	<!-- Optional JavaScript -->

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
	<script src="js/jquery.validate.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/main.js"></script>
</body>

</html>