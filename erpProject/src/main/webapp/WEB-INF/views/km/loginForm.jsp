<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title> ERP PROJECT </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- jQuery와 Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
	$(document).ready(function() {
	    $("#loginForm").submit(function(event) {
	        var empNoValue = $("input[name='empNo']").val().trim();
	        var empPasswordValue = $("input[name='empPassword']").val().trim();
	        
	        if (empNoValue === "" || empPasswordValue === "") {
	            event.preventDefault(); 
	            alert("아이디와 비밀번호를 확인해주세요");
	        }
	    });
	});
	
	
  </script>
  </head>
  <c:if test="${error == 'error'} ">
  	<script>
  		alert("아이디와 비밀번호를 확인해주세요");
  	</script>
  </c:if>
  <c:if test="${mode == 'isEmpty'}">
	<script>
 		alert("아이디와 비밀번호를 확인해주세요");
 	</script>
  </c:if>
<body>
<div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
        <div class="top-0 z-index-3 position-absolute mt-4 py-2 start-0 end-0 mx-4">
          <div class="container-fluid">
            <h4 class="fw-semibold ms-lg-0 ms-3" style="color: #344767">
              ERP PROJECT
            </h4>
          </div>
        </div>
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-start">
                  <h4 class="fw-semibold">로그인</h4>
                  <p class="mb-0">아이디와 비밀번호를 입력하세요</p>
                </div>
                <div class="card-body">
                  <form action="/loginProc" method="post" id="loginForm">
                    <div class="mb-3">
                      <input type="text" name="empNo" class="form-control form-control-lg" placeholder="Id" aria-label="Id">
                    </div>
                    <div class="mb-3">
                      <input type="password" name="empPassword" class="form-control form-control-lg" placeholder="Password" aria-label="Password">
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="rememberMe">
                      <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <div class="text-center">
                      <input type="submit" class="btn btn-lg btn-primary btn-lg w-100 mt-4 mb-0" value="Sign in">
                    </div>
                  </form>
                </div>
                <div class="row px-xl-5 px-sm-4 px-3">
                  <p class="text-sm mt-3 mb-0 ml-0 col">Don't you remember id? <span class="text-dark font-weight-bolder">find id</span></p>
                  <div class="col-3 ms-auto px-1">
                    <a class="btn btn-outline-light w-100" href="/findAccountForm">
                      <svg width="26px" height="32px" viewBox="0 0 64 64" version="1.1">
                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                          <g transform="translate(3.000000, 3.000000)" fill-rule="nonzero">
                          <svg xmlns="http://www.w3.org/2000/svg" height="60" viewBox="0 -960 960 960" width="60">
                            <path d="M160-80q-33 0-56.5-23.5T80-160v-440q0-33 23.5-56.5T160-680h200v-120q0-33 23.5-56.5T440-880h80q33 0 56.5 23.5T600-800v120h200q33 0 56.5 23.5T880-600v440q0 33-23.5 56.5T800-80H160Zm0-80h640v-440H600q0 33-23.5 56.5T520-520h-80q-33 0-56.5-23.5T360-600H160v440Zm80-80h240v-18q0-17-9.5-31.5T444-312q-20-9-40.5-13.5T360-330q-23 0-43.5 4.5T276-312q-17 8-26.5 22.5T240-258v18Zm320-60h160v-60H560v60Zm-200-60q25 0 42.5-17.5T420-420q0-25-17.5-42.5T360-480q-25 0-42.5 17.5T300-420q0 25 17.5 42.5T360-360Zm200-60h160v-60H560v60ZM440-600h80v-200h-80v200Zm40 220Z" fill="#525f7f"/>
                          </svg>
                          </g>
                        </g>
                      </svg>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 end-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signin-ill.jpg');
          			background-size: cover;">
                <span class="mask bg-gradient-primary opacity-6"></span>
                <h4 class="mt-5 text-white font-weight-bolder position-relative">Welcome!</h4>
                <p class="text-white position-relative">The more effortless the writing looks, the more effort the writer actually put into the process.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
</body>
</html>