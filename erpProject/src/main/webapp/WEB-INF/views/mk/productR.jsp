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
    $('.productLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트 방지

        var itemCode = $(this).data('itemcode'); // 클릭된 요소에서 data-itemcode 추출

        // AJAX 요청
        $.ajax({
            url: "/productDetail",
            method: "GET",
            data: {p_itemcode: itemCode},
            success: function(product) {
            	  // AJAX 호출 성공 시, 서버로부터 받은 product 객체의 데이터를 입력 필드에 설정
            	var imagePath ='../upload/' +product.p_image;
            	var categoryMap = {
            		    101: '간편식',
            		    102: '냉동식품',
            		    103: '커피 및 차',
            		    104: '탄산음료',
            		    105: '주스',
            		    106: '우유 및 유제품'
            		};
            	var midCategory = product.pro_midcategory;
            	var category = categoryMap[midCategory] || ''; // pro_midcategory에 해당하는 카테고리가 없으면 빈 문자열 반환

                $('#p_itemcode').val(product.p_itemcode); // 제품코드
                $('#pro_category').val(product.pro_category); //제품대분류
               	$('#pro_midcategory').val(category);
                $('#f_name').val(product.f_name); // 제품공장
                 $('#p_buyprice').val(product.p_buyprice); // 매입가격
                $('#p_isdeleted').val(product.p_isdeleted==0? '취급중':'취급안함'); // 취급여부
                $('#p_regdate').val(product.p_regdate); // 등록날자
                $('#p_name').val(product.p_name); // 제품코드
                $('#p_fac_gubun').val(product.p_fac_gubun); // 제품명
                $('#p_saleprice').val(product.p_saleprice);
                // 이미지 경로 업데이트
                $('#productImage').attr('src',imagePath);
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
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- Sidebar 사이드바 -->
	<%@ include file="../sidebar.jsp"%>
	<main class="main-content position-relative border-radius-lg ">
		<!-- Header 헤더 -->
		<%@ include file="../header.jsp"%>
		
		<div class="comm-body container-fluid py-4">
			<!-- 메인 바디 -->
			<!-- ****** 공통 : 테이블 시작 ****** -->
			<!-- 이 아래부터는 파트별로 자유롭게 활용하시면 됩니다 -->
			<div class="row">
				<!-- 첫번째  -->
				<div class="col-4">
					<div class="card mb-4">
						<div class="card-header pb-0">




							<!--content name  -->
							<h6 class="mb-4">제품 조회</h6>


							

				<!--검색 및 필터  -->
			<form action="listSearch">
							<div class="container">
								<!-- 필터 행 -->
								<div class="row">
									<div class="col-4">
										<div class="form-floating">
											<select name="search" class="form-select" id="filter1" aria-label="Filter 1">
												<option value="p_itemcode">코드번호</option>
												<option value="p_name">이름</option>
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
						
						
						
						<!-- 검색끝 -->
						</div>
						<div class="card-body px-0 pt-0 pb-2">


							
							<!--table-->
							<div class="table-responsive p-2">
							<c:set var="num" value="${page.total-page.start+1 }"></c:set>
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제품명</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">제품코드</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">카테고리</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">판매여부</th>

										</tr>
									</thead>
									<tbody>
									
									<!-- jsp 데이터 리스터 반복문으로 출력  -->
									<c:forEach var="pr" items="${listProduct}">
										<tr>
											<td>
												<div class="d-flex px-2 py-1">
					
													<div class="d-flex flex-column justify-content-center">
														<!--상품이름을 클릭하면 해당 상세페이지가 옆에 뜨도록 함 -->
													<a href="#" class="productLink" data-itemcode="${pr.p_itemcode}">${pr.p_name}</a>

													</div>
												</div>
											</td>
											<td>
												<p class="text-xs font-weight-bold mb-0">${pr.p_itemcode}</p>

											</td>
											<td class="align-middle text-center text-sm">
							
											<span class="badge badge-sm bg-gradient-success">
											<c:if test = "${pr.pro_midcategory == 101}">
											간편식
											</c:if>
											<c:if test = "${pr.pro_midcategory == 102}">
											냉동식품
											</c:if>
											<c:if test = "${pr.pro_midcategory == 103}">
											커피 및 차
											</c:if>
											<c:if test = "${pr.pro_midcategory == 104}">
											탄산음료
											</c:if>
											<c:if test = "${pr.pro_midcategory == 105}">
											주스
											</c:if>
											<c:if test = "${pr.pro_midcategory == 106}">
											우유 및 유제품
											</c:if>
											
											</span>
											
											</td>
											
								<%-- 				<c:if test ="${pr.p_itemcode ==0}">
												<p class="text-xs font-weight-bold mb-0">취급중</p>
											</c:if>
											<c:if test ="${pr.p_itemcode ==1}">
												<p class="text-xs font-weight-bold mb-0">취급안함</p>
											</c:if> --%>
											
											
											<td class="align-middle text-center">
											
											<span
												class="text-secondary text-xs font-weight-bold">
												<c:if test ="${pr.p_isdeleted==0}">
												취급중
												</c:if>
												<c:if test ="${pr.p_isdeleted==1}">
												취급안함
												</c:if>
												</span>
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
					                <a class="page-link" href="productR?currentPage=${page.startPage - page.pageBlock}">이전</a>
					            </li>
					        </c:if>
					        
					        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					            <!-- 페이지 번호 링크 -->
					            <li class="page-item ${param.currentPage == i ? 'active' : ''}">
					                <a class="page-link" href="productR?currentPage=${i}">${i}</a>
					            </li>
					        </c:forEach>
					        
					        <c:if test="${page.endPage < page.totalPage}">
					            <!-- "다음" 페이지 링크 -->
					            <li class="page-item">
					                <a class="page-link" href="productR?currentPage=${page.startPage + page.pageBlock}">다음</a>
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
							<h6>제품 상세</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
  	
							<!--table-->
							<div class="table-responsive p-4">
			
						<!-- img-->
						<img id="productImage" src="../upload/jinnoodle.jpg" class="img-thumbnail" style="width: 200px; height: 200px;" >

								
								<form>
					    <div class="row">
					        <div class="col-md-6">
					            <div class="form-group">
					                <label for="p_itemcode">제품코드</label> 
					                <input type="email" class="form-control" id="p_itemcode"  readonly >
					            </div>
					         <!--    <div class="form-group">
					                <label for="pro_category">제품 대분류</label> 
					                <input type="email" class="form-control" id="pro_category"  readonly>
					            </div> -->
					            <div class="form-group">
					                <label for="f_name">제품공장</label> 
					                <input type="email" class="form-control" id="f_name"  readonly>
					            </div>
					       
					            
					              <div class="form-group">
					                <label for="p_buyprice">매출 가격</label> 
					                <input type="email" class="form-control" id="p_buyprice"  readonly>
					            </div>
					              <div class="form-group">
					                <label for="p_isdeleted">판매상태</label> 
					                <input type="email" class="form-control" id="p_isdeleted"  readonly>
					            </div>
					            
					        
					        </div>
					        <div class="col-md-6">
					            <div class="form-group">
					                <label for="p_name">제품명</label> 
					                <input type="email" class="form-control" id="p_name"  readonly>
					            </div>
					            <div class="form-group">
					                <label for="exampleFormControlInput5">제품 중분류</label> 
					                <input type="email" class="form-control" id="pro_midcategory"  readonly>
					            </div>
					           <!--  <div class="form-group">
					                <label for="p_fac_gubun">공장구분</label> 
					                <input type="email" class="form-control" id="p_fac_gubun"  readonly>
					            </div> -->
					            <div class="form-group">
					                <label for="p_saleprice">매입가격</label> 
					                <input type="email" class="form-control" id="p_saleprice"  readonly>
					            </div>
					            <div class="form-group">
					                <label for="p_regdate">등록날짜</label> 
					                <input type="email" class="form-control" id="p_regdate"  readonly>
					            </div>
					         
					        </div>
					        
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