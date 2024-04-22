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

<script defer type="text/javascript">

const save = function() {
    const m_num = encodeURIComponent(document.getElementById('m_num').value || '');
    const m_status = encodeURIComponent(document.getElementById('m_status').value || '');
    //const rnpc_gubun = encodeURIComponent(document.getElementById('rnpc_gubun').value || '');
    const md_num = encodeURIComponent(document.getElementById('md_num').value || '');
    const m_sdate = encodeURIComponent(document.getElementById('m_sdate').value || '');
    const m_manager = encodeURIComponent(document.getElementById('m_manager').value || '');
    const f_id = encodeURIComponent(document.getElementById('f_id').value || '');
    const p_itemcode = encodeURIComponent(document.getElementById('p_itemcode').value || '');
    const md_quantity = encodeURIComponent(document.getElementById('md_quantity').value || '');
    const md_worker = encodeURIComponent(document.getElementById('md_worker').value || '');
    const md_worker_num = encodeURIComponent(document.getElementById('md_worker_num').value || '');
    const m_due_date = encodeURIComponent(document.getElementById('m_due_date').value || '');
    const md_pro_quantity = encodeURIComponent(document.getElementById('md_pro_quantity').value || '');
    const md_note = encodeURIComponent(document.getElementById('md_note').value || '');
    const s_date = encodeURIComponent(document.getElementById('s_date').value || '');
    const cust_no = encodeURIComponent(document.getElementById('cust_no').value || '');

    const url = 'jjmakeUpdate?m_num=' + m_num +
    '&m_status=' + m_status +
    //'&rnpc_gubun=' + rnpc_gubun +
    '&md_num=' + md_num +
    '&m_sdate=' + m_sdate +
    '&m_manager=' + m_manager +
    '&f_id=' + f_id +
    '&p_itemcode=' + p_itemcode +
    '&md_quantity=' + md_quantity +
    '&md_worker=' + md_worker +
    '&md_worker_num=' + md_worker_num +
    '&m_due_date=' + m_due_date +
    '&md_pro_quantity=' + md_pro_quantity +
    '&md_note=' + md_note +
    '&s_date=' + s_date +
    '&cust_no=' + cust_no;

    location.href = url;
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
		<div class="card col-12 w-100" style="padding: 24px;">
			<div class="table-responsive">
				<div class="form-group">
					<div style="font-size: 2rem; font-weight: bold; color: black;">생산 상세 게시글</div>
				</div>
				
				  <div class="row">
					  <div class="col">
						  <label for="m_num" class="form-control-label">작업지시번호 m_num</label>
						  <input class="form-control" type="number" value="${jjmakeDetail.m_num}" placeholder="yyyymmdd방식으로 기입" id="m_num" readonly>
					  </div>
				      <div class="col">
				        <div class="mb-3">
				        	<label for="m_status" class="form-control-label">작업지시상태 m_status</label>
						    <select class="form-select" required aria-label="select example" id="m_status">
						      <option value="">선택사항</option>
						      <option value="0" <c:if test="${jjmakeDetail.m_status eq '0'}">selected</c:if>>0.생산요청</option>
						      <option value="1" <c:if test="${jjmakeDetail.m_status eq '1'}">selected</c:if>>1.영업생산요청</option>
						      <%-- <option value="2" <c:if test="${jjmakeDetail.m_status eq '2'}">selected</c:if>>2.생산중</option> --%>
						      <option value="3" <c:if test="${jjmakeDetail.m_status eq '3'}">selected</c:if>>3.생산완료</option>
						      <option value="5" disabled <c:if test="${jjmakeDetail.m_status eq '5'}">selected</c:if>>5.수불마감</option>
						    </select>
						    <div class="invalid-feedback">Example invalid select feedback</div>
						 </div>
				      </div>
				      <%-- <div class="col">
				      	<div class="mb-3">
				        	<label for="rnpc_gubun" class="form-control-label">수불마감구분 rnpc_gubun</label>
						    <select class="form-select" name="md_status" required aria-label="select example" id="rnpc_gubun">
						      <option value="">선택사항</option>
						      <option value="0" <c:if test="${jjmakeDetail.rnpc_gubun eq '0'}">selected</c:if>>0.마감전</option>
						      <option value="1" <c:if test="${jjmakeDetail.rnpc_gubun eq '1'}">selected</c:if>>1.가마감</option>
						      <option value="2" <c:if test="${jjmakeDetail.rnpc_gubun eq '2'}">selected</c:if>>2.마감</option>
						     </select>
						    <div class="invalid-feedback">Example invalid select feedback</div>
				      	</div>
				      </div> --%>
				  </div>
					<fieldset>
    					<legend>관리자 입력란</legend>
					    <div class="form-group">
					        <label for="md_num" class="form-control-label">작업순번 md_num</label>
					        <input class="form-control" type="number" value="${jjmakeDetail.md_num}" placeholder="작업순번" id="md_num" readonly>
					    </div>
					    <div class="form-group">
					        <label for="m_sdate" class="form-control-label">작업지시일자 m_sdate</label>
					        <input class="form-control" type="date" value="${jjmakeDetail.m_sdate}" placeholder="날짜 선택" id="m_sdate" readonly>
					    </div>
					    <div class="form-group">
					        <label for="m_manager" class="form-control-label">작업지시담당자 m_manager</label>
					        <input class="form-control" type="text" name="m_manager" value="${jjmakeDetail.m_manager}"
					        		placeholder="담당 작업자를 입력" id="m_manager">
					    </div>
					    <div class="form-group">
					        <label for="f_id" class="form-control-label">공장명 f_name</label>
						<select class="form-select" name="select_md_status" required aria-label="f_id" id="f_id">
						      <option value="">선택사항</option>
						          <c:forEach var="factory" items="${factoryList}">
								     <option value="${factory.f_id}" <c:if test="${jjmakeDetail.f_id eq factory.f_id}">selected</c:if>>${factory.f_name}</option>
								  </c:forEach>
						     <%--  <option value="100" <c:if test="${jjmakeDetail.f_id eq '102'}">selected</c:if>>A동 공장</option>
						      <option value="101" <c:if test="${jjmakeDetail.f_id eq '103'}">selected</c:if>>B동 공장</option> --%>
					     </select>
					    </div>
					    
					    <div class="form-group">
					        <label for="p_itemcode" class="form-control-label">제품명 p_name</label>
					        <select class="form-select" name="p_itemcode" required aria-label="select product" id="p_itemcode" disabled>
					        	<option value="">선택사항</option>
					        	<c:forEach var="product" items="${productList}">
					        		<option value="${product.p_itemcode}" ${product.p_itemcode == jjmakeDetail.p_itemcode?'selected':''}>${product.p_name}</option>
					        	</c:forEach>
					        </select>
					    </div>
					    <div class="form-group">
					        <label for="md_quantity" class="form-control-label">지시수량 md_quantity</label>
					        <input class="form-control" type="number" value="${jjmakeDetail.md_quantity}" placeholder="지시수량을 입력" id="md_quantity" readonly>
					    </div>
				    </fieldset>
				    <fieldset>
    					<legend>작업자 입력란</legend>
					    <div class="form-group">
					        <label for="md_worker" class="form-control-label">작업자 md_worker</label>
					        <input class="form-control" type="text" value="${jjmakeDetail.md_worker}" placeholder="담당 작업자를 입력" id="md_worker">
					    </div>
					    <div class="form-group">
					        <label for="md_worker_num" class="form-control-label">작업인원 md_worker_num</label>
					        <input class="form-control" type="number" value="${jjmakeDetail.md_worker_num}" placeholder="작업인원수를 입력" id="md_worker_num">
					    </div>
					    <div class="form-group">
					        <label for="m_due_date" class="form-control-label">작업완료일자 m_due_date</label>
					        <input class="form-control" type="date" value="${jjmakeDetail.m_due_date}" placeholder="작업완료일자" id="m_due_date">
					    </div>
					    <div class="form-group">
					        <label for="md_pro_quantity" class="form-control-label">생산수량 md_pro_quantity</label>
					        <input class="form-control" type="number" value="${jjmakeDetail.md_pro_quantity}" placeholder="생산수량을 입력" id="md_pro_quantity">
					    </div>
					    <div class="form-group">
					        <label for="md_note" class="form-control-label">비고 md_note</label>
					        <input class="form-control" type="text" value="${jjmakeDetail.md_note}" placeholder="작업 특이사항을 입력" id="md_note">
					    </div>
					    <input type="hidden" name="s_date" value="${jjmakeDetail.s_date}" id="s_date">
					    <input type="hidden" name="cust_no" value="${jjmakeDetail.cust_no}" id="cust_no">
				    </fieldset>
				    
				    <!-- 생산 요청 게시판 - 저장, 삭제, 목록 버튼 -->
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-primary" id="buyProBtn" onclick="save()">저장</button>
						<button type="button" class="btn btn-primary" id="buyProBtn" onclick="location.href='jjmakeDelete?m_num=${jjmakeDetail.m_num}'">삭제</button>
						<button type="button" class="btn btn-primary" id="buyProBtn" onclick="location.href='makeMain'">목록</button>
					</div>
				


			</div>
		</div>
				

    

   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>