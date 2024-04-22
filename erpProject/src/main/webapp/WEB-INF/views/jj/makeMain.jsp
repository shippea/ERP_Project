<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

	function jjmakeSearchFn(pPage)  {
	 	var keyword =   $("#keyword").val();
		var sendData = 'currentPage='+pPage;
		sendData = sendData + '&keyword='+keyword;
	    /* alert("sendData->"+sendData);  */
	    
	    location.href="jjmakeSearch?"+sendData;
	}
$(document).ready(function() {	
	// 버튼 클릭 시 수불마감 여부 확인
	$('#buyProBtn').click(function() {
		checkClosingStatus();
	});
	
	// 수불마감 여부 가져오기
	function checkClosingStatus() {
		$.ajax({
			url: '/closingStatus', 
			type: 'GET',
			success: function(closingStatus) {
				if (closingStatus !== 0) {
					alert("금일 수불 마감 처리 되어 등록 할 수 없습니다.");
					$('#buyProBtn').prop('disabled', true);
					 window.location.href = "makeMain";
				} else {
					 window.location.href = "makeFormRequest";
				}
			}
		});
	}
	
});
</script>
<head>
<%@ include file="../configHead.jsp"%>

<style type="text/css">
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
	 	 		
		<!-- 생산 리스트 게시판 -->
		<div class="card col-12 w-100" style="padding: 24px;">
		  <div class="table-responsive">
	  		<div class="form-group">
				<div style="font-size: 2rem; font-weight: bold; color: black;">생산게시판</div>
			</div>
		    <table class="table align-items-center mb-0 table-hover">
		      <thead>
		        <tr>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">No</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업지시번호</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업상태</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품명</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업자</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업지시일자</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">지시수량</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작업완료일자</th>
		          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">생산수량</th>
		        </tr>
		      </thead>
		      <tbody>
			      <c:forEach var="jj_Make_detail" items="${makeList}">
			        <tr onclick="window.location='makeDetail?m_num=${jj_Make_detail.m_num}'">
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.md_num}</h6> <!-- 작업순번 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.m_num}</h6> <!-- 작업지시번호 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">
			          		<c:choose>
			          			<c:when test="${jj_Make_detail.m_status == 0}">
			          				0.생산요청
			          			</c:when>
			          			<c:when test="${jj_Make_detail.m_status == 1}">
			          				1.영업생산요청
			          			</c:when>
			          			<c:when test="${jj_Make_detail.m_status == 2}">
			          				2.생산중
			          			</c:when>
			          			<c:when test="${jj_Make_detail.m_status == 3}">
			          				3.생산완료
			          			</c:when>
			          			<c:when test="${jj_Make_detail.m_status == 5}">
			          				5.수불마감
			          			</c:when>
			          			<c:otherwise>
			          				Unknown
			          			</c:otherwise>
			          		</c:choose>
			          	</h6> <!-- 작업상태 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.p_name}</h6> <!-- 제품명 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.md_worker}</h6> <!-- 작업자 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.m_sdate}</h6> <!-- 작업지시일자 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.md_quantity}</h6> <!-- 지시수량 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.m_due_date}</h6> <!-- 작업완료일자 -->
			          </td>
			          <td class="text-center">
			          	<h6 class="mb-0 text-xs">${jj_Make_detail.md_pro_quantity}</h6> <!-- 생산수량 -->
			          </td>			          
			        </tr>
				  </c:forEach>
		      </tbody>
		    </table>
		  </div>
		  
		<!-- 페이징 -->
		<nav aria-label="Page navigation example" class="mt-3 mb-3">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${page.startPage > page.pageBlock}">
			    <li class="page-item disabled">
			      <a class="page-link" href="jjmakeSearch?currentPage=${page.startPage-page.pageBlock}" tabindex="-1">
			        <i class="fa fa-angle-left"></i>
			        <span class="sr-only">이전</span>
			      </a>
			    </li>
		    </c:if>
    		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
            	<li class="page-item"><a class="page-link" href="#" onclick="jjmakeSearchFn(${i})">${i}</a></li>
 			</c:forEach>
 			<c:if test="${page.endPage < page.totalPage}">
			    <li class="page-item">
			      <a class="page-link" href="jjmakeSearch?currentPage=${page.startPage+page.pageBlock}">
			        <i class="fa fa-angle-right"></i>
			        <span class="sr-only">다음</span>
			      </a>
			    </li>
		    </c:if>
		  </ul>
		</nav>
		
		<!-- 검색 -->
        <div class="col-auto text-center">
		  <div class="bg-white border-radius-lg d-inline-flex me-2">
		    <form class="d-flex align-items-center" role="search" action="jjmakeSearch" method="get">
		      <input class="form-control border-0 me-1 px-4" type="search" 
		              id="keyword" name="keyword" value="${md.keyword}" 
		             placeholder="검색어를 입력하세요" aria-label="Search" style="width: 500px;">
		      <button class="btn bg-gradient-primary my-1 me-1" type="submit">검색</button>
		    </form>
		  </div>
		</div>
		
		<!-- 생산 등록 버튼 -->
		<div class="d-flex justify-content-end">
			<c:if test="${sessionScope.dept_no == 104 }"> 
				<button type="button" class="btn btn-primary" id="buyProBtn">생산 요청</button>
			</c:if>
		</div>
		  
		  
		</div>
		 	 	
		
		

   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>