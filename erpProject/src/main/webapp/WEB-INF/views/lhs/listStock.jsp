<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<link href="assets/css/LSL/buying.css" rel="stylesheet">

<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>

<!--한국어  달력 쓰려면 추가 로드-->
 <script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script> 
 
 <link href="assets/js/LSL/buying.js">
 
<head>
<%@ include file="../configHead.jsp"%>
<style>
	#filterOptions {
		position:absolute;
		margin-left: 265px;
		bottom: 5px;
		width: 100px;
	}
	
	.container-fluid {
    	position: relative;
	}
	
    .table {
    	text-align: center;
    }
	
	.form-select {
		height: 36px;
		padding-left: 30px;
	}
	
	#selectItemCode {
		position: absolute;
		width: 300px;
		padding-left: 15px;
		margin-left: 370px;
		margin-top: -40px;
	}
	
	#datePicker {
		text-align: center;
	}
		
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {

    var stockYearMonth = "${stock.st_year_month}";

    // 날짜 값을 입력란에 넣어주기
    if (stockYearMonth) {
    	var year = stockYearMonth.substring(0, 4); // 연도 추출
        var month = stockYearMonth.substring(4, 6); // 월 추출
        var formattedDate = year + "-" + month; // "yyyy-MM" 형식으로 변환
        
        // 날짜 값이 존재할 때만 처리
        var datePicker = document.getElementById("datePicker");
        datePicker.value = formattedDate; // 입력란에 날짜 값 넣기
    }
});

$(document).ready(function () {
	  
    $.ajax({
        url: "lhsListStockEnd",
        type: "GET",
        data: {
        	st_year_month: "${stock.st_year_month}",
        	gubun : "end"
        },
        dataType: "json",
        success: function (data) {
        	
            var options = "";
            for (var i=0; i< data.length; i++) {
            options += "<option value='" + data[i].p_itemcode + "'>" + data[i].p_name + "</option>";
            }
            
            $("#selectItemCode").html(options);
            
            var stockItemCode = "${stock.p_itemcode}";
            
            if (stockItemCode != 0) {
                $("#selectItemCode").val(stockItemCode);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error occurred:", error);
        }
    });
    
    $("#selectItemCode").change(function() {
    	var selectedDate = ${stock.st_year_month};
        var p_itemcode = $("#selectItemCode").val();
        
        $.ajax({
            type: "GET",
            url: "lhsGetDataStockProduct",
            data: {
            	p_itemcode: p_itemcode
            },
            success: function(data) {
            	window.location.href = "lhsListStock?st_year_month=" + selectedDate 
													+ "&p_itemcode=" + p_itemcode;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        });
    });

    	
 	$("#datePicker").change(function () {
        var selectedDate = $("#datePicker").val(); // 변경된 날짜 가져오기
        var year = selectedDate.substring(0, 4); // 연도 추출
        var month = selectedDate.substring(5, 7); // 월 추출
        var formattedDate = year + month; // 형식 변환
        
        $.ajax({
            url: "lhsListStock", // 컨트롤러 URL 설정
            type: "GET", // GET 또는 POST
            data: { 
            	st_year_month: formattedDate
            },
            success: function (data) {
            	window.location.href = "lhsListStock?st_year_month=" + formattedDate;
            },
            error: function (xhr, status, error) {
                // 오류 발생 시 처리할 코드 작성
                console.error("Error occurred:", error);
            }
        });
        
    }); 
    
 	 $("#filterOptions").change(function () {
         // 선택된 날짜와 구분 값 가져오기
         var selectedDate = ${stock.st_year_month}; // 변경된 날짜 가져오기
         var selectedOption = $("#filterOptions").val(); // 변경된 구분 가져오기

         $.ajax({
             url: "lhsListStock", // 컨트롤러 URL 설정
             type: "GET", // GET 또는 POST
             data: { 
                 st_year_month: selectedDate,
                 gubun: selectedOption
             },
             success: function (data) {
            	 window.location.href = "lhsListStock?st_year_month=" + selectedDate 
            			 								+ "&gubun=" + selectedOption;
             },
             error: function (xhr, status, error) {
                 // 오류 발생 시 처리할 코드 작성
                 console.error("Error occurred:", error);
             }
         });
     });
});

</script>
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
	 <div class="buyingList">
	 <label class="buyLabel">월 재고 조회 </label>
	  <!-- search bar -->
		<div class="searchBar">

			<div class="container-fluid">
				<input type="month" id="datePicker" class="form-control" value="${stock.st_year_month}">
		   		<select class="form-select mr-2" name="gubun" id="filterOptions">
					<option value="all" 
						<c:if test ="${param.gubun == 'all'}">
							selected</c:if>>전체</option>
					<option value="begin" 
						<c:if test ="${param.gubun == 'begin'}">
							selected</c:if>>기초</option>
					<option value="end" 
						<c:if test ="${param.gubun == 'end'}">
							selected</c:if>>기말</option>
				</select>
				<select class="form-select mr-2" name="search" id="selectItemCode"></select>
	
			  </div>
		</div>
		
		<c:set var="num" value="${page.total-page.start+1 }"></c:set>
		
	  <table class="table table-hover" id="table">
		  <thead>
		    <tr>
		      <th scope="col">NO</th>
		      <th scope="col">구분</th>
		      <th scope="col">제품코드</th>
		      <th scope="col">제품명</th>
		      <th scope="col">수량</th>
		      <th scope="col">등록일</th>
		    </tr>
		  </thead>
		  
		  <c:choose>
		  
			<c:when test='${listStock == null or empty listStock}'>
				<td colspan="4">
					<p align="center">
						<b><span style=''>조회할 내역이 없습니다.</span></b>
					</p>
				</td>
			</c:when>
			
			<c:when test="${listStock != null }">
				<c:forEach var="stock" items="${listStock }">
				  <tbody>
				    <tr>
				      <th scope="row">${num }</th>
				      <td>${stock.st_begin_end_gubun }</td>
				      <td>${stock.p_itemcode }</td>
				      <td>${stock.p_name }</td>
				      <td>${stock.st_quantity }</td>
				      <td>${stock.st_regdate }</td>
				    </tr>
				  </tbody>
		  		<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${page.startPage > page.pageBlock }">
					<li class="page-item"><a class="page-link" href="lhsListStock?currentPage=${page.startPage-page.pageBlock}
																						&st_year_month=${stock.st_year_month }
																						&gubun=${param.gubun }">◁</a>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item"><a class="page-link" href="lhsListStock?currentPage=${i}&st_year_month=${stock.st_year_month }
																						&gubun=${param.gubun }">${i}</a>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage }">
					<li class="page-item"><a class="page-link" href="lhsListStock?currentPage=${page.startPage+page.pageBlock}
																						&st_year_month=${stock.st_year_month }
																						&gubun=${param.gubun }">▷</a>
				</c:if>	
			</ul>
		</nav>
		<c:if test="${empData.empRole == 'role_admin'}">
				<button type="button" class="btn btn-primary" id="buyProBtn"
					onclick="location.href='lhsManageFormRegistStock'">관리</button>
		</c:if>
    </div> 
   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>