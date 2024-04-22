<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 제품 링크에 대한 클릭 이벤트 바인딩
    $('.custLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트 방지

        var custNo = $(this).data('custno'); // 클릭된 요소에서 data-itemcode 추출

        // AJAX 요청
        $.ajax({
            url: "/custDetail",
            method: "GET",
            data: {cust_no: custNo},
            success: function(customer) {
            	  // AJAX 호출 성공 시, 서버로부터 받은 product 객체의 데이터를 입력 필드에 설정
            	
                $('#cust_no').val(customer.cust_no); // 거래처 코드
                $('#cust_bcomm').val(customer.cust_bcomm); // 거래처 대분류 
                $('#cust_scomm').val(customer.cust_scomm); // 거래처 소분류
                $('#cust_boss').val(customer.cust_boss); // 거래처 사장
                $('#cust_type').val(customer.cust_type); // 거래처 타입
                $('#cust_b_num').val(customer.cust_b_num); // 거래처 사업자 번호 
                $('#cust_tel').val(customer.cust_tel); // 거래처 전화번호
                $('#cust_name').val(customer.cust_name); // 거래처명
                $('#cust_email').val(customer.cust_email); // 거래처 이메일
            },
            error: function(xhr, status, error) {
                console.error("서버 오류: " + error);
            }
        });    
    });
});



</script>

<%@ include file="../configHead.jsp"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">

</head>
<style>
/* 필터와 입력창 높이 조절 */
.form-floating .form-select, .form-floating .form-control {
	height: calc(2.2rem + 2px); /* 기본 높이를 줄임 */
	padding: .375rem .75rem; /* 패딩 조정으로 내부 텍스트 높이 조정 */
	font-size: .875rem; /* 필요에 따라 폰트 사이즈 조절 */
}

/* 라벨과 입력창 사이의 간격 줄임 */
.form-floating>label {
	padding: 0 .75rem; /* 라벨의 패딩을 줄임 */
	font-size: .875rem; /* 라벨의 폰트 사이즈 조절 */
	line-height: 1.2; /* 라벨의 라인 높이 조정 */
}

/* 입력 그룹 버튼의 높이와 패딩 조절 */
.input-group>.form-control, .input-group>.btn {
	height: calc(2.2rem + 2px); /* 버튼과 입력창 높이 일치 */
}

/* 버튼 내 아이콘 크기 조절 */
.input-group .btn .fas {
	font-size: .875rem; /* 아이콘 사이즈 조절 */
}

.pagination .page-link {
	border: none !important; /* 테두리 제거 */
	background: none !important;
} /* 배경색 제거, 필요에 따라 */
</style>

<body>
	<div class="min-height-300  position-absolute w-100" style="background-color: black;"></div>
	<!-- Sidebar 사이드바 -->
	<%@ include file="../km/adminSidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Header 헤더 -->
			<%@ include file="../km/adminHeader.jsp"%>
		<div class="comm-body container-fluid py-4">
			<!-- 메인 바디 -->
			<!-- ****** 공통 : 테이블 시작 ****** -->
			<!-- 이 아래부터는 파트별로 자유롭게 활용하시면 됩니다 -->
			<div class="row">
				<!-- 첫번째  -->
				<div class="col-4">
					<div class="card mb-4">
						<div class="card-header pb-0">

 <ul class="nav nav-tabs">
			  <li class="nav-item">
	             <!-- <a class="nav-link active" aria-current="page" href="#">거래처 관리</a> -->
	             <a class="nav-link" href="customerU">거래처 관리</a>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link" href="customerC">거래처 등록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="customerU">거래처 수정</a>
			  </li>
			  
			</ul>


							<!--content name  -->
							<h6 class="px-2 pt-4 pb-4 ">거래처 조회</h6>


			

							<!--검색 및 필터  -->
			<form action="customerSearch">
							<div class="container">
								<!-- 필터 행 -->
								<div class="row">
									<div class="col-4">
										<div class="form-floating">
											<select name="search" class="form-select" id="filter1" aria-label="Filter 1">
												<option value="cust_no">거래처코드</option>
												<option value="cust_name">거래처명</option>
											</select>
										</div>
									</div>
									
									<!--검색 -->
									<div class="col-8">
										<div class="form-floating">
												<div class="row">
									<div class="col">
										<div class="input-group">
											<input type="text" name="keyword" class="form-control" placeholder="입력..."
												aria-label="Search" aria-describedby="button-addon2">
											<button class="btn btn-outline-secondary" type="submit"
												id="button-addon2">
												<i class="fas fa-search"></i>
												<!-- FontAwesome 돋보기 아이콘 -->
											</button>
										</div>
									</div>
								</div>
							</div>
							</div>
							</div>	
							</div>
						</form>

						</div>
						<div class="card-body px-0 pt-0 pb-2">

				<!--table-->
							<div class="table-responsive p-2">
							<c:set var="num" value="${page.total-page.start+1 }"></c:set>
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">거래처코드</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">거래처명</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">대표자</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">거래처 상태 </th>

										</tr>
									</thead>
									<tbody>
									
									<!-- jsp 데이터 리스터 반복문으로 출력  -->
									<c:forEach var="cust" items="${listCustomer}">
										<tr>
											<td>
												<div class="d-flex px-2 py-1">
					
													<div class="d-flex flex-column justify-content-center">
														<!--상품이름을 클릭하면 해당 상세페이지가 옆에 뜨도록 함 -->
													<a href="#" class="custLink" data-custno="${cust.cust_no}">${cust.cust_no}</a>

													</div>
												</div>
											</td>
											<td>
												<p class="text-xs font-weight-bold mb-0">${cust.cust_name}</p>

											</td>
											<td class="align-middle text-center text-sm">
							
											<p class="text-xs font-weight-bold mb-0">
											${cust.cust_boss}
											
											</p>
											
											</td>
											
								<%-- 				<c:if test ="${pr.p_itemcode ==0}">
												<p class="text-xs font-weight-bold mb-0">취급중</p>
											</c:if>
											<c:if test ="${pr.p_itemcode ==1}">
												<p class="text-xs font-weight-bold mb-0">취급안함</p>
											</c:if> --%>
											
											
											<td class="align-middle text-center">
											
												<p class="text-xs font-weight-bold mb-0">
											${cust.cust_status_content}
											
											</p>
											</td>
										</tr>
									<c:set var="num" value="${num - 1 }"></c:set>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<!-- 페이징 -->
	
						<nav aria-label="Page navigation example">
					    <ul class="pagination justify-content-center">
					        <c:if test="${page.startPage > page.pageBlock}">
					            <!-- "이전" 페이지 링크 -->
					            <li class="page-item">
					                <a class="page-link" href="customerR?currentPage=${page.startPage - page.pageBlock}">이전</a>
					            </li>
					        </c:if>
					        
					        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					            <!-- 페이지 번호 링크 -->
					            <li class="page-item ${param.currentPage == i ? 'active' : ''}">
					                <a class="page-link" href="customerR?currentPage=${i}">${i}</a>
					            </li>
					        </c:forEach>
					        
					        <c:if test="${page.endPage < page.totalPage}">
					            <!-- "다음" 페이지 링크 -->
					            <li class="page-item">
					                <a class="page-link" href="customerR?currentPage=${page.startPage + page.pageBlock}">다음</a>
					            </li>
					        </c:if>
					    </ul>
					</nav>
						
						<!-- 페이징 끝 -->
					</div>
				</div>







				<!--===========제품상세 ===============-->
				<div class="col-8">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<!--content name  -->
							<h6>거래처 수정</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">

							<!--table-->
							<div class="table-responsive p-4">
						
<form action = "updateCustomer" method="post" name="customer">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="cust_no">거래처 코드</label> 
                <input type="text" class="form-control" id="cust_no" name="cust_no" readonly >
            </div>
            <div class="form-group">
                <label for="cust_bcomm">담당자 이름</label> 
                <input type="text" class="form-control" id="cust_bcomm" name="cust_bcomm" >
            </div>
    
    		 <div class="form-group">
                <label for="cust_boss">거래처 사장</label> 
                <input type="text" class="form-control" id="cust_boss" name="cust_boss">
            </div>
    
             <div class="form-group">
                <label for="cust_tel">거래처 연락처</label> 
                <input type="text" class="form-control" id="cust_tel" name="cust_tel">
            </div>
            
               <div class="form-group">
                <label for="cust_b_num">거래처 사업자번호</label> 
                <input type="text" class="form-control" id="cust_b_num" name="cust_b_num">
            </div>
            
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="cust_name">거래처명</label> 
                <input type="text" class="form-control" id="cust_name" name="cust_name">
            </div>
            <div class="form-group">
                <label for="cust_scomm">거래처 중분류</label> 
                <input type="text" class="form-control" id="cust_scomm" name="cust_scomm">
            </div>
            <div class="form-group">
                <label for="cust_type">거래처 타입</label> 
                <input type="text" class="form-control" id="cust_type" name="cust_type">
            </div>
            <div class="form-group">
                <label for="cust_email">거래처 이메일</label> 
                <input type="text" class="form-control" id="cust_email" name="cust_email">
            </div>
            
    
         
        </div>
    </div>
    
    <!-- 버튼 -->
   <div class="text-right">
    <input class="btn btn-primary" type="submit" value="수정"/>
 </div> 

    
    
</form>
								


							</div>




						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- ****** 공통 : 테이블 끝 ****** -->

		<!-- Footer 푸터 -->
		<%@ include file="../footer.jsp"%>
	</main>
</body>
</html>