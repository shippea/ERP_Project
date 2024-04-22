
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<link href="assets/css/LSL/buyDetail.css" rel="stylesheet">
 
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
	 <div class="buyDetail mt-0">
	 <label class="buyDetailLabel">구매 상세</label>
	 
	 <div class="titleBox">


		<c:if test="${buyingDetail.buy_status_detail eq '구매 진행중'}">
		    <select class="form-control" id="buyStatusSelect">
		        <option value="0" selected="">진행 상태</option>
		        <option value="1">구매 취소</option>
		        <option value="2">구매 완료</option>
		    </select>
		</c:if>
		<c:if test="${buyingDetail.buy_status_detail ne '구매 진행중'}">
		    <select class="form-control" id="buyStatusSelect" disabled>
		        <option value="0" selected="">진행 상태</option>
		        <option value="1">구매 취소</option>
		        <option value="2">구매 완료</option>
		    </select>
		</c:if>
		
		<div class="buyStatusBox" id="buyStatusBox">${buyingDetail.buy_status_detail}</div>
	 
	 	<div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">제목</label>
		    <div type="text" class="form-control" id="detailTitle">${buyingDetail.buy_title}</div>
		  	<label for="detailManager" id="detailManagerLabel">거래처</label>
		    <div  class="form-control" id="detailManager" >${buyingDetail.cust_name}</div>
		  </div>
		  <div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">구매 담당자</label>
		    <div class="form-control" id="detailTitle">${buyingDetail.buy_manager}</div>
		  	<label for="detailManager" id="detailManagerLabel">거래처 담당자</label>
		    <div  class="form-control" id="detailManager" >${buyingDetail.emp_name}</div>
		  </div>
		</div>

		<div class="colNote">비고</div>
			 <textarea class="colNoteBox"  id="colNoteBox" disabled="disabled">${buyingDetail.buy_note}</textarea>
			  
			  <div>
				  	 <input type="hidden" id="cust_no" value="${buyingDetail.cust_no}">
			  		 <input type="hidden" id="buy_date" value="${buyingDetail.buy_date}">

			  </div>
			
			<div class="buyItemSelectBox">
                <p>제품</p>
                <select class="form-control" name="choices-button" id="buyingItemSelect">
                    <option value="item 1" selected="">제품 선택</option>
                    <c:forEach items="${productList}" var="productList">
						<option value="${productList.p_itemcode}" data-buyprice="${productList.p_buyprice}">${productList.p_name}</option>     
                    </c:forEach>                  
                  </select>
                  
                 <p>수량</p>
                 <input type="text" class="buyItemCnt" id="bd_cnt"  name="bd_cnt" disabled="disabled"/>
                 <button type="button" class="btn btn-primary" id="addBtn" >추가</button>
             </div>
		  
			 <div class="form-group" id="buyListItemsContainer">
		   		 <div class="custom-select" id="buyListItems">
		        <ul class="buyList">
		            <li class="buyListTitle">
		                <div>제품명</div>
		                <div>제품 가격</div>
		                <div>제품 수량</div>
		                <div>총 금액</div>
		            </li>
	            <c:forEach var="productDetail" items="${productDetail}">
	                <li class="buyListItem">
	                 	<input type="hidden" id=p_buyprice value="${productDetail.p_buyprice}">
	                	<input type="hidden" class ="p_itemcode" value="${productDetail.p_itemcode}">
	                    <input value="${productDetail.p_name}" disabled="disabled">
	                    <input value="${productDetail.bd_price}" disabled="disabled">
	                    <input class="bdCnt" value="${productDetail.bd_cnt}" disabled="disabled">
	                    <input value="${productDetail.totalMoney}" disabled="disabled"> 
	                    <button type="button" class="btn btn-primary pModifyBtn" id="pModifyBtn"> 수정</button>
	                    <button type="button" class="btn btn-primary pDeleteBtn" id="pDeleteBtn"> 삭제</button>
	                </li>
	            </c:forEach>
        </ul>
    </div>
</div>
 <c:if test="${sessionScope.dept_no == 103}"> 
	<c:choose>
    <c:when test="${buyingDetail.buy_status_detail eq '구매 진행중'}">
        <button type="button" class="btn btn-primary" id="buyModify">수정</button>
        <button type="button" class="btn btn-primary" id="buyComple">완료</button>
    </c:when>
</c:choose>
</c:if>
    </div> 
   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="assets/js/LSL/buyDetail.js"></script>
  
</body>
</html>
