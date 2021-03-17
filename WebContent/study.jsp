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
	<title>Study</title>

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
	<!-- JS -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	
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
						<li><a href="learningStatus_day.do">�н���Ȳ</a></li>
						<!-- <li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								�н���Ȳ
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="projects.html">Projects</a>
								<a class="dropdown-item" href="elements.html">Elements</a>
							</div>
						</li> -->
						<li><a href="ranking_day.do">��ŷ</a></li>
						<li><a href="boardList.do">Q&A</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
								My page
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="study.do">�����ϱ�</a>
							</div>
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

	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row justify-content-between align-items-center text-center banner-content">
				<div class="col-lg-12">
					<h1 class="text-white">�����ϱ�</h1>
					<p>���� ��Ű���� �����ؼ� ���� ���θ� �����غ���!</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start top-category-widget Area -->
	<section class="study-arduino">
		<section class="top-category-widget-area section-gap">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<div class="single-cat-widget">
							<div class="content relative">
								<div class="overlay overlay-bg"></div>
								
									<div class="thumb">
										<img class="content-image img-fluid d-block mx-auto"
											src="img/blog/single_mode.gif" alt="">
									</div>
									<div class="content-details">
										<h4 class="content-title mx-auto text-uppercase">�ð� ����</h4>
										<span></span>
										<p>�� �� ���� �ð���� ���θ� �ؿ�!</p>
									</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End top-category-widget Area -->

		<!-- Start post-content Area -->
		<section class="post-content-area">
			<div class="container container1">
				<div class="row-input">
					<div class="col-lg-8 posts-list">
						<div class="single-post row">
							<div class="col-lg-9 col-md-9 ">
								<div class="study-countTime">
									<div class="study-countTime-e">
									<h2>
										<label for="countTime">���νð�</label>
									</h2>
										<h1>
										<input type="text" id="countTime" readonly>
									</h1>
								</div>
								<div class="study-countTime-e">
									<h2>
										<label for="countTime">���½ð�</label>
									</h2>
										<h1>
										<input type="text" id="re-countTime" readonly>
									</h1>
								</div>
								</div>
								<form class="" action="#">
									<div class="study-input">
										<div class="study-input-e01">
											<label for="studyMin"><strong>���νð� �Է�(��) :</strong></label>
											<input name="studyMin" type="number" id="time" value="${vo.studyMin}">
												<!-- onfocus="this.placeholder = ''"
												> -->
										</div>
										<div class="study-input-e01">
											<label for="restMin"><strong>���½ð� �Է�(��) :</strong></label>
											<input name="restMin" type="number" id="re-time" value="${vo.restMin}">
										</div>
									</div>
									<div class="study-rect">
										<div class="study-rect-btn">
											<input type="button" id="start_btn" class="study-btn" onclick="fncCountDown()"
												value="���ν����ϱ�">
											<!-- <button type="submit" class="study-btn" onclick="fncCountDown()">���ν����ϱ�</button> -->
										</div>
										<div class="study-rect-btn">
											<input type="button" class="study-btn" value="���������ϱ�" onclick="location.href='uSTime.do?study=study0'">
											<!-- <button type="submit" class="study-btn">���������ϱ�</button> -->
										</div>
									</div>
								</form>
								<p class="excert">
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!-- End post-content Area -->

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
	<script type="text/javascript">

		var min = 0;
		var sec = 0;
		var time = 0;
		var runCount;

		var re_min = 0;
		var re_sec = 0;
		var re_time = 0;
		var re_runCount;

		var check = 1;

		// ���� �Լ� ȣ�� ��
		function fncCountDown() {

			console.log("start!!");

			// �Է� �� ����
			time = $("#time").val();
			time = parseInt(time * 60);

			re_time = $("#re-time").val();
			re_time = parseInt(re_time * 60);

			console.log(time);
			if (time > 0) {
				runCount = setInterval("startCountDown()", 1000);
				if (check === 2) {
					re_runCount = setInterval("startCountDown()", 1000);
				}
			} else {
				alert("���� �Է� �� �ּ���");
				return;

			}
			
			var nickName = "${nickName}";
			var studyMin = "${vo.studyMin}";
			var restMin = "${vo.restMin}";
			console.log(nickName);
			console.log(studyMin);
			console.log(restMin);
			
			// ���� ���� �ְ�ް� �Ϸ��� submit > ��â
			$.ajax({
				url:'timeSetInsert.do?studyMin='+$("#time").val()+'&restMin='+$("#re-time").val(),
				
				success:function(){
					
				},
				error:function(){
				
				}
			});
			
			var start_btn = document.getElementById('start_btn');
			start_btn.disabled='disabled';
			
		}

		// ī��Ʈ �ٿ� �� �����ϱ�
		function startCountDown() {

			// hour = parseInt(time/3600);
			//   time = parstInt(time*60);
			min = parseInt(time / 60);
			sec = time % 60;

			re_min = parseInt(re_time / 60);
			re_sec = re_time % 60;

			// document.getElementById("countTime").innerHTML = min + " : " + sec;
			$("#countTime").val(min + " : " + sec);
			$("#re-countTime").val(re_min + " : " + re_sec);

			// �ð��� �� ���� �� timer ����
			if (parseInt(time) == 0) {
				stopCountDown();

			} else {
				time--;
			}

			
			
		}
		// Ÿ�̸� ����
		function stopCountDown() {
			console.log("clearInterval");
			clearInterval(runCount);
			if(re_time>0){
				re_runCount = setInterval("restCountDown()", 1000);
			}
		}
		function restCountDown() {

			re_min = parseInt(re_time / 60);
			re_sec = re_time % 60;

			$("#re-countTime").val(re_min + " : " + re_sec);

			// �ð��� �� ���� �� timer ����
			if (parseInt(re_time) == 0) {
				restStopCountDown();
			} else {
				re_time--;
			}

		}
		function restStopCountDown() {
			console.log("re_clearInterval");
			clearInterval(re_runCount);
		}


	</script>
</body>

</html>