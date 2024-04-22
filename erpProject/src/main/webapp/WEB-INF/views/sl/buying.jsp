
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<link href="assets/css/LSL/buying.css" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >

<!--한국어  달력 쓰려면 추가 로드-->
 <script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script> 
 <script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
 <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

 
<head>
<%@ include file="../configHead.jsp"%>
</head>

<body>
 	<div class="min-height-300 bg-primary position-absolute w-100"></div>
 	<!-- Sidebar 사이드바 -->
  	<%@ include file="../sidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
 	<!-- Header 헤더 -->
 	<%@ include file="../header.jsp"%> 
    <div class="comm-body container-fluid py-4"> <!-- 메인 바디 -->
    
	 <!-- ****** 공통 : 테이블 시작 ****** -->
	
	 <!-- 이 아래부터는 파트별로 자유롭게 활용하시면 됩니다 -->
	 <div class="buyingList mt-0">
	 <label class="buyLabel">구매 조회</label>
	  <!-- search bar -->
		<div class="searchBar">
		
			<div class="container-fluid">
			     <!-- datePicker -->	    
				<input type="date" id="datePicker"  value="${buying.buy_date}"     class="form-control" >
				
			     <form action="searchKeyword">
			      <input class="form-control me-2" id="search" name="keyword" type="search" placeholder="거래처명을 입력하세요." aria-label="Search">
			     <button class="btn btn-primary" id ="searchBtn"  type="submit">검색</button>
			  </form>
			  <select class="form-control" id="optionBox" name="choices-button" id="choices-button">
				  <option value="" selected="">진행 상태</option>
				  <option value="0">구매 진행중</option>
				  <option value="1">구매 취소</option>
				  <option value="2">구매 완료</option>
				    <option value="5">수불 완료</option>
				</select>
			  
			  </div>
		</div>
	
		  <table class="table table-hover" id="table">
		  <thead>
		    <tr>
		      <th scope="col">NO</th>
		      <th scope="col">제목</th>
		      <th scope="col">거래처</th>
		      <th scope="col">등록 날짜</th>
		      <th scope="col">담당자</th>
		      <th scope="col">제품 수</th>
		      <th scope="col">총 수량</th>
		      <th scope="col">총 금액</th>
		      <th scope="col">진행 상태</th>
		    </tr>
		  </thead>
		  <tbody class="buyingList">
		   <c:forEach items="${buyAlllist}" var="buyAlllist" varStatus="loop" >
		    <tr>
		      <th scope="row">${loop.index + 1}</th>
		      <td><a href="buyDetail?cust_no=${buyAlllist.cust_no}&&buy_date=${buyAlllist.buy_date}">${buyAlllist.buy_title}</a></td>
		      <td>${buyAlllist.cust_name}</td>
		      <td><fmt:formatDate value="${buyAlllist.buy_wdate}" pattern="yyyy-MM-dd" /></td>
		      <td>${buyAlllist.buy_manager}</td>
		      <td>${buyAlllist.productCnt}</td>
		      <td>${buyAlllist.totalCnt}</td>
		      <td>${buyAlllist.totalMoney}</td>
		      <td>${buyAlllist.buy_status_detail}</td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
		<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							<c:if test="${buypage.startPage > buypage.pageBlock}">
									<li class="page-item"><a class="page-link" href="buying?currentPage=${buypage.startPage - buypage.pageBlock}">◁</a></li>
								</c:if>
								<c:forEach var="i" begin="${buypage.startPage}" end="${buypage.endPage}">
									<li class="page-item"><a class="page-link" href="buying?currentPage=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${buypage.endPage < buypage.totalPage}">
									<li class="page-item"><a class="page-link" href="buying?currentPage=${buypage.startPage + buypage.pageBlock}">▷</a></li>
								</c:if>
							</ul>
						</nav>
						
	 <c:if test="${sessionScope.dept_no == 103}"> 
			<a href="buyingApply">			
		<button type="button" class="btn btn-primary" id="buyProBtn">구매 신청</button>
		</a>
	</c:if>
	
    </div> 
   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="assets/js/LSL/buying.js"></script>



</body>
</html>
