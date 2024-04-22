<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
                $('#imagePreview').attr('src', e.target.result);
                $('#imagePreviewContainer').show();
            };
            
            reader.readAsDataURL(input.files[0]);
        }
    }

    // 이미지 프리뷰 함수 바인딩
    $('#uploadFile').change(function() {
        previewImage(this);
    });

    // 드롭다운에서 항목 선택시 이벤트 핸들러
    $('.category-item').click(function() {
        var selectedCategory = $(this).text();
       	var sendCategory = $(this).data('category'); 
        $('#pro_midcategory').val(selectedCategory); // 사용자에게 선택된 카테고리 보여주기
        $('#selectedCategory').val(sendCategory); // 실제 서버로 전송될 값 설정
    });
    
    $('.category-item2').click(function() {
        var selectedCategory2 = $(this).text();
    	var sendCategory2 = $(this).data('category2'); 
        $('#f_id').val(selectedCategory2); // 사용자에게 선택된 카테고리 보여주기
        $('#selectedCategory2').val(sendCategory2); // 실제 서버로 전송될 값 설정
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







            <!--===========제품 등록 ===============-->
         
            <div class="col-10">
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
                     <h6 class="px-2 pt-4 ">제품 등록</h6>
                  </div>
                  <div class="card-body px-0 pt-0 pb-2">

                     <!--table-->
                     <div class="table-responsive p-4">
                        <!-- img-->
                  <!-- 이미지 업로드 필드 -->
                  <form action="writeProduct" method="post" name="product" enctype="multipart/form-data">
                     <div class="form-group">
                     
                     <!-- 이미지 미리보기를 위한 컨테이너 -->
                     <div id="imagePreviewContainer" style="display:none;">
                         <img id="imagePreview" style="width: 200px; height: 200px;" alt="Image Preview"/>
                     </div>
                     
                     <!-- 이미지 업로드 -->
                         <label for="uploadFile">이미지 업로드</label>
                         <input type="file" class="form-control" name="uploadFile" id="uploadFile" aria-describedby="inputGroupFileAddon04" aria-label="Upload" onchange="previewImage(this);">
                     </div>
                     
                     

                     
                     

                     <!-- 이미지등록 끝 -->
                        

                        
                     
                        
                           <div class="row">
                              <div class="col-md-6">
                              <!-- 제품 코드 -->
                                 <div class="form-group">
                                    <label for="p_name">제품명</label> 
                                    <input
                                       type="text" class="form-control"
                                       name ="p_name">
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
							          <input type="text" class="form-control" id="pro_midcategory"  readonly>
										</div> 
										<!-- 선택한 제품 분류를 보낼 hidden 필드 -->
										<input type="hidden" id="selectedCategory" name="pro_midcategory">


                                 
                              
                                 <!-- 매출가격  -->
                                 <div class="form-group">
                                    <label for="p_saleprice">매출 가격</label> 
                                    <input
                                       type="text" class="form-control"
                                       id="p_saleprice"
                                       name="p_saleprice">
                                 </div>
                                 
                                 
                                 <!-- 공장구분 -> 공장생산 제품 0 , 구매제품1 -->
                                 <!-- <div class="form-group">
                                    <label for="p_fac_gubun">공장구분</label> 
                                    <input
                                       type="text" class="form-control"
                                       id="p_fac_gubun"
                                       name="p_fac_gubun">
                                 </div> -->
                           

                              </div>
                              <div class="col-md-6">
                           
                              
                              <!-- 제품 공장 : 공장 리스트 검색해서 뿌려주기 -->
                                 
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
							          <input type="text" class="form-control" id="f_id" readonly>
										</div> 
                                 							<!-- 선택한 제품 분류를 보낼 hidden 필드 -->
										<input type="hidden" id="selectedCategory2" name="f_id">

                                 
                                 
                                 
                              
                       
                                 
                                 <!-- 매입가격 -->
                                 <div class="form-group">
                                    <label for="p_buyprice">매입가격</label> 
                                    <input
                                       type="text" class="form-control"
                                       id="p_buyprice" name="p_buyprice">
                                 </div>
                                 
                                 
                                 <!-- 제품상세  -->
                                 <div class="p_content">
                                    <label for="p_content">제품상세</label> 
                                    <input
                                       type="text" class="form-control"
                                       id="p_content"
                                       name="p_content">
                                 </div>
                                 
                                 
               
                              </div>

                           </div>

                           <!-- 버튼 -->
                           <div class="text-right">
                              <button class="btn btn-primary" type="submit">저장</button>
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