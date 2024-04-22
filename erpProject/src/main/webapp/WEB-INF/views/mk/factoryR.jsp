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
    $('.factoryLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트 방지

        var fId = $(this).data('fid'); // 클릭된 요소에서 data-itemcode 추출

        // AJAX 요청
        $.ajax({
            url: "/factoryDetail",
            method: "GET",
            data: {f_id: fId},
            success: function(factory) {
            	  // AJAX 호출 성공 시, 서버로부터 받은 product 객체의 데이터를 입력 필드에 설정
            	
                $('#f_id').val(factory.f_id); // 공장코드
                $('#f_admin').val(factory.f_admin); // 공장관리자
                $('#f_manager').val(factory.f_manager); // 공장담당자
                $('#f_name').val(factory.f_name); // 공장이름
                $('#f_tel').val(factory.f_tel); // 공장번호
                $('#f_info').val(factory.f_info); // 공장번호
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
							<h6 class="mb-4">공장 조회</h6>


							
		<!--검색 및 필터  -->
			<form action="factorySearch">
							<div class="container">
								<!-- 필터 행 -->
								<div class="row">
									<div class="col-4">
										<div class="form-floating">
											<select name="search" class="form-select" id="filter1" aria-label="Filter 1">
												<option value="f_id">공장코드</option>
												<option value="f_name">공장이름</option>
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
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">공장코드</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">공장명</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">공장 관리자</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">공장 담당자</th>

										</tr>
									</thead>
									<tbody>
									
									<!-- jsp 데이터 리스터 반복문으로 출력  -->
									<c:forEach var="fac" items="${listFactory}">
										<tr>
											<td>
												<div class="d-flex px-2 py-1">
					
													<div class="d-flex flex-column justify-content-center">
														<!--상품이름을 클릭하면 해당 상세페이지가 옆에 뜨도록 함 -->
													<a href="#" class="factoryLink" data-fid="${fac.f_id}">${fac.f_id}</a>

													</div>
												</div>
											</td>
											<td>
												<p class="text-xs font-weight-bold mb-0">${fac.f_name}</p>

											</td>
											<td class="align-middle text-center text-sm">
							
											<p class="text-xs font-weight-bold mb-0">
											${fac.f_admin}
											
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
											${fac.f_manager}
											
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
							<h6>공장 상세</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">

							<!--table-->
							<div class="table-responsive p-4">
						
								
								<form>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="f_id">공장 코드</label> 
                <input type="text" class="form-control" id="f_id" readonly >
            </div>
            <div class="form-group">
                <label for="f_admin">공장관리자</label> 
                <input type="text" class="form-control" id="f_admin" readonly >
            </div>
    
             <div class="form-group">
                <label for="f_tel">공장 연락처</label> 
                <input type="email" class="form-control" id="f_tel" readonly>
            </div>
            
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="f_name">공장명</label> 
                <input type="email" class="form-control" id="f_name" readonly>
            </div>
            <div class="form-group">
                <label for="f_manager">공장 담당자</label> 
                <input type="email" class="form-control" id="f_manager" readonly>
            </div>
            <div class="form-group">
                <label for="f_info">공장 특이사항 </label> 
                <input type="email" class="form-control" id="f_info" readonly>
            </div>
    
         
        </div>
    </div>
    
    <!-- 버튼 -->
<!--     <div class="text-right">
    <button class="btn btn-primary" type="button">저장</button>
 </div> -->

    
    
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