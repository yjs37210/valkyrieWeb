<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta charset="UTF-8">
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
	<title>학습현황</title>

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
	<link rel="stylesheet" href="css/d_calendar.css">
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
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-end align-items-center"
					id="navbarSupportedContent">
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

	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row justify-content-between align-items-center text-center banner-content">
				<div class="col-lg-12">
					<h1 class="text-white">학습현황</h1>
					<p>나의 학습현황을 일, 주, 월로 확인할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start top-category-widget Area -->

	<section class="body-category-week section-gap">
		<section class="top-category-widget-area section-gap">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<div class="single-cat-widget">
							<div class="study-board">
								<div class="content relative">
									<div class="overlay study-bg"></div>
									<a href="learningStatus_day.do" target="_self">
										<div class="thumb">
											<img class="content-image img-fluid d-block mx-auto"
												src="img/blog/e_daily.jpg" alt="">
										</div>
										<div class="content-details">
											<h1 class="content-title mx-auto text-uppercase">일간</h1>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="single-cat-widget">
							<div class="study-board">
								<div class="content relative">
									<div class="overlay study-bg"></div>
									<a href="learningStatus_week.do" target="_self">
										<div class="thumb">
											<img class="content-image img-fluid d-block mx-auto"
												src="img/blog/e_weekly.jpg" alt="">
										</div>
										<div class="content-details">
											<h1 class="content-title mx-auto text-uppercase">주간</h1>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="single-cat-widget">
							<div class="study-board">
								<div class="content relative">
									<div class="overlay study-bg"></div>
									<a href="learningStatus_month.do" target="_self">
										<div class="thumb">
											<img class="content-image img-fluid d-block mx-auto"
												src="img/blog/e_monthly.jpg" alt="">
										</div>
										<div class="content-details">
											<h1 class="content-title mx-auto text-uppercase">월간</h1>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="top-week-sec">
			<div class="top-week">
				<h2>${vo.month}</h2>
			</div>
		</section>
		<!-- End top-category-widget Area -->
		<section class="calendar-sec">
			<div class="container-cal">
				<div class="my-calendar clearfix">
					<div class="clicked-date">
						<div class="cal-day"></div>
						<div class="cal-date"></div>
					</div>
					<div class="calendar-box">
						<div class="ctr-box clearfix">
							<button type="button" title="prev" class="btn-cal prev">
							</button>
							<span class="cal-month"></span>
							<span class="cal-year"></span>
							<button type="button" title="next" class="btn-cal next">
							</button>
						</div>
						<table class="cal-table">
							<thead>
								<tr>
									<th>S</th>
									<th>M</th>
									<th>T</th>
									<th>W</th>
									<th>T</th>
									<th>F</th>
									<th>S</th>
								</tr>
							</thead>
							<tbody class="cal-body"></tbody>
						</table>
					</div>
				</div>
				<div class="study-time" border='1'>
					<div class="study-time-e">
						<p>총 공부시간</p>
						<input type="text" id="mTime" value="${vo.mTime}" readonly>
					</div>
					<div class="study-time-e">
						<p>평균 공부시간</p>
						<input type="text" id="avgMTime" value="${vo.avgMTime}" readonly>
					</div>
				</div>
				<!-- // .my-calendar -->
			</div>
		</section>
		<!-- Start post-content Area -->
		<section class="post-content-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 posts-list">
						<div class="single-post row ">
							<div class="study-title">
								<h2>월간 날짜별 공부시간</h2>
							</div>
							<div class="col-lg-9 col-md-9 ">
								<div class="feature-img chart-e">
									<canvas id="myChart"></canvas>
								</div>
							</div>
						</div>
						<div class="single-post row">
							<div class="study-title">
								<h2>공부 / 쉬는 시간 비율</h2>
							</div>
							<div class="col-lg-9 col-md-9">
								<div class="feature-img chart-e">
									<canvas id="myChart2"></canvas>
								</div>
								<div class="chart-textdiv">
									<div class="chart-ratio">
										<h3>
											<p id="mTime2" class="excert e1">공부 시간 : ${vo.mTime }</p>
										</h3>
									</div>
									<div class="chart-ratio">
										<h3>
											<p id="restMTime" class="excert e2">쉬는 시간 : ${vo.restMTime }</p>
										</h3>
									</div>
								</div>
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
					<script>document.write(new Date().getFullYear());</script>
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
	<script>
	let arr = [];
	for(let i = 1; i <= '${dataList.size()}'; i++){
		arr[i-1] = i;
	}
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type: 'bar',

			// The data for our dataset
			data: {
				labels: arr,
				datasets: [{
					label: '일',
					backgroundColor: 'rgb(255, 99, 132)',
					// '#ff7473',
					borderColor: '#fff',
					//data: '${data}'
					data: ['${data[0]}', '${data[1]}','${data[2]}','${data[3]}','${data[4]}','${data[5]}','${data[6]}','${data[7]}','${data[8]}','${data[9]}','${data[10]}','${data[11]}','${data[12]}',
						'${data[13]}','${data[14]}','${data[15]}','${data[16]}','${data[17]}','${data[18]}','${data[19]}','${data[20]}','${data[21]}','${data[22]}',
						'${data[23]}','${data[24]}','${data[25]}','${data[26]}','${data[27]}','${data[28]}','${data[29]}', '${data[30]}']
				}] 
			},

			// Configuration options go here
			options: {}
		});
	</script>
	<script>
	
		var ctx = document.getElementById('myChart2').getContext('2d');
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type: 'pie',

			// The data for our dataset
			data: {
				labels: ['공부 시간', '쉬는 시간'],
				datasets: [{
					label: '공부 / 쉬는 시간 비율',
					backgroundColor: ['rgb(255, 99, 132)', '#FDD692'],
					borderColor: '#fff',
					//data: [3, 5]
					data: ['${vo.mSec}', '${vo.restMSec}']
				}]
			},

			// Configuration options go here
			options: {}
		});
	</script>
	<script>
		// 캘린더 
		// ================================
		// START YOUR APP HERE
		// ================================
		const init = {
			monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
			today: new Date(),
			monForChange: new Date().getMonth(),
			activeDate: new Date(),
			getFirstDay: (yy, mm) => new Date(yy, mm, 1),
			getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
			nextMonth: function () {
				let d = new Date();
				d.setDate(1);
				d.setMonth(++this.monForChange);
				this.activeDate = d;
				return d;
			},
			prevMonth: function () {
				let d = new Date();
				d.setDate(1);
				d.setMonth(--this.monForChange);
				this.activeDate = d;
				return d;
			},
			addZero: (num) => (num < 10) ? '0' + num : num,
			activeDTag: null,
			getIndex: function (node) {
				let index = 0;
				while (node = node.previousElementSibling) {
					index++;
				}
				return index;
			}
		};

		const $calBody = document.querySelector('.cal-body');
		const $btnNext = document.querySelector('.btn-cal.next');
		const $btnPrev = document.querySelector('.btn-cal.prev');

		/**
		 * @param {number} date
		 * @param {number} dayIn
		*/
		function loadDate(date, dayIn) {
			document.querySelector('.cal-date').textContent = date;
			document.querySelector('.cal-day').textContent = init.dayList[dayIn];
		}

		/**
		 * @param {date} fullDate
		 */
		function loadYYMM(fullDate) {
			let yy = fullDate.getFullYear();
			let mm = fullDate.getMonth();
			let firstDay = init.getFirstDay(yy, mm);
			let lastDay = init.getLastDay(yy, mm);
			let markToday;  // for marking today date

			if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
				markToday = init.today.getDate();
			}

			document.querySelector('.cal-month').textContent = init.monList[mm];
			document.querySelector('.cal-year').textContent = yy;

			let trtd = '';
			let startCount;
			let countDay = 0;
			for (let i = 0; i < 6; i++) {
				trtd += '<tr>';
				for (let j = 0; j < 7; j++) {
					if (i === 0 && !startCount && j === firstDay.getDay()) {
						startCount = 1;
					}
					if (!startCount) {
						trtd += '<td>'
					} else {
						let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
						trtd += '<td class="day';
						trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
						trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
					}
					trtd += (startCount) ? ++countDay : '';
					if (countDay === lastDay.getDate()) {
						startCount = 0;
					}
					trtd += '</td>';
				}
				trtd += '</tr>';
			}
			$calBody.innerHTML = trtd;
		}

		/**
		 * @param {string} val
		 */
		function createNewList(val) {
			let id = new Date().getTime() + '';
			let yy = init.activeDate.getFullYear();
			let mm = init.activeDate.getMonth() + 1;
			let dd = init.activeDate.getDate();
			
			const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

			let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

			let eventData = {};
			eventData['date'] = date;
			eventData['memo'] = val;
			eventData['complete'] = false;
			eventData['id'] = id;
			init.event.push(eventData);
			$todoList.appendChild(createLi(id, val, date));
		}

		loadYYMM(init.today);
		loadDate(init.today.getDate(), init.today.getDay());

		$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
		$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

		$calBody.addEventListener('click', (e) => {
			if (e.target.classList.contains('day')) {
				if (init.activeDTag) {
					init.activeDTag.classList.remove('day-active');
				}
				let day = Number(e.target.textContent);
				let id = new Date().getTime() + '';
				let yy = init.activeDate.getFullYear();
				let mm = init.activeDate.getMonth() + 1;
				var ctx1 = document.getElementById('myChart2').getContext('2d');
				//var ctx = document.getElementById('myChart').getContext('2d');
				$(function(){
					$.ajax({
						url:'mSTimeStatistics.do?yy='+yy+'&mm='+mm+'&day='+day,
						dataType:'json',
						success:function(result){
							console.log(result);
							$('#mTime').val(result.mTime);
							$('#avgMTime').val(result.avgMTime);
							$('#mTime2').html('공부 시간 : '+result.mTime);
							$('#restMTime').html('쉬는 시간 : '+result.restMTime);
							
							var chart = new Chart(ctx1, {
								// The type of chart we want to create
								type: 'pie',

								// The data for our dataset
								data: {
									labels: ['공부 시간', '쉬는 시간'],
									datasets: [{
										label: '공부 / 쉬는 시간 비율',
										backgroundColor: ['rgb(255, 99, 132)', '#FDD692'],
										// backgroundColor: ['#EC7357', '#FDD692'],
										// rgb(255, 99, 132)
										borderColor: '#fff',
										// 퍼센테이지로 뽑아야할 듯.
										data: [result.mSec, result.restMSec]
									}]
								},

								// Configuration options go here
								options: {}
							});
						},
						error:function(){
							$('#mTime').val('00:00:00');
							$('#avgMTime').val('00:00:00');
							$('#mTime2').html('공부 시간 : 00:00:00');
							$('#restMTime').html('쉬는 시간 : 00:00:00');
							var chart = new Chart(ctx1, {
								// The type of chart we want to create
								type: 'pie',

								// The data for our dataset
								data: {
									labels: ['공부 시간', '쉬는 시간'],
									datasets: [{
										label: '공부 / 쉬는 시간 비율',
										backgroundColor: ['rgb(255, 99, 132)', '#FDD692'],
										// backgroundColor: ['#EC7357', '#FDD692'],
										// rgb(255, 99, 132)
										borderColor: '#fff',
										// 퍼센테이지로 뽑아야할 듯.
										data: [0, 0]
									}]
								},

								// Configuration options go here
								options: {}
							});
							
						}
					});
				});
				var ctx2 = document.getElementById('myChart').getContext('2d');
				$(function(){
					$.ajax({
						url:'mSTimeStatisticsAjax.do?yy='+yy+'&mm='+mm+'&day='+day,
						dataType:'json',
						success:function(result){
							let dayArr = [];
							var lastDay = ( new Date(yy, mm, 0) ).getDate();
							for(let i = 1; i <= Number(lastDay); i++){
								dayArr[i-1] = i;
							}
							let dataArr = [];
							for(let i = 0; i < 31; i++){
								dataArr[i] = result[i].dSec;
							}
							
							var chart = new Chart(ctx2, {
								// The type of chart we want to create
								type: 'bar',

								// The data for our dataset
								data: {
									labels: dayArr,
									datasets: [{
										label: '일',
										backgroundColor: 'rgb(255, 99, 132)',
										// '#ff7473',
										borderColor: '#fff',
										data: dataArr
										}] 
								},

								// Configuration options go here
								options: {
									responsive: false,
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
												fontSize : 14,
											}
										}]
									}
									
								}
							});
					},
					error:function(){
						alert('실패');
					}
				});
			});
				loadDate(day, e.target.cellIndex);
				e.target.classList.add('day-active'); 
				init.activeDTag = e.target;
				init.activeDate.setDate(day);
				reloadTodo();
			}
		});
	</script>
</body>

</html>