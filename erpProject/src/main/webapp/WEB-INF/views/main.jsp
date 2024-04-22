<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<title>ERP PROJECT</title>

<!-- Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="assets/css/nucleo-svg.css" rel="stylesheet" />

<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
<!-- Google Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
</head>
<body>
	<div class="min-height-300 position-absolute w-100" style="background-color: #1a237e;"></div>
	<!-- Sidebar -->
	<%@ include file="./sidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Header -->
		<%@ include file="./header.jsp"%>
		<div class="comm-body container-fluid py-4">
			<div class="card card-profile-bottom mt-4">
				<div class="card-body p-3">
					<div class="row">
						<div class="col-auto">
							<div class="avatar avatar-xl position-relative">
								<img src="../assets/img/member/member8.jpg" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
							</div>
						</div>
						<div class="col-4 my-auto">
							<div class="h-100">
								<h5 class="mb-1">${empName}</h5>
								<p class="mb-0 font-weight-bold text-sm">
									 <c:choose>
						                <c:when test="${deptNo=='100'}">미정</c:when>
						                <c:when test="${deptNo=='101'}">경영팀</c:when>
						                <c:when test="${deptNo=='102'}">인사팀</c:when>
						                <c:when test="${deptNo=='103'}">구매팀</c:when>
						                <c:when test="${deptNo=='104'}">생산팀</c:when>
						                <c:when test="${deptNo=='105'}">물류팀</c:when>
						                <c:when test="${deptNo=='106'}">영업팀</c:when>
						            </c:choose>
								</p>		
							</div>
						</div>
						<div class="col-lg-4 align-items-center my-auto ms-auto justify-content-end d-flex">
							<button type="button" class="btn btn-lg" onclick="location.href='/'" style="margin: 12px; backgroud-color: #f6f9fc">
								<i class="ni ni-folder-17"></i><span class="ms-2 fw-semibold">일반</span>
							</button>
							<c:if test="${sessionScope.emp_role eq 'role_admin'}" var="empRole">
								<button type="button" class="btn btn-lg btn-primary btn-tooltip" onclick="location.href='/adminHome'"
									data-bs-toggle="tooltip" data-bs-placement="bottom" title="관리자만 접근 가능한 페이지입니다." data-container="body"
									data-animation="true" style="max-width: 300px; white-space: nowrap; margin: 12px; background-color: transparent; background-image: linear-gradient(310deg, #141727, #3A416E);">
									<i class="ni ni-key-25"></i><span class="ms-2 fw-semibold">관리자</span>
							</button>
							</c:if>
							<c:if test="${sessionScope.emp_role ne 'role_admin'}" var="empRole">
								<button type="button" class="btn btn-lg btn-primary btn-tooltip" onclick="message()"
									data-bs-toggle="tooltip" data-bs-placement="bottom" title="관리자만 접근 가능한 페이지입니다." data-container="body"
									data-animation="true" style="max-width: 300px; white-space: nowrap; margin: 12px; background-color: transparent; background-image: linear-gradient(310deg, #141727, #3A416E);">
									<i class="ni ni-key-25"></i><span class="ms-2 fw-semibold">관리자</span>
							</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-lg-7 mb-lg-0 mb-4">
					<div class="card z-index-2 h-100">
						<div class="card-header pb-0 pt-3 bg-transparent">
							<h6 class="text-capitalize">Department Team overview</h6>
							<p class="text-sm mb-0">
								<i class="fa fa-arrow-up text-success" aria-hidden="true"></i>
								<span class="font-weight-bold">4% more</span> in 2023
							</p>
						</div>
						<div class="card-body p-3">
							<div class="chart">
								<canvas id="chart-line" class="chart-canvas" height="375" width="606"
									style="display: block; box-sizing: border-box; height: 300px; width: 485.1px;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="card card-carousel overflow-hidden h-100 p-0">
						<div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
							<div class="carousel-inner border-radius-lg h-100">
								<div class="carousel-item h-100 active" data-bs-interval="2000" style="background-image: url('../assets/img/member/member1.jpg'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/truenpeace">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10" ></i>
											</div>
										</a>
										<h5 class="text-white mb-1">안재준</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
								<div class="carousel-item h-100" data-bs-interval="2000" style="background-image: url('../assets/img/member/member2.png'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/0ohsk">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10"></i>
											</div>
										</a>
										<h5 class="text-white mb-1">유현석</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
								<div class="carousel-item h-100" data-bs-interval="2000" style="background-image: url('../assets/img/member/member4.png'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/shippea">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10"></i>
											</div>
										</a>
										<h5 class="text-white mb-1">이현승</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
								<div class="carousel-item h-100" data-bs-interval="2000" style="background-image: url('../assets/img/member/member5.png'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/saelip">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10"></i>
											</div>
										</a>
										<h5 class="text-white mb-1">이새잎</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
								<div class="carousel-item h-100" data-bs-interval="2000" style="background-image: url('../assets/img/member/member6.png'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/kyungmiyu">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10"></i>
											</div>
										</a>
										<h5 class="text-white mb-1">유경미</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
								<div class="carousel-item h-100" data-bs-interval="2000" style="background-image: url('../assets/img/member/member7.png'); background-size: cover;">
									<div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
										<a href="https://github.com/minjjing0">
											<div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
												<i class="ni ni-single-02 text-dark opacity-10"></i>
											</div>
										</a>
										<h5 class="text-white mb-1">노민경</h5>
										<p>멤버의 정보가 궁금하다면 클릭해주세요</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="card-group mt-4">
				<div class="card">
					<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1"></div>
					<div class="card-body pt-2">
						<span class="text-gradient text-primary text-uppercase text-s font-weight-bold my-2">Environment</span>
						<p class="card-title h5 d-block text-darker mt-2">Shared Coworking</p>
						<div class="author align-items-center">
							<img src="https://demos.creative-tim.com/test/soft-ui-dashboard-pro/assets/img/office-dark.jpg" class="img-fluid border-radius-lg">
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1"></div>
					<div class="card-body pt-2">
						<span class="text-gradient text-primary text-uppercase text-s font-weight-bold my-2">Contacts</span>
						<p class="card-title h5 d-block text-darker mt-1">Address</p>
						<p>서울 신촌</p>
						<p class="card-title h5 d-block text-darker">Calls</p>
						<p> +1 5589 55488 55 <br> +1 6678 254445 41 </p>
						<p class="card-title h5 d-block text-darker">Email</p>
						<p>chongang@autosoft.com</p>
						<div class="author align-items-center"></div>
					</div>
				</div>

				<div class="card">
					<div class="card-header p-0 mx-3 mt-3 position-relative z-index-1"></div>
					<div class="card-body pt-2">
						<span class="text-gradient text-primary text-uppercase text-s font-weight-bold my-2">Profile</span>
						<div class="card card-plain text-center mt-1"></div>
						<div class="text-center">
							<img class="avatar avatar-xxl shadow" src="../assets/img/member/ceo1.jpg">
						</div>
						<div class="card-body">
							<h4 class="card-title">강태광</h4>
							<h6 class="category text-info text-gradient">CEO / TK COMPANY</h6>
							<p class="card-description">"여러분의 일은 삶의 대부분을 차지할 것입니다.  
							<p>그리고 만족스런 삶을 살 수 있는 유일한 방법은 자신에게 훌륭한 것이라 생각되는 일을 하는 것입니다.</p>
							<p>그리고 훌륭한 일을 하는 유일한 방법은 여러분이 하는 일을 사랑하는 것입니다."</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="./footer.jsp"%>
	</main>
	<!--   Back to Top   -->
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2" href="#">
			<i class="ni ni-bold-up"></i>
		</a>
	</div>

	<!--   Core JS Files   -->
	<script src="./assets/js/core/popper.min.js"></script>
	<script src="./assets/js/core/bootstrap.min.js"></script>
	<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/chartjs.min.js"></script>
	<script src="assets/js/plugins/chartjs.min.js"></script>
	<script>
		var ctx1 = document.getElementById("chart-line").getContext("2d");

		var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

		gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
		gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
		gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
		new Chart(ctx1, {
			type : "line",
			data : {
				labels : [ "경영팀", "인사팀", "구매팀", "생산팀", "물류팀", "영업팀" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0.4,
					borderWidth : 0,
					pointRadius : 0,
					borderColor : "#5e72e4",
					backgroundColor : gradientStroke1,
					borderWidth : 3,
					fill : true,
					data : [ 150, 300, 220, 450, 250, 400, 230 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#fbfbfb',
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#ccc',
							padding : 20,
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
		function message() {
			alert("접근 권한이 없습니다. 관리자에게 문의하세요");
		}
		
		/*
 		function message() {
			$.ajax({
				url: "/toErrorPage",
				success: function(data) {
					console.log('errorPage Success : ' + data);
				},
				error: function(error) {
					console.log("error 발생!");
				}
			})
		}
		*/
	</script>

	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
</html>