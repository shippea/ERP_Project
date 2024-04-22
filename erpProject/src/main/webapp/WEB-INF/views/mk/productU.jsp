<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#productImage').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            $('#productImage').attr('src', '../upload/down.jpg');
        }
    }
    
    
    $(document).ready(function() {
        $('.productLink').click(function(e) {
            e.preventDefault();
            var itemCode = $(this).data('itemcode');
            $.ajax({
                url: "/productDetail",
                method: "GET",
                data: {p_itemcode: itemCode},
                success: function(product) {
                    var imagePath = '../upload/' + product.p_image;
                    var categoryMap = {
                        101: '간편식', 102: '냉동식품', 103: '커피 및 차',
                        104: '탄산음료', 105: '주스', 106: '우유 및 유제품'
                    };
                    var category = categoryMap[product.pro_midcategory] || '';
                    $('#p_itemcode').val(product.p_itemcode);
                    /* 제품 분류 */
                    $('#pro_midcategory').val(category);
                    $('#selectedCategory').val(product.pro_midcategory);
                    /* 공장 */
                    $('#f_name').val(product.f_name);
                    $('#selectedCategory2').val(product.f_id);
                    $('#p_saleprice').val(product.p_saleprice);
                    $('#p_buyprice').val(product.p_buyprice);
                    // p_isdeleted 보여주기 
                    $('#p_isdeleted').val(product.p_isdeleted == 0 ? '취급중' : '취급안함');
                    $('#sendpIsdeleted').val(product.p_isdeleted);
                    
                    /*  */
                    $('#p_name').val(product.p_name);
                    $('#productImage').attr('src', imagePath);
                },
                error: function(xhr, status, error) {
                    console.error("서버 오류: " + error);
                }
            });
        });

     


        $('.category-item').click(function() {
            var selectedCategory = $(this).text();
            var sendCategory = $(this).data('category');
            $('#pro_midcategory').val(selectedCategory);
            $('#selectedCategory').val(sendCategory);
        });
        

        $('.category-item2').click(function() {
            var selectedCategory2 = $(this).text();
            var sendCategory2 = $(this).data('category2');
            $('#f_name').val(selectedCategory2);
            $('#f_id').val(selectedCategory2);
            $('#selectedCategory2').val(sendCategory2);
        });
        
        $('.category-item3').click(function() {
            var selectedCategory3 = $(this).text();
            var sendCategory3 = $(this).data('category3');
            $('#p_isdeleted').val(selectedCategory3);
            $('#sendpIsdeleted').val(sendCategory3);
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
			    <!-- <a class="nav-link active" aria-current="page" href="#">제품관리</a> -->
  			    <a class="nav-link" href="productU">제품 관리</a>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link" href="productC">제품 등록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="productU">제품 수정</a>
			  </li>
			  
			</ul>
          



							<!--content name  -->
							<h6 class="px-2 pt-4 pb-4 ">제품 조회</h6>


							

				<!--검색 및 필터  -->
			<form action="updateFormlistSearch">
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
					                <a class="page-link" href="productU?currentPage=${page.startPage - page.pageBlock}">이전</a>
					            </li>
					        </c:if>
					        
					        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					            <!-- 페이지 번호 링크 -->
					            <li class="page-item ${param.currentPage == i ? 'active' : ''}">
					                <a class="page-link" href="productU?currentPage=${i}">${i}</a>
					            </li>
					        </c:forEach>
					        
					        <c:if test="${page.endPage < page.totalPage}">
					            <!-- "다음" 페이지 링크 -->
					            <li class="page-item">
					                <a class="page-link" href="productU?currentPage=${page.startPage + page.pageBlock}">다음</a>
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
							<h6 >제품 수정</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
  	
							<!--table-->
							<div class="table-responsive p-4">
			
						<!-- img-->
								<!-- 이미지 업로드 필드 -->
				<form action="updateProduct" method="post" name="product" enctype="multipart/form-data"> 
						<!-- <form action="updateProduct33" method="post" > -->
						  
							<div class="form-group">
							   <label for="uploadFile">이미지 업로드</label>
					        <input type="file" class="form-control" name="uploadFile" id="uploadFile" aria-describedby="inputGroupFileAddon04" aria-label="Upload" onchange="previewImage(this);">
					        <!-- 이미지 미리보기를 위한 컨테이너와 img 태그 -->
					        <img id="productImage" src="../upload/jinnoodle.jpg" class="img-thumbnail" style="width: 200px; height: 200px;"  alt="Image Preview">
					    </div>
							
 	
							
							

							<!-- 이미지등록 끝 -->
						
					    <div class="row">
					        <div class="col-md-6">
					            <div class="form-group">
					                <label for="p_itemcode">제품코드</label> 
					                <input type="text" class="form-control" id="p_itemcode"  name="p_itemcode"  readonly  >
					            </div>
					           <!--  <div class="form-group">
					                <label for="pro_category">제품 대분류</label> 
					                <input type="text" class="form-control" id="pro_category" name="pro_category" required="required"  >
					            </div> -->
					       <!--      <div class="form-group">
					                <label for="f_id">제품공장</label> 
					                <input type="text" class="form-control" id="f_name" required="required" >
					                <input type="hidden" id="sendFId" name="f_id">
					            </div> -->
					                 <!-- 드롭다운 -->
							        <div class="dropdown">
							            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
							               제품공장
							            </button>
							            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
							                <c:forEach var="f" items="${fList}">
							                    <li class="dropdown-item category-item2" data-category2="${f.f_id}">${f.f_name}</li>
							                </c:forEach>
							            </ul>
							        </div>
							
							        <!-- 제품 분류 표시를 위한 입력 필드 -->
							        <div class="form-group">
							            <label for="f_id">제품 공장</label> 
							          <input type="text" class="form-control" id="f_name" >
										</div> 
                                 							<!-- 선택한 제품 분류를 보낼 hidden 필드 -->
										<input type="hidden" id="selectedCategory2" name="f_id" >
										

                                 
					            
					              <div class="form-group">
					                <label for="p_saleprice">매출 가격</label> 
					                <input type="text" class="form-control" id="p_saleprice"  name="p_saleprice"    >
					            </div>
					              <!-- <div class="form-group">
					                <label for="p_isdeleted">판매상태</label> 
					                <input type="text" class="form-control" id="p_isdeleted"  required="required" >
					                
					            </div> -->
					     <!--        <div class="form-group">
							    <label for="p_isdeleted_dropdown">판매상태</label>
							    드롭다운 메뉴
							    <select class="form-control" id="p_isdeleted_dropdown">
							        <option value="0">취급중</option> '취급중' 선택 시 값 1 저장
							        <option value="1">취급안함</option> '취급안함' 선택 시 값 0 저장
							    </select>
							    숨겨진 입력 필드
							    <input type="text" id="sendPisdeleted" name="p_isdeleted" > 초기값 '취급중' (1)
							</div>
					             -->
				<!--드롭다운 -->
				
				     <div class="dropdown">
							            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
							               판매상태
							            </button>
							            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton3">

							                    <li class="dropdown-item category-item3" data-category3="0">취급중</li>
							   				  <li class="dropdown-item category-item3" data-category3="1">취급안함</li>
							            </ul>
							        </div>
				 						        <!-- 제품 분류 표시를 위한 입력 필드 -->
							        <div class="form-group">
							            <label for="p_isdeleted">취급 여부</label> 
							          <input type="text" class="form-control" id="p_isdeleted" >
										</div> 
                                 							<!-- 선택한 제품 분류를 보낼 hidden 필드 -->
										<input type="hidden" id="sendpIsdeleted" name="p_isdeleted">
				
				<!--  -->
					   
					        
					        </div>
					        <div class="col-md-6">
					            <div class="form-group">
					                <label for="p_name">제품명</label> 
					                <input type="text" class="form-control" id="p_name" name="p_name"  required="required"  >
					            </div>
					             <!-- 드롭다운 -->
							        <div class="dropdown">
							            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							                제품 분류 선택
							            </button>
							            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							                <c:forEach var="comm" items="${proCategory}">
							                    <li class="dropdown-item category-item" data-category="${comm.comm_mcd}">${comm.comm_content}</li>
							                </c:forEach>
							            </ul>
							        </div>
							        
							        
							        <!-- 드롭다운ex -->
							        
							
							        <!-- 제품 분류 표시를 위한 입력 필드 -->
							        <div class="form-group">
							            <label for="pro_midcategory">제품 분류</label> 
							          <input type="text" class="form-control" id="pro_midcategory" >
										</div> 
										<!-- 선택한 제품 분류를 보낼 hidden 필드 -->
										<input type="hidden" id="selectedCategory" name="pro_midcategory" value="${initialMidcategory}">
			
											
					            
					           <!--  <div class="form-group">
					                <label for="pro_midcategory">제품 중분류</label> 
					                <input type="text" class="form-control" id="pro_midcategory" name="pro_midcategory"  required="required" >
					            </div> -->
					            <!-- <div class="form-group">
					                <label for="p_fac_gubun">공장구분</label> 
					                <input type="text" class="form-control" id="p_fac_gubun"  name="p_fac_gubun" required="required" >
					            </div> -->
					            <div class="form-group">
					                <label for="p_buyprice">매입가격</label> 
					                <input type="text" class="form-control" id="p_buyprice"  name ="p_buyprice"  required="required" >
					            </div>
					          <!--   <div class="form-group">
					                <label for="exampleFormControlInput7">판매 담당자</label> 
					                <input type="text" class="form-control" id="exampleFormControlInput7"  required="required" >
					            </div> -->
					         
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