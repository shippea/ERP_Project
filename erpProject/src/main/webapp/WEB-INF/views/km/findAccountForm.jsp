<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../configHead.jsp"%>
</head>
<body>
<body class="">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3 navbar-transparent mt-4">
    <div class="container">
      <span class="navbar-brand font-weight-bolder ms-lg-0 ms-3 text-white fs-5">
        ERP PROJECT
      </span>
    </div>
  </nav>
  <!-- End Navbar -->
  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-50 pt-5 pb-11 m-3 border-radius-lg" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signup-cover.jpg'); background-position: top;">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5 text-center mx-auto">
            <h1 class="text-white mb-2 mt-5">Forgot Password?</h1>
            <p class="text-lead text-white">Get a verificatoin code at Email</p>
          </div>
        </div>
      </div>
    </div>
	<div class="container">
      <div class="row mt-lg-n10 mt-md-n11 mt-n10 justify-content-center">
        <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
          <c:choose>
          	<c:when test="${mode eq 'findAccount'}">
          		<div class="card z-index-0">
		            <div class="card-header text-center pt-4 mt-2">
		              <h5>아이디 찾기</h5>
		            </div>
		            <div class="position-relative text-center p-2">
		              <p class="text-sm fw-light mb-2 text-secondary text-border d-inline z-index-2 bg-white px-3">
		                아이디와 이메일을 입력하세요
		              </p>
		            </div>
		            <div class="card-body">
		              <form action="/findAccountProc" method="post" id="findForm" onsubmit="return validateForm();">
		                <div class="mb-3">
		                  <input type="text" name="empNo" class="form-control form-control-lg" placeholder="ID" aria-label="ID" required="required">
		                </div>
		                <div class="mb-3">
		                  <input type="text" name="empEmail" class="form-control form-control-lg" placeholder="Email" aria-label="Email" required="required">
		                </div>
		                <div class="text-center">
		                  <input type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2" value="Find ID" />
		                </div>
		              </form>
		            </div>
		          </div>
          	</c:when>
        	<c:when test="${mode eq 'check'}">
	          	<div class="card z-index-0">
				    <div class="card-header text-center pt-4 mt-2">
				      <h5>인증번호 입력</h5>
				    </div>
				    <div class="card-body">
				      <form action="/verifyCode" method="post" id="codeForm" onsubmit="return validateForm();">
				        <div class="mb-3">
				          <label for="verificationCode" class="form-label">인증번호</label>
				          <input type="text" id="code" name="code" class="form-control form-control-lg" placeholder="인증번호 입력" aria-label="Verification Code" required="required">
				        </div>
				        <div class="text-center">
				          <input type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2" value="확인" />
				        </div>
				      </form>
				    </div>
				  </div>
          	</c:when>
         </c:choose>
        </div>
      </div>
    </div>
  </main>
  <!-- Footer -->
  <footer class="footer row pt-4 pb-4 position-absolute bottom-0 start-50 translate-middle-x">
    <div class="container-fluid">
      <div class="row align-items-center justify-content-lg-center">
        <div class="col mb-lg-0 mb-4">
          <div class="copyright text-center text-sm text-muted text-lg-start my-auto">
            <div class="copyright text-center">
                <span>Copyright © we're Website 2024</span>
            </div>
        </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- -------- END FOOTER ------- -->
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>

  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script defer src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
</html>