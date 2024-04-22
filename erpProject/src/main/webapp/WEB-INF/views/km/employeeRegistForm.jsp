<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../configHead.jsp"%>
</head>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	function submitForm() {
		$("input[name='empPhone']").val(
			$("input[name='emp_phone1']").val()
			+ $("input[name='emp_phone2']").val()
			+ $("input[name='emp_phone3']").val()
		);
		
		$("form[name='registOrEditForm']").submit();
	}
	
	function pwCheck() {
		if ($("input[name='empPassword']").val() === $("input[name='empPassword2']").val()) {
			$("input[name='empPassword2']").removeClass("is-invalid").addClass("is-valid").text("Password Check");
		} else {
			$("input[name='empPassword2']").removeClass("is-valid").addClass("is-invalid").text("Error Input")
		}
	}
	
</script>
<body>
	<div class="min-height-300 position-absolute w-100" style="background-color: #172b4d;"></div>

	<!-- Sidebar 사이드바 -->
	<%@ include file="adminSidebar.jsp"%>

	<main class="main-content position-relative border-radius-lg ">
		
		<!-- Header 헤더 -->
		<%@ include file="adminHeader.jsp"%>
		
		<c:if test="${empty employee.empEnabled or employee.empEnabled=='Y'}">
			<c:set var="emp_enabled_edit_y" value="checked" />
		</c:if>
		<c:if test="${employee.empEnabled=='N'}">
			<c:set var="emp_enabled_edit_n" value="checked" />
		</c:if>		
		<c:if test="${mode=='regist'}">
			<c:set var="formAction" value="employeeRegistProc" />
		</c:if>
		<c:if test="${mode=='edit'}">
			<c:set var="formAction" value="employeeEditProc" />
			<c:set var="emp_status_edit" value="${employee.empStatus}" />
			<c:choose>
				<c:when test="${employee.empRole=='role_employee'}">
					<c:set var="role_employee" value="selected" />
				</c:when>
				<c:when test="${employee.empRole=='role_manager_buy'}">
					<c:set var="role_manager_buy" value="selected" />
				</c:when>
				<c:when test="${employee.empRole=='role_manager_sale'}">
					<c:set var="role_manager_sale" value="selected" />
				</c:when>
				<c:when test="${employee.empRole=='role_manager_make'}">
					<c:set var="role_manager_make" value="selected" />
				</c:when>
				<c:when test="${employee.empRole=='role_admin'}">
					<c:set var="role_admin" value="selected" />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${employee.deptNo=='100'}">
					<c:set var="dept_no_100" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='101'}">
					<c:set var="dept_no_101" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='102'}">
					<c:set var="dept_no_102" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='103'}">
					<c:set var="dept_no_103" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='104'}">
					<c:set var="dept_no_104" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='105'}">
					<c:set var="dept_no_105" value="selected" />
				</c:when>
				<c:when test="${employee.deptNo=='106'}">
					<c:set var="dept_no_106" value="selected" />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${employee.empJobName=='999'}">
					<c:set var="emp_job_name_99" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='10'}">
					<c:set var="emp_job_name_10" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='20'}">
					<c:set var="emp_job_name_20" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='30'}">
					<c:set var="emp_job_name_30" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='40'}">
					<c:set var="emp_job_name_40" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='50'}">
					<c:set var="emp_job_name_50" value="selected" />
				</c:when>
				<c:when test="${employee.empJobName=='60'}">
					<c:set var="emp_job_name_60" value="selected" />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${employee.empGender=='M'}">
					<c:set var="emp_gender_m" value="selected" />
				</c:when>
				<c:when test="${employee.empGender=='F'}">
					<c:set var="emp_gender_f" value="selected" />
				</c:when>
			</c:choose>
		</c:if>
		<div class="main-body container-fluid py-4"> 
			<form name="registOrEditForm" action="${formAction}" method="post">
				<input type="hidden" name="empPhone" value="" />
				<input type="hidden" name="empNo" value="${employee.empNo}" />
				<input type="hidden" name="empJobComm" value="200" />
				<div class="row">
					<div class="col-md-12 h-100">
						<div class="card h-100">
							<div class="card-header pb-0">
								<div class="d-flex align-items-center">
									<p class="mb-0 fw-bold">REGISTRATION</p>
								</div>
							</div>
							<div class="card-body">
								<div class="row">
									<p class="text-uppercase text-sm">ACCOUNT</p>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">사원번호</label>
											<input class="form-control" name="empNo" type="text" value="${employee.empNo}"
											onfocus="focused(this)" onfocusout="defocused(this)" disabled />
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
											<label for="example-date-input" class="form-control-label">입사일자</label>
											<input class="form-control" name="empHireDate" type="date" value="${employee.empHireDate}" id="example-date-input">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-date-input" class="form-control-label">퇴사일자</label>
											<%-- 
											<input class="form-control" name="empRetiredDate" type="date" value="${employee.empRetiredDate}" id="example-date-input">
											--%>
											<c:if test="${mode=='regist'}">
												<input class="form-control" name="empRetiredDate" type="date" id="example-date-input">
											</c:if>
											<c:if test="${mode=='edit'}">
												<input class="form-control" name="empRetiredDate" type="date" value="${employee.empRetiredDate}" id="example-date-input">
											</c:if>
											 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">계정 사용 여부</label>
											<div class="d-flex pt-2 ml-1">
												<div class="form-check col-md-5">
													<input class="form-check-input" name="empEnabled" type="radio" value="Y" ${emp_enabled_edit_y} id="customRadio1">
													<label class="custom-control-label" for="customRadio1">활성화</label>
												</div>
												<div class="form-check col-md-5">
													<input class="form-check-input" name="empEnabled" type="radio" value="N" ${emp_enabled_edit_n} id="customRadio2">
													<label class="custom-control-label" for="customRadio2">비활성화</label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">권한</label>
											<select class="form-select" name="empRole" aria-label="Default select example">
												<option value="role_employee" ${role_employee}>사원</option>
												<option value="role_manager_buy" ${role_manager_buy}>구매 관리자</option>
												<option value="role_manager_sale" ${role_manager_sale}>판매 관리자</option>
												<option value="role_manager_make" ${role_manager_make}>생산 관리자</option>
												<option value="role_admin" ${role_admin}>ERP 관리자</option>
											</select>
										</div>
									</div>
								</div>
								<hr class="horizontal dark">
								<p class="text-uppercase text-sm">DEPARTMENT</p>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">부서명</label>
											<select class="form-select" name="deptNo" aria-label="Default select example">
												<option value="100" ${dept_no_100}>미정</option>
												<option value="101" ${dept_no_101}>경영</option>
												<option value="102" ${dept_no_102}>인사</option>
												<option value="103" ${dept_no_103}>구매</option>
												<option value="104" ${dept_no_104}>생산</option>
												<option value="105" ${dept_no_105}>물류</option>
												<option value="106" ${dept_no_106}>영업</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">직책</label>
											<select class="form-select" name="empJobName" aria-label="Default select example">
												<option value="99" ${emp_job_name_999}>미정</option>
												<option value="10" ${emp_job_name_10}>사장</option>
												<option value="20" ${emp_job_name_20}>부장</option>
												<option value="30" ${emp_job_name_30}>차장</option>
												<option value="40" ${emp_job_name_40}>과장</option>
												<option value="50" ${emp_job_name_50}>대리</option>
												<option value="60" ${emp_job_name_60}>사원</option>
											</select>
										</div>
									</div>
								<hr class="horizontal dark">
								<p class="text-uppercase text-sm">INFORMATION</p>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">이름</label>
											<input class="form-control" name="empName" type="text" value="${employee.empName}" onfocus="focused(this)" onfocusout="defocused(this)">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="example-date-input" class="form-control-label">생년월일</label>
											<c:if test="${mode=='regist'}">
												<input class="form-control" name="empBirth" type="date" value="" id="example-date-input">
											</c:if>
											<c:if test="${mode=='edit'}">
												<input class="form-control" name="empBirth" type="date" value="${employee.empBirth}" id="example-date-input"> 
											</c:if>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">성별</label>
											<select class="form-select" name="empGender" aria-label="Default select example">
												<option value="M" ${emp_job_gender_m}>남성</option>
												<option value="F" ${emp_job_gender_f}>여성</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="example-text-input" class="form-control-label">Email</label>
											<input class="form-control" name="empEmail" type="email" placeholder="name@example.com" value="${employee.empEmail}" onfocus="focused(this)" onfocusout="defocused(this)">
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
									<c:if test="${mode=='regist'}">
										<div class="col-md-6">
											<div class="form-group">
												<label for="example-text-input" class="form-control-label">비밀번호</label>
												<input type="text" name="empPassword" placeholder="Success" class="form-control is-valid" oninput="pwCheck()"/>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="example-text-input" class="form-control-label">비밀번호 확인</label> 
												<input type="text" name="empPassword2" placeholder="Error Input" class="form-control is-invalid" oninput="pwCheck()"/>
											</div>
										</div>
									</c:if>
									
									<div class="button-row d-flex">
										<c:if test="${mode=='edit'}">
											<button class="btn btn-outline-dark ms-auto mb-0 js-btn-next">비밀번호 초기화</button>
										</c:if>
										<input type="button" onClick="submitForm()" class="btn btn-dark ms-2 mb-0 js-btn-next" value="저장" />
									</div>
									
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
		
		
	</main>

	<!--   Back to Top   -->
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2" href="#">
			<i class="ni ni-bold-up"></i>
		</a>
	</div>
	
</body>
</html>