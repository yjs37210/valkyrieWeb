<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.ArrayList" %>
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
	<title>Rank</title>

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
	<link rel="stylesheet" href="css/table.css">
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
								<a class="dropdown-item" href="timeSetSelect.do">�����ϱ�</a>
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
					<h1 class="text-white">��ŷ</h1>
					<p>���� �н� �ð��� �ٸ� ����� ���غ�����!</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start post-content Area -->
	<section class="post-content-area">
		<div class="container">

			<div class="row">
				<div class="rank-title">
					<div class="rank-title-e">
						<h1>���� ����</h1>
					</div>
					<div class="rank-title-c">
						<a href="ranking_day.do"><div class="rank-day"><h2>�ϰ�</h2></div></a>
						<a href="ranking_week.do"><div class="rank-day"><h2>�ְ�</h2></div></a>
						<a href="ranking_month.do"><div class="rank-day"><h2>����</h2></div></a>
					</div>
					<div class="rank-title-b">
						<div><img id="left" src="./img/do_icon/left.png" alt=""></div>
						<span><h3><span id='month'>${month}</span></h3></span>
						<div><img id="right" src="./img/do_icon/right.png" alt=""></div>
					</div>
				</div>
				<div class="col-lg-8 posts-list">
					<div class="rank-list">
						<table class="tg">
							<colgroup>
							<col style="width: 86px">
							<col style="width: 150px">
							<col style="width: 385px">
							</colgroup>
							<thead>
							  <tr>
								<th class="tg-u2hj" rowspan="2">����</th>
								<th class="tg-u2hj" rowspan="2">�г���</th>
								<th class="tg-u2hj" rowspan="2">�н� �ð�</th>
							  </tr>
							  <tr>
							  </tr>
							</thead>
							<tbody id="rankingList">
							 <c:forEach var="vo" items="${list}">
							  <tr>
								<td class="tg-3yw0">${vo.rank}</td>
								<td class="tg-s3eb">${vo.nickName}</td>
								<td class="tg-3yw0">${vo.mTime}</td>
							  </tr>
							 </c:forEach>
							</tbody>
							</table>
					</div>
				</div>
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
					
						<div class="single-sidebar-widget popular-post-widget">
							<h4 class="popular-title">���� �ٷ� �����ϼ���!</h4>
							<div class="popular-post-list">
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="img/blog/pp1.jpg" alt="">
									</div>
									<div class="details">
										<a href="order.jsp">
											<h6>���� �ֹ� �� �ϼ̳���?</h6>
										</a>
										<p>�ֹ� ������</p>
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="img/blog/pp2.jpg" alt="">
									</div>
									<div class="details">
										<a href="desc.jsp">
											<h6>��� ����� �𸣽ó���?</h6>
										</a>
										<p>��ǰ�Ұ� ������</p>
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="img/blog/pp3.jpg" alt="">
									</div>
									<div class="details">
										<a href="boardList.do">
											<h6>�𸣴� �κ��� �ֳ���?</h6>
										</a>
										<p>Q&A ������</p>
									</div>
								</div>
								<div class="single-post-list d-flex flex-row align-items-center">
									<div class="thumb">
										<img class="img-fluid" src="img/blog/pp4.jpg" alt="">
									</div>
									<div class="details">
										<a href="timeSetSelect.do">
											<h6>���νð��� �����ϳ���?</h6>
										</a>
										<p>�����ϱ� ������</p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="single-sidebar-widget post-category-widget">
							<h4 class="category-title">Most Catgories</h4>
							<ul class="cat-list">
								<c:forEach var="ctgryVo" items="${ctgryList}">
								<li>
									<span class="d-flex justify-content-between">
										<p>${ctgryVo.ctgry}</p>
										<p>${ctgryVo.ctgryNum }</p>
									</span>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="single-sidebar-widget tag-cloud-widget">
							<h4 class="tagcloud-title">#ȿ������ ����,#���� �����ϱ�</h4>
							<ul>
								<li><a href="#">#���� �̷��� �����ߴ�.</a></li>
								<li><a href="#">#30���� ����</a></li>
								<li><a href="#">#50..���� ���� ���� �ʾҴ�</a></li>
								<li><a href="#">#���� �����ϴ� ���</a></li>
								<li><a href="#">#���� ������ ȯ��</a></li>
								<li><a href="#">#���̾ ������</a></li>
								<li><a href="#">#����! �� �̷��� �ߴ�</a></li>
								<li><a href="#">#���� ��� ����</a></li>
								<li><a href="#">#������ ��ũ�� ��Ʈ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	$(function(){
		$('#left').on('click',function(){
			$.ajax({
				url:'ranking_monthAjax.do?direction=left&month='+$('#month').html(),
				dataType:'json',
				success:function(list){
					console.log(list[0].rank);
					let html = '';
					 for(let i = 0; i < list.length; i++){
						 html += '<tr>';
						 html += '<td class="tg-3yw0">'+list[i].rank+'</td>';
						 html += '<td class="tg-s3eb">'+list[i].nickName+'</td>';
						 html += '<td class="tg-3yw0"> '+list[i].mTime+'</td>';
						 html += '</tr>';
					 }
					 console.log(html);
					 $('#rankingList').html(html);
					 $('#month').html(list[0].month);
					//console.log( $('#rankList').html()); 
				},
				error:function(){
					
				}
			});
		});
	});  
	$(function(){
		$('#right').on('click',function(){
			$.ajax({
				url:'ranking_monthAjax.do?direction=right&month='+$('#month').html(),
				dataType:'json',
				success:function(list){
					console.log(list[0].rank);
					let html = '';
					 for(let i = 0; i < list.length; i++){
						 html += '<tr>';
						 html += '<td class="tg-3yw0">'+list[i].rank+'</td>';
						 html += '<td class="tg-s3eb">'+list[i].nickName+'</td>';
						 html += '<td class="tg-3yw0"> '+list[i].mTime+'</td>';
						 html += '</tr>';
					 }
					 console.log(html);
					 $('#rankingList').html(html);
					 $('#month').html(list[0].month);
					//console.log( $('#rankList').html()); 
				},
				error:function(){
					
				}
			});
		});
	});  
	</script>
	
	
</body>

</html>