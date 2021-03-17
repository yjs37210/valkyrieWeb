<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--jsonarray_send.jsp--%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
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
	<title>Q&A</title>

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
  <link rel="stylesheet" href="css/board.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  
</head>

<body>

	<!-- Start Header Area -->
	<header class="default-header">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">
					<img src="img/logo.png" alt="">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
				 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li><a class="active" href="index.jsp">홈</a></li>
						<li><a href="desc.jsp">제품소개</a></li>
						<li><a href="learningStatus_day.do">학습현황</a></li>
						<!-- <li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								학습현황
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="projects.html">Projects</a>
								<a class="dropdown-item" href="elements.html">Elements</a>
							</div>
						</li> -->
						<li><a href="ranking_day.do">랭킹</a></li>
						<li><a href="boardList.do">Q&A</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								My page
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="timeSetSelect.do">공부하기</a>
							</div>
						</li>
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

	<!-- Start top-section Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row justify-content-between align-items-center text-center banner-content">
				<div class="col-lg-12">
					<h1 class="text-white">Q&A</h1>
					<p>궁금한 부분을 물어보세요. 친절하게 답변해드립니다.</p>
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
                <td class="tg-0lax"><a href="boardContent_answer.do?bNum=${vo.bNum}">${vo.title}</a></td>
                <td class="tg-baqh">${vo.nickName}</td>
                <td class="tg-baqh">${vo.writeDate}</td>
                <td class="tg-baqh">${vo.a_check}</td>
              </tr>
              </c:forEach>
            </tbody>
            </table>
            <div class="write">
            <a href="contact_write.jsp">글쓰기</a>
          </div>
          </div>
            
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
    <!--================Contact Area =================-->

    <!--================ start footer Area  =================-->
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
    <!--================ End footer Area  =================-->

    <!--================Contact Success and Error message Area =================-->
    <div id="success" class="modal modal-message fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
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
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="js/gmaps.min.js"></script>
    <script src="js/contact.js"></script>
  <script src="js/main.js"></script>
  <script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'bar',
        // bar, pie, line

        // The data for our dataset
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'My First dataset',
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: [0, 10, 5, 2, 20, 30, 45]
            }]
        },

        // Configuration options go here
        options: {}
    });
</script>
</body>

</html>