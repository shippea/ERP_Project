<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../configHead.jsp"%>
<link href="assets/css/km/myPage.css" rel="stylesheet">
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	function submitForm() {
		$("input[name='empPhone']").val(
			$("input[name='emp_phone1']").val()
			+ $("input[name='emp_phone2']").val()
			+ $("input[name='emp_phone3']").val()
		);
		
		$("form[name='myPageEditProc']").submit();
	}
	
	function pwCheck() {
		if ($("input[name='empPassword']").val() === $("input[name='empPassword2']").val()) {
			$("input[name='empPassword2']").removeClass("is-invalid").addClass("is-valid").text("Password Check");
		} else {
			$("input[name='empPassword2']").removeClass("is-valid").addClass("is-invalid").text("Error Input")
		}
	}
</script>
</head>
<body>
 	<div class="min-height-300 bg-primary position-absolute w-100"></div>
 	<!-- Sidebar 사이드바 -->
  	<%@ include file="../sidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
 	<!-- Header 헤더 -->
 	<%@ include file="../header.jsp"%> 
 	<c:if test="${mode=='view'}">
	 	<c:set var="emp_status_edit" value="${employee.empStatus}" />
 	</c:if>
 	
	<div class="main-body container-fluid py-4">
	<form action="/myPageEditProc" method="post" name="myPageEditProc">
      <div class="row">
        <div class="col-md-8 h-100"> <!-- 고 -->
          <div class="card h-100">
            <div class="card-header pb-0">
              <div class="d-flex align-items-center">
                <p class="mb-0 fw-bold">EMPLOYEE</p>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">사원번호</label>
                    <input class="form-control" name="empNo" type="text" value="${employee.empNo}" onfocus="focused(this)" onfocusout="defocused(this)" disabled>
                  </div>
                </div>
                <div class="col-md-6">
					<label for="example-text-input" class="form-control-label">status</label>
					<select class="form-select" name="empStatus" value="${emp_status_edit}" aria-label="Default select example">
						<option value="1" selected>재직</option>
						<option value="2">휴직</option>
						<option value="9">퇴사</option>
					</select>
				</div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">생년월일</label>
                    <input class="form-control" name="empBirth" type="date" value="${employee.empBirth}" onfocus="focused(this)" onfocusout="defocused(this)" disabled>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">입사일</label>
                    <input class="form-control" name="empHireDate" type="date" value="${employee.empHireDate}" onfocus="focused(this)" onfocusout="defocused(this)" disabled> 
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
              <p class="text-uppercase text-sm ">INFORMATION</p>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Email</label>
                    <input class="form-control" name="empEmail" type="text" value="${employee.empEmail}" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">전화번호</label>
						<div class="d-flex">
							<input type="text" name="emp_phone1" value="${fn:substring(employee.empPhone, 0, 3)}" class="form-control form-control w-33">- 
							<input type="text" name="emp_phone2" value="${fn:substring(employee.empPhone, 3, 7)}" class="form-control form-control w-33">- 
							<input type="text" name="emp_phone3" value="${fn:substring(employee.empPhone, 7, 11)}" class="form-control form-control w-33">
						</div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">주소</label>
                    <input class="form-control" name="empAddress" type="text" value="${employee.empAddress}" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">우편번호</label>
                    <input class="form-control" name="empPostcode" type="text" value="${employee.empPostcode}" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
              <div class="row">
              <p class="text-uppercase text-sm">PASSWORD RESET</p>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">비밀번호</label> <!-- 잠시만요... 근데 이러면 화면에 password가 보이잖아요..ㅎㅎ 일단 놔둬봐... 나한테 할말 있음 카톡으로 해줘봐 -->
                  <input class="form-control is-valid" name="empPassword" placeholder="Success" value="${employee.empPassword}" type="password"onfocus="focused(this)" onfocusout="defocused(this)" oninput="pwCheck()">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">비밀번호 확인</label>
                  <input class="form-control is-invalid" name="empPassword2" type="password" placeholder="Error Input" onfocus="focused(this)" onfocusout="defocused(this)" oninput="pwCheck()">
                </div>
              </div>
            </div>
            <input type="submit" class="btn btn-sm bg-gradient-primary btn-sm ms-auto d-lg-block mt-4" value="저장"/>
          </div>
          </div>
        </div>
        <div class="col-md-4 h-100">
          <div class="card card-profile h-100">
            <div class="bg-gradient-dark card-img-top">
              <div class="bg-transparent shadow-xl">
                <div class="overflow-hidden">
                  <img src="../assets/img/bggray.jpg" alt="Image placeholder" class="card-img-top">
                </div>
              </div>
            </div>
            <div class="row justify-content-center">
              <div class="col-4 col-lg-4 order-lg-2">
                <div class="mt-n4 mt-lg-n6 mb-4 mb-lg-0">
                    <img src="../assets/img/test.jpg" class="rounded-circle img-fluid border border-2 border-white">
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-0 pt-lg-2 pb-4 pb-lg-3">
              <div class="d-flex justify-content-between">
                <a href="javascript:;" class="btn btn-sm btn-default mb-0 d-none d-lg-block">권한</a>
                <a href="javascript:;" class="btn btn-sm btn-info mb-0 d-block d-lg-none"><i class="ni ni-collection"></i></a>
                <a href="javascript:;" class="btn btn-sm btn-dark float-right mb-0 d-none d-lg-block">
				<c:choose>
				    <c:when test="${employee.empRole=='role_employee'}">일반</c:when>
				    <c:when test="${employee.empRole=='role_manager_buy'}">구매 관리자</c:when>
				    <c:when test="${employee.empRole=='role_manager_sale'}">생산 관리자</c:when>
				    <c:when test="${employee.empRole=='role_manager_make'}">판매 관리자</c:when>
				    <c:when test="${employee.empRole=='role_admin'}">ERP 관리자</c:when>
				</c:choose>
					</a>
                <a href="javascript:;" class="btn btn-sm btn-dark float-right mb-0 d-block d-lg-none"><i class="ni ni-email-83"></i></a>
              </div>
            </div>
            <div class="card-body pt-0 mb-4">
              <div class="text-center mt-4 mb-4">
                <h5>${employee.empName}</h5>
                <div class="h6 font-weight-400">
                  <c:choose>
				    <c:when test="${employee.empJobName=='10'}">사장</c:when>
				    <c:when test="${employee.empJobName=='20'}">부장</c:when>
				    <c:when test="${employee.empJobName=='30'}">차장</c:when>
				    <c:when test="${employee.empJobName=='40'}">과장</c:when>
				    <c:when test="${employee.empJobName=='50'}">대리</c:when>
				    <c:when test="${employee.empJobName=='60'}">사원</c:when>
				</c:choose>
                </div>
                <div class="h6 mt-4">
                  <c:choose>
	                <c:when test="${employee.deptNo=='100'}">미정</c:when>
	                <c:when test="${employee.deptNo=='101'}">경영팀</c:when>
	                <c:when test="${employee.deptNo=='102'}">인사팀</c:when>
	                <c:when test="${employee.deptNo=='103'}">구매팀</c:when>
	                <c:when test="${employee.deptNo=='104'}">생산팀</c:when>
	                <c:when test="${employee.deptNo=='105'}">물류팀</c:when>
	                <c:when test="${employee.deptNo=='106'}">영업팀</c:when>
	            </c:choose>
                </div>
                <div>
                  <i class="ni education_hat mr-2 py-2"></i>중앙판매회사
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
    </form>
   </div>
	
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
   	<!--   Back to Top   -->
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2" href="#">
			<i class="ni ni-bold-up"></i>
		</a>
	</div>
 </main>
 
</body>
</html>