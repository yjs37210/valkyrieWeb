<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  <link rel="stylesheet" href="css/admin.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>

<body>

  <!-- Start Header Area -->
  <header class="default-header">
    <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container">
        <a class="navbar-brand" href="admin.jsp">
          <img src="img/logo.png" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="fa fa-bars"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
          <ul class="navbar-nav">
            <li><a href="boardList_admin.do">Q&A</a></li>
          </ul>
        </div>
      </div>
      <div class="login-div">
        <a class="login-logout" href="memberLogout.do" onclick="">�α׾ƿ�</a>
      </div>
    </nav>
  </header>
  <!-- End Header Area -->

  <!-- Start top-section Area -->
  <section class="banner-area relative">
    <div class="overlay overlay-admin"></div>
    <div class="container">
      <div class="row justify-content-between align-items-center text-center banner-content">
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
    <div class="row">
      <div class="col-md-7 mb-5">



        <form action="boardAnswerContent.do" class="p-5 bg-white" method="get">
		<input type="hidden" name="bNum" value="${vo.bNum}">
          <h2 class="h4 text-black mb-5">���� ����</h2>

          <div class="row form-group name">
            <div class="col-md-6 mb-3 mb-md-0">
              <label class="text-black" for="fname">�г���</label>
              <input type="text" id="fname" class="form-control" value="${vo.nickName}" readonly>
            </div>
          </div>

          <div class="row form-group">

            <div class="col-md-12">
              <label class="text-black" for="email">�̸���</label>
              <input type="email" id="email" class="form-control" value="${vo.bEmail }" readonly>
            </div>
          </div>

          <div class="row form-group">

            <div class="col-md-12">
              <label class="text-black" for="subject">����</label>
              <input type="subject" id="subject" class="form-control" value="${vo.title}" readonly>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-md-12">
              <label class="text-black" for="message">����</label>
              <textarea name="content" id="message" cols="30" rows="7" class="form-control" 
                readonly>${vo.content}</textarea>
            </div>

            <div class="col-md-12">
              <hr>
              <label class="text-black" for="message">�亯</label>
              <textarea id="message" cols="30" rows="7" class="form-control"
                name="a_content">${vo.a_content}</textarea>
                <!--  placeholder="������ ��������" -->
            </div>
          </div>
		
          <div class="row form-group">
            <div class="col-md-12">
              <input type="submit" value="����ϱ�" class="btn btn-primary btn-md submit">
              <a href="boardList_admin.do" class="btn btn-primary btn-md submit">���ư���</a>
            </div>
          </div>


        </form>
      </div>
    </div>

  </section>
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