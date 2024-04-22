
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<link href="assets/css/LSL/saleDetail.css" rel="stylesheet">
 
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
	 <div class="saleDetail">
	 <label class="saleDetailLabel">판매 상세</label>
	 
	 <div class="titleBox">


		<c:choose>
		    <c:when test="${saleDetail.sale_status_detail eq '판매 진행중'}">
		        <select class="form-control" id="saleStatusSelect">
		            <option value="0" selected="">진행 상태</option>
		            <option value="1">판매 취소</option>
		            <option value="4">판매 완료</option>
		        </select>
		    </c:when>
		    <c:when test="${saleDetail.sale_status_detail eq '생산 완료'}">
		        <select class="form-control" id="saleStatusSelect">
		            <option value="0" selected="">진행 상태</option>
		            <option value="4">판매 완료</option>
		        </select>
		    </c:when>
		</c:choose>

		<div class="saleStatusBox" id="saleStatusBox">${saleDetail.sale_status_detail}</div>
	 	<div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">제목</label>
		    <div type="text" class="form-control" id="detailTitle">${saleDetail.s_title}</div>
		  	<label for="detailManager" id="detailManagerLabel">거래처</label>
		    <div  class="form-control" id="detailManager" >${saleDetail.cust_name}</div>
		  </div>
		  <div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">판매 담당자</label>
		    <div class="form-control" id="detailTitle">${saleDetail.s_manager}</div>
		  	<label for="detailManager" id="detailManagerLabel">거래처 담당자</label>
		    <div  class="form-control" id="detailManager" >${saleDetail.emp_name}</div>
		  </div>
		</div>

		<div class="colNote">비고</div>
			 <textarea class="colNoteBox"  id="colNoteBox" disabled="disabled">${saleDetail.s_note}</textarea>
			  
			  <div>
				  	 <input type="hidden" id="cust_no" value="${saleDetail.cust_no}">
			  		 <input type="hidden" id="s_date" value="${saleDetail.s_date}">

			  </div>
			
			<div class="saleItemSelectBox">
                <p>제품</p>
                <select class="form-control" name="choices-button" id="saleItemSelect">
                    <option value="item 1" selected="">제품 선택</option>
                    <c:forEach items="${productList}" var="productList">
						<option value="${productList.p_itemcode}" data-saleprice="${productList.p_saleprice}">${productList.p_name}</option>     
                    </c:forEach>                  
                  </select>
                  
                 <p>수량</p>
                 <input type="text" class="saleItemCnt" id="sd_cnt"  name="sd_cnt" disabled="disabled"/>
                 <button type="button" class="btn btn-primary" id="addBtn" >추가</button>
             </div>
		  
			 <div class="form-group" id="saleListItemsContainer">
		   		 <div class="custom-select" id="saleListItems">
		        <ul class="saleList">
		            <li class="saleListTitle">
		                <div>제품명</div>
		                <div>제품 가격</div>
		                <div>제품 수량</div>
		                <div>총 금액</div>
		            </li>
					
            <c:forEach var="productDetail" items="${productDetail}">
                <li class="saleListItem">
                 	<input type="hidden" id=p_saleprice value="${productDetail.p_saleprice}">
                	<input type="hidden" class ="p_itemcode" value="${productDetail.p_itemcode}">
                    <input value="${productDetail.p_name}" disabled="disabled">
                    <input value="${productDetail.sd_price}" disabled="disabled">
                    <input class="sdCnt" value="${productDetail.sd_cnt}" disabled="disabled">
                    <input value="${productDetail.totalMoney}" disabled="disabled">
                    <button type="button" class="btn btn-primary pModifyBtn" id="pModifyBtn"> 수정</button>
                    <button type="button" class="btn btn-primary pDeleteBtn" id="pDeleteBtn"> 삭제</button>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<c:if test="${sessionScope.dept_no == 106 and saleDetail.sale_status_detail eq '판매 진행중'or saleDetail.sale_status_detail eq '생산 완료'}">   	
	<button type="button" class="btn btn-primary" id="saleModify">수정</button>
    <button type="button" class="btn btn-primary" id="saleComple">완료</button>
    </c:if>
    </div> 

    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="assets/js/LSL/saleDetail.js"></script>
  
</body>
</html>
