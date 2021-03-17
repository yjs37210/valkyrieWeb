<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <title>Q&A_Register</title>

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
            <c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">학습현황</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="learningStatus_day.do">학습현황</a></li>
							</c:when>
						</c:choose>
            <c:choose>
							<c:when test="${empty id}">
									<li><a href="memberLogin.jsp">랭킹</a></li>
							</c:when>
							<c:when test="${!empty id}">
									<li><a href="ranking_day.do">랭킹</a></li>
							</c:when>
						</c:choose>
            <li><a href="boardList.do">Q&A</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                My page
              </a>
              <div class="dropdown-menu">
                <c:choose>
									<c:when test="${empty id}">
											<a class="dropdown-item" href="memberLogin.jsp">공부하기</a>  
									</c:when>
									<c:when test="${!empty id}">
											<a class="dropdown-item" href="timeSetSelect.do">공부하기</a>  
									</c:when>
								</c:choose>              </div>
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
    <div class="container">
      <div class="row mb-5">
        <div class="col-12 text-center">
          <!-- <h3 class="section-sub-title">Get</h3> -->
          <h2 class="section-title mb-3">문의하기</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-7 mb-5">



          <form action="boardInsert.do" class="p-5 bg-white" method="post">

            <h2 class="h4 text-black mb-5">문의 내용</h2>

            <div class="row form-group">
              <div class="col-md-6 mb-3 mb-md-0">
                <label class="text-black" for="fname">닉네임</label>
                <input type="text" id="fname" name="nickName" class="form-control" value="${nickName}" readonly>
              </div>
              <div class="col-md-6">
                <label class="text-black" for="lname">비밀번호</label>
                <input type="password" id="lname" class="form-control" name="bPw">
              </div>
            </div>

            <div class="row form-group">

              <div class="col-md-12">
                <label class="text-black" for="email">이메일</label>
                <input type="email" id="email" class="form-control" name="bEmail">
              </div>
            </div>

            <div class="row form-group">

              <div class="col-md-12">
                <label class="text-black" for="subject">제목</label>
                <input type="subject" id="subject" class="form-control" name="title">
              </div>
            </div>

            <div class="row form-group">
              <div class="col-md-12">
                <label class="text-black" for="message">내용</label>
                <textarea name="content" id="message" cols="30" rows="7" class="form-control"
                  placeholder="내용을 적으세요" ></textarea>
              </div>
            </div>

            <div class="row form-group">
              <div class="col-md-12">
                <input type="submit" value="등록하기" class="btn btn-primary btn-md submit">
                <a href="boardList.do" class="btn btn-primary btn-md submit">돌아가기</a>
              </div>
            </div>


          </form>
        </div>
      </div>
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
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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