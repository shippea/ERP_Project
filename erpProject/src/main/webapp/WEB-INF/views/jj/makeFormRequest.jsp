<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<!-- <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css"> -->

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" defer>

const changeFName = (item) => {
	
	$.ajax({
		url:'getFactoryName',
		type:'GET',
		data:{p_itemcode:item.value},
		success:(resp)=>{
			$('#f_name').val(resp.f_name);
			$('#f_id').val(resp.f_id);
		}
	})
}

</script>

<head>
<%@ include file="../configHead.jsp"%>

<style type="text/css">
td {
  transition: background-color 0.3s ease; /* 0.3초 동안 부드럽게 변경 */
}

td:hover {
  background-color: rgba(0, 0, 0, 0.075);
}

legend {
  background-color: #000;
  color: #fff;
  padding: 3px 6px;
}
</style>
</head>

<body>
 	<div class="min-height-300 bg-primary position-absolute w-100"></div>
  	<%@ include file="../sidebar.jsp"%><!-- Sidebar 사이드바 -->
	<main class="main-content position-relative border-radius-lg ">
 	<%@ include file="../header.jsp"%><!-- Header 헤더 -->
    <div class="comm-body container-fluid py-4"> <!-- 메인 바디 -->
    
		<!-- ****** 공통 : 테이블 시작 ****** -->
	 	<!-- 이 아래부터는 파트별로 자유롭게 활용하시면 됩니다 -->

		<!-- 생산 요청 게시판123 -->
		<div class="card col-12 w-100">
			<div class="table-responsive">
				<div class="form-group">
					<div style="font-size: 2rem; font-weight: bold; color: black;">생산 요청 게시판</div>
				</div>
				<form id="makeRequest" action="<%=request.getContextPath()%>/JJmakeRequest" method="post">
				  <div class="row">
					  <%-- <div class="col">
						  <label for="m_num" class="form-control-label">작업지시번호 m_num</label>
						  <input class="form-control" type="number" name="m_num" value="${JJ_Make.m_num}" placeholder="yyyymmdd01형식으로 입력해주세요" id="m_num">
					  </div> --%>
				      <div class="col">
				        <div class="mb-3">
				        	<label for="form-select" class="form-control-label">작업지시상태 m_status</label>
						    <select class="form-select" name="m_status" required aria-label="select example" id="form-select">
						      <option value="">선택사항</option>
						      <option value="0">0.생산요청</option>
						      <option value="1">1.영업생산요청</option>
						      <!-- <option value="2">2.생산중</option> -->
						      <option value="3">3.생산완료</option>
						      <option value="5" disabled>5.수불마감</option>
						    </select>
						    <div class="invalid-feedback">Example invalid select feedback</div>
						 </div>
				      </div>
				      <!-- <div class="col">
				      	<div class="mb-3">
				        	<label for="form-select" class="form-control-label">수불마감구분 rnpc_gubun</label>
						    <select class="form-select" name="rnpc_gubun" required aria-label="select example" id="form-select">
						      <option value="">선택사항</option>
						      <option value="0">0.마감전</option>
						      <option value="1">1.가마감</option>
						      <option value="2">2.마감</option>
						     </select>
						    <div class="invalid-feedback">Example invalid select feedback</div>
				      	</div>
				      </div> -->
				  </div>
					<fieldset>
    					<legend>관리자 입력란</legend>
					    <%-- <div class="form-group">
					        <label for="md_num" class="form-control-label">작업순번 md_num</label>
					        <input class="form-control" type="number" name="md_num" value="${JJ_Make_detail.md_num}"
					        		placeholder="작업순번" id="md_num">
					    </div> --%>
					    <div class="form-group">
					        <label for="m_sdate" class="form-control-label">작업지시일자 m_sdate</label>
					        <input class="form-control" type="date" name="m_sdate" value="${JJ_Make.m_sdate}"
					        		placeholder="작업지시일자을 입력" id="m_sdate">
					    </div>
					    <div class="form-group">
					        <label for="md_worker" class="form-control-label">작업지시담당자 m_manager</label>
					        <input class="form-control" type="text" name="m_manager" value="${JJ_Make.m_manager}"
					        		placeholder="담당 작업자를 입력" id="md_worker">
					    </div>
					    
					    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@ Ajax로 값 이동 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					    <div class="form-group">
					        <label for="f_name" class="form-control-label">공장명 f_name</label>
						    <input class="form-control" type="hidden" name="f_id" id="f_id">
						    <input class="form-control" type="text" name="f_name" id="f_name" placeholder="제품을 선택하면 공장이 선택됨." readonly>
					    </div>
					    <div class="form-group">
					        <label for="form-select" class="form-control-label">제품명 p_name</label>
					        <select onchange="changeFName(this)" class="form-select" name="p_itemcode" required aria-label="select product" id="p_itemcode">
					        	<option value="">선택사항</option>
					        	<c:forEach var="product" items="${productList}">
					        		<option value="${product.p_itemcode}">${product.p_name}</option>
					        	</c:forEach>
					        </select>
					    </div>
					    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					    <div class="form-group">
					        <label for="md_quantity" class="form-control-label">지시수량 md_quantity</label>
					        <input class="form-control" type="number" name="md_quantity" value="${JJ_Make.md_quantity}"
					        		placeholder="지시수량을 입력" id="md_quantity">
					    </div>
				    </fieldset>
				<c:if test="${sessionScope.dept_no == 104 }"> 
				    <fieldset>
    					<legend>작업자 입력란</legend>
					    <div class="form-group">
					        <label for="md_worker" class="form-control-label">작업자 md_worker</label>
					        <input class="form-control" type="text" name="md_worker" value="${JJ_Make.md_worker}"
					        		placeholder="담당 작업자를 입력" id="md_worker">
					    </div>
					    <div class="form-group">
					        <label for="md_worker_num" class="form-control-label">작업인원 md_worker_num</label>
					        <input class="form-control" type="number" name="md_worker_num" 
					        	
					                <c:choose>
									    <c:when test="${empty JJ_Make.md_worker_num}">
									          value="0"
									    </c:when>
									    <c:otherwise>
									          value="${JJ_Make.md_worker_num}"
									    </c:otherwise>
									</c:choose>
					        
					        		placeholder="작업인원수를 입력" id="md_worker_num">
					    </div>
					    <div class="form-group">
					        <label for="m_due_date" class="form-control-label">작업완료일자 m_due_date</label>
					        <input class="form-control" type="date" name="m_due_date" value="${JJ_Make.m_due_date}"
					        		placeholder="작업완료일자" id="m_due_date">
					    </div>
					    <div class="form-group">
					        <label for="md_pro_quantity" class="form-control-label">생산수량 md_pro_quantity</label>
					        <input class="form-control" type="number" name="md_pro_quantity" 
					               
					                <c:choose>
									    <c:when test="${empty JJ_Make.md_pro_quantity}">
									          value="0"
									    </c:when>
									    <c:otherwise>
									          value="${JJ_Make.md_pro_quantity}"
									    </c:otherwise>
									</c:choose>
					        		placeholder="생산수량을 입력" id="md_pro_quantity">
					    </div>
					    <div class="form-group">
					        <label for="md_note" class="form-control-label">비고 md_note</label>
					        <input class="form-control" type="text" name="md_note" value="${JJ_Make.md_note}"
					        		placeholder="작업 특이사항을 입력" id="md_note">
					    </div>
				    </fieldset>
				</c:if>    
				    <!-- 생산 요청 게시판 - 저장, 삭제, 목록 버튼 -->
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-primary" id="buyProBtn">생산요청</button>
						<button type="button" class="btn btn-primary" id="buyProBtn" onclick="location.href='makeMain'">목록</button>
					</div>
				</form>


			</div>
		</div>
				

    

   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>