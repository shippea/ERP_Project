<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../configHead.jsp"%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	function submitSearchForm(){
		if ($('input[name="searchValue"]').val() == null) {
			alert('검색어를 입력해주세요');
			return false;
		} else {
			$('form[name="searchForm"]').submit();
		}
	}
</script>
</head>
<body>
	<div class="min-height-300 position-absolute w-100" style="background-color: #172b4d;"></div>
	<!-- Sidebar 사이드바 -->
	<%@ include file="adminSidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Header 헤더 -->
		<%@ include file="adminHeader.jsp"%>
		
		<div class="main-body container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-12 d-flex">
									<h5 class="col-6 fw-bold">Information</h5>
							        <div class="bg-white border-radius-lg ms-auto d-flex">
									    <form action="/listEmployeeProc" name="searchForm" method="POST" class=" d-flex align-items-center">
									         <select class="form-select me-1" name="searchType" style="width: 150px">
												 <option value="A" selected>전체</option>
											     <option value="E">사원</option>
												 <option value="D">부서명</option>
											 </select>
										     <input type="text" name="searchValue" class="form-control border-1 me-1 ps-3 my-1" placeholder="검색어를 입력하세요" style="width: 300px">
										     <input type="button" onclick="submitSearchForm()" value="Search" class="btn bg-gradient-primary mb-0" />
									     </form>
							    	 </div>
					        	</div>
							</div>
					    </div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-xs fw-bolder opacity-7">사원 정보</th>
											<th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">부서명 / 직책</th>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">상태</th>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">입사일</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listEmployee}" var="employee">
											<c:set var="emp_job_name" value="" />
											<c:choose>
												<c:when test="${employee.empJobName eq 10}">
													<c:set var="emp_job_name" value="사장" />
												</c:when>
												<c:when test="${employee.empJobName eq 20}">
													<c:set var="emp_job_name" value="부장" />
												</c:when>
												<c:when test="${employee.empJobName eq 30}">
													<c:set var="emp_job_name" value="차장" />
												</c:when>
												<c:when test="${employee.empJobName eq 40}">
													<c:set var="emp_job_name" value="과장" />
												</c:when>
												<c:when test="${employee.empJobName eq 50}">
													<c:set var="emp_job_name" value="대리" />
												</c:when>
												<c:when test="${employee.empJobName eq 60}">
													<c:set var="emp_job_name" value="사원" />
												</c:when>
											</c:choose>
											
											<c:set var="emp_role" value="" />
											<c:choose>
												<c:when test="${employee.empRole eq 'role_employee'}">
													<c:set var="emp_role" value="일반 사원" />
													<c:set var="emp_job_color" value="bg-gradient-secondary" />
												</c:when>
												<c:when test="${employee.empRole eq 'role_manager_buy'}">
													<c:set var="emp_role" value="구매 관리자" />
													<c:set var="emp_job_color" value="bg-gradient-danger" />
												</c:when>
												<c:when test="${employee.empRole eq 'role_manager_sale'}">
													<c:set var="emp_role" value="판매 관리자" />
													<c:set var="emp_job_color" value="bg-gradient-info" />
												</c:when>
												<c:when test="${employee.empRole eq 'role_manager_make'}">
													<c:set var="emp_role" value="생산 관리자" />
													<c:set var="emp_job_color" value="bg-gradient-success" />
												</c:when>
												<c:when test="${employee.empRole eq 'role_admin'}">
													<c:set var="emp_role" value="ERP 관리자" />
													<c:set var="emp_job_color" value="bg-gradient-primary" />
												</c:when>
											</c:choose>
											<tr>
												<td>
													<div class="d-flex px-2 py-1">
														<div>
															<img src="../assets/img/test.jpg" class="avatar avatar-sm me-3" alt="user1">
														</div>
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${employee.empName}</h6>
															<p class="text-xs text-secondary mb-0">${employee.empEmail}</p>
														</div>
													</div>
												</td>
												<td>
													<p class="text-xs font-weight-bold mb-0">${emp_job_name}</p>
													<p class="text-xs text-secondary mb-0">
														<c:choose>
											                <c:when test="${employee.deptNo=='100'}">미정</c:when>
											                <c:when test="${employee.deptNo=='101'}">경영팀</c:when>
											                <c:when test="${employee.deptNo=='102'}">인사팀</c:when>
											                <c:when test="${employee.deptNo=='103'}">구매팀</c:when>
											                <c:when test="${employee.deptNo=='104'}">생산팀</c:when>
											                <c:when test="${employee.deptNo=='105'}">물류팀</c:when>
											                <c:when test="${employee.deptNo=='106'}">영업팀</c:when>
											            </c:choose>			
										            </p>
												</td>
												<td class="align-middle text-center text-sm">
													<span class="badge badge-sm ${emp_job_color}" style="width: 73.9px;">${emp_role}</span>
												</td>
												<td class="align-middle text-center">
													<span class="text-secondary text-xs font-weight-bold">${employee.empHireDate}</span>
												</td>
												<td class="align-middle">
													<a href="/employeeEditForm?empNo=${employee.empNo}" class="text-secondary font-weight-bold text-xs"
															data-toggle="tooltip" data-original-title="Edit user"> Edit </a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>					

					 	<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						  <c:if test="${startPageNo > pageCountPerBlock}">
						    <li class="page-item">
						      <a class="page-link" href="/listEmployeeProc?pageNo=${startPageNo - pageCountPerBlock}">
						        <i class="fa fa-angle-left"></i>
						        <span class="sr-only">Previous</span>
						      </a>
						    </li>
						  </c:if>
						    <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
							    <li class="page-item"><a class="page-link" href="/listEmployeeProc?pageNo=${i}">${i}</a></li>
						    </c:forEach>
						    <c:if test="${endPageNo < totalPageCount}">
							    <li class="page-item">
						      <a class="page-link" href="/listEmployeeProc?pageNo=${startPageNo + pageCountPerBlock}">
						        <i class="fa fa-angle-right"></i>
						        <span class="sr-only">Next</span>
						      </a>
						    </li>
						    </c:if>
						  </ul>
						</nav>
		
					</div>
				</div>
			</div>
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