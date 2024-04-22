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

document.addEventListener("DOMContentLoaded", function() {

	$(document).ready(function() {
		
		
	    // 거래처 분류, 거래처 상태, (사원 드롭다운 주석 처리된 부분 제외) 이벤트 핸들러
	    $('.category-item').click(function() {
	        var selectedText = $(this).text();
	        var selectedValue = $(this).data('category');
	        $('#cust_scomm').val(selectedText);
	        $('#selectedCategory').val(selectedValue);
	    });
		//거래처 상태 
	  // 거래처 상태 드롭다운 이벤트 핸들러
		$('.category-item3').click(function() {
		    var selectedText3 = $(this).text(); // 선택된 항목의 텍스트
		    var selectedValue3 = $(this).data('category3'); // 선택된 항목의 데이터 값
		
		    $('#cust_status').val(selectedText3); // 텍스트 필드에 텍스트 표시
		    $('#sendpIsdeleted3').val(selectedValue3); // 숨겨진 필드에 데이터 값 저장
		});


	    // 거래유형 선택 이벤트 핸들러 통합
	    $('.transaction-type').click(function() {
	        var typeText = $(this).text();
	        var typeId = $(this).data('category2');
	        $('#emp_no').val(typeId); // 사원 번호를 설정
	        $('#cust_type').val(typeText);
	        $('#sendpIsdeleted2').val(typeId);

	        // AJAX 요청 시작
	        var custType = $(this).data('category2');
	        $.ajax({
	            url: '/getEmployees', 
	            type: 'GET',
	            data: {cust_type: custType},
	            dataType: 'json',
	            success: function(data) {
	                console.log('Received data:', data);
	                var options = "";
	                for (var i=0; i< data.length; i++) {
	                    options += "<option value='" + data[i].emp_no + "'>" + data[i].emp_name + "</option>";

	                    $("#selectedCategory4").val(data[0].emp_no);
	                    }
	                    
	                    $("#selectItemCode").html(options);

	                 // 드롭다운 변경 이벤트 핸들러 추가
	                    $("#selectItemCode").change(function() {
	                    	var selectedEmpNo = $(this).val(); // 선택된 사원 번호 가져오기
	                        $("#selectedCategory4").val(selectedEmpNo); // 숨겨진 필드에 사원 번호 설정
	                    });
	                    
	                    /*  */
	               
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('AJAX error:', textStatus, 'Error:', errorThrown);
	                alert('사원 정보를 가져오는 데 실패했습니다: ' + textStatus);
	            }
	        });
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
         

            <!--===========제품상세 ===============-->
            <div class="col-10">
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
                     <h6 class="px-2 pt-4 ">거래처 등록</h6>
                  </div>
                  <div class="card-body px-0 pt-0 pb-2">

                     <!--table-->
                     <div class="table-responsive p-4">
                     
                     
                     
            
                        
      <form action ="createCustomer" method="post" name="customer">
    <div class="row">
        <div class="col-md-6">
        
         <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="transactionTypeDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                거래유형 선택
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="transactionTypeDropdown">
                                <li class="dropdown-item transaction-type" data-category2="0">판매처</li>
                                <li class="dropdown-item transaction-type" data-category2="1">구매처</li>
                            </ul>
                        </div>

                                       <!-- 제품 분류 표시를 위한 입력 필드 -->
                             <div class="form-group">
                                 <label for="cust_type">거래유형</label> 
                               <input type="text" class="form-control" id="cust_type" >
                              </div> 
                                                      <!-- 선택한 제품 분류를 보낼 hidden 필드 -->
                              <input type="hidden" id="sendpIsdeleted2" name="cust_type">
        
            <div class="form-group">
                <label for="cust_name">거래처명</label> 
                <input type="text" class="form-control" id="cust_name" name="cust_name">
            </div>
            
    
    
             <div class="form-group">
                <label for="cust_tel">거래처 연락처</label> 
                <input type="text" class="form-control" id="cust_tel" name="cust_tel">
            </div>
            
               <div class="form-group">
                <label for="cust_b_num">거래처 사업자번호</label> 
                <input type="text" class="form-control" id="cust_b_num" name="cust_b_num">
            </div>
            
            <!-- 드롭다운 거래처 중분류 -->
         <%--   <div class="dropdown">
               <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                  거래처 분류 선택
               </button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                   <c:forEach var="comm" items="${cust}">
                       <li class="dropdown-item category-item" data-category="${comm.comm_mcd}">${comm.comm_content}</li>
                   </c:forEach>
               </ul>
           </div> --%>
          <%--  <div class="form-group">
			    <label for="custCategorySelect">거래처 분류 선택:</label>
			    <select class="form-control" id="custCategorySelect" name="custCategory">
			        <c:forEach var="comm" items="${cust}">
			            <option value="${comm.comm_mcd}">${comm.comm_content}</option>
			        </c:forEach>
			    </select>
			</div> --%>
           
   
           <!-- 제품 분류 표시를 위한 입력 필드 -->
    <!--        <div class="form-group">
               <label for="cust_scomm">거래처 분류</label> 
             <input type="text" class="form-control" id="cust_scomm"  readonly>
            </div> 
            선택한 제품 분류를 보낼 hidden 필드
            <input type="hidden" id="selectedCategory" name="cust_scomm">
 -->
            
                         <!--드롭다운 -->
                     <!-- 거래유형 드롭다운 -->
                       <!--  <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="transactionTypeDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                거래유형 선택
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="transactionTypeDropdown">
                                <li class="dropdown-item transaction-type" data-category2="0">판매처</li>
                                <li class="dropdown-item transaction-type" data-category2="1">구매처</li>
                            </ul>
                        </div>

                                       제품 분류 표시를 위한 입력 필드
                             <div class="form-group">
                                 <label for="cust_type">거래유형</label> 
                               <input type="text" class="form-control" id="cust_type" >
                              </div> 
                                                      선택한 제품 분류를 보낼 hidden 필드
                              <input type="hidden" id="sendpIsdeleted2" name="cust_type"> -->
            
         <!--  -->
            
            
        </div>
        <div class="col-md-6">
        
		 <div class="form-group mt-">
					    <label for="custCategorySelect">거래처 분류 선택:</label>
					    <select class="form-control" id="custCategorySelect" name="custCategory">
					        <c:forEach var="comm" items="${cust}">
					            <option value="${comm.comm_mcd}">${comm.comm_content}</option>
					        </c:forEach>
					    </select>
					</div>


           <div class="form-group">
                <label for="cust_boss">거래처 사장</label> 
                <input type="text" class="form-control" id="cust_boss" name="cust_boss">
            </div>

         <!--    <div class="form-group">
                <label for="cust_type">거래처 타입</label> 
                <input type="text" class="form-control" id="cust_type" name="cust_type">
            </div> -->
            <div class="form-group">
                <label for="cust_email">거래처 이메일</label> 
                <input type="text" class="form-control" id="cust_email" name="cust_email">
            </div>
                     <!--드롭다운 -->
			            <div class="form-group">
			    <label for="custStatusSelect">거래처 상태:</label>
			    <select class="form-control" id="custStatusSelect" name="cust_status">
			        <option value="0">거래중</option>
			        <option value="1">거래안함</option>
			    </select>
			</div>
            
                 <!-- <div class="dropdown">
                                 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
                                    거래처 상태
                                 </button>
                                 <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton3">

                                         <li class="dropdown-item category-item3" data-category3="0">거래중</li>
                                      <li class="dropdown-item category-item3" data-category3="1">거래안함</li>
                                 </ul>
                             </div>
                                       제품 분류 표시를 위한 입력 필드
                             <div class="form-group">
                                 <label for="cust_status">거래상태</label> 
                               <input type="text" class="form-control" id="cust_status" >
                              </div> 
                                                      선택한 제품 분류를 보낼 hidden 필드
                              <input type="hidden" id="sendpIsdeleted3" name="cust_status">
             -->
         <!--  -->
            
            
            <!-- 사원 ex -->
            <!-- 사원 드롭다운, 초기에는 비어있음 -->
         <div class="dropdown">
           <label for="cust_status">사원 선택</label> 
         <select class="form-select mr-2" name="search" id="selectItemCode"></select>
             
             <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                 <!-- 사원 목록은 여기에 동적으로 채워집니다 -->
              
             </ul>
                
         </div>
       
            <input type="hidden" id="selectedCategory4" name="emp_no" >

                   
        </div>
    </div>
    
    <!-- 버튼 -->
   <div class="text-right">
    <input class="btn btn-primary" type="submit" value="등록"/>
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