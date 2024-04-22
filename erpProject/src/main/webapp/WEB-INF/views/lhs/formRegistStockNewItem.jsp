<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<link href="assets/css/LSL/buyDetail.css" rel="stylesheet">

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

	.titleBox {
		margin-left: 20px;
	}
	
	.container-fluid{
		width: 97%;
	}
	
	#detailManagerLabel, #detailManager{
		margin-left: -20px
	}
	
	.form-control {
		width: 250px;
		margin-left: 0px;
	}
	
	.temporayBtn {
		position: absolute;
	    right: 	100px;
	}

	#saveBtn {
		position: absolute;
		right: 120px;
		margin-right: 25px;
	}
	
	.row {
		width: 93%;
		margin-left: 50px;
	}
	
	#registStockBeginBtn {
	    background-color: #d3d3d3; /* 클릭 시 회색 계열로 변경 */
	    border-color: #d3d3d3; /* 테두리 색상도 함께 변경 */
	    color: #fff; /* 텍스트 색상을 흰색으로 변경 */
	}
	
	#selectItemCode {
		width: 300px; /* 화면 폭의 절반을 차지하도록 설정 */
		height: 35px;
		padding-left: 15px;
	}
	
	.input-group {
		text-align: center;
		width: 200px; /* 화면 폭의 절반을 차지하도록 설정 */
	    margin-left: 15px; /* 오른쪽 여백 추가 */
	}
	
	.sysdate {
		text-align: center;
	}
	
	
</style>


<script>
document.addEventListener("DOMContentLoaded", function() {
    
	var currentDate = "${stock.st_year_month_day}"; // 현재날짜 가져오기
	var year = currentDate.substring(0, 4);
	var month = currentDate.substring(4, 6);
	var day = currentDate.substring(6, 8);
	var year_month_day = year + "-" + month + "-" + day;
	var value = year_month_day; // 설정할 값
	document.querySelector('.sysdate').value = value;
});

$(document).ready(function () {
	
    var empNo = ${empData.empNo};
    
    $.ajax({
        url: "lhsListProduct",
        type: "GET",
        data: {
        	empNo : empNo
        },
        dataType: "json",
        success: function (data) {
        	
            var options = "";
            for (var i=0; i< data.length; i++) {
            options += "<option value='" + data[i].p_itemcode + "'>" + data[i].p_name + "</option>";
            }
            
            $("#selectItemCode").html(options);
            
            // 처음 드롭다운 메뉴 구성 후 data[0] 상세정보 제공
            var p_itemcode = data[0].p_itemcode;
            
            $.ajax({
                type: "GET",
                url: "lhsGetDataProduct",
                data: {p_itemcode: p_itemcode},
                dataType: "json",
                success: function(data) {
                	
               	   $(".itemCode").val(data.p_itemcode);
               	   $(".itemName").val(data.p_name);
                   $(".quantity").val(0);
                   $(".regdate").val(data.p_regdate);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " - " + errorThrown);
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("Error occurred:", error);
        }
    });


	$("#selectItemCode").change(function() {
	    var p_itemcode = $(this).val();
	    
	    $.ajax({
	        type: "GET",
	        url: "lhsGetDataProduct",
	        data: {p_itemcode: p_itemcode},
	        dataType: "json",
	        success: function(data) {
	        	
	       	   $(".itemCode").val(data.p_itemcode);
	       	   $(".itemName").val(data.p_name);
	           $(".quantity").val(0);
	           $(".regdate").val(data.p_regdate);
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log("Error: " + textStatus + " - " + errorThrown);
	        }
	    });
	});
 
 	
 	// 등록버튼 클릭 시
     $("#registBtn").click(function() {
          // 입력된 값 가져오기
          var itemCode = $(".itemCode").val();
          var itemName = $(".itemName").val();
          var quantity = $(".quantity").val();
          var regdate = $(".regdate").val();
          
          
          $.ajax({
              url: "lhsCheckExistenceNewItem",
              type: "GET",
              data: {
                  p_itemcode: itemCode
              },
              success: function(response) {
                  if (response > 0) {
                      alert("이미 등록된 제품입니다.");
                      return;
                  } else {
                	  
                      if ($("#resultList").find("td:first-child").filter(function() {
                          return $(this).text() === itemCode;
                      }).length > 0) {
                          alert("이미 리스트에 있는 제품코드입니다.");
                          
                          $(".itemCode").val("");
                          $(".itemName").val("");
                          $(".quantity").val("");
                          $(".regdate").val("");
                          return;
                      }
                      
                      // 리스트에 추가
                      var listItem = "<tr><td>" + itemCode + "</td><td>" + itemName + "</td>"+
                     					"<td>" + quantity + "</td><td>" + regdate + "</td>"+
                      					"<td><button type='button' class='btn btn-danger deleteBtn'>삭제</button></td></tr>";
                      $("#resultList").append(listItem);
                      
                      $(".itemCode").val("");
                      $(".itemName").val("");
                      $(".quantity").val("");
                      $(".regdate").val("");
                  }
              },
              error: function(xhr, status, error) {
                  console.error("Error occurred:", error);
              }
          });
          

      });
 	
    // 삭제버튼 클릭 시
    $(document).on("click", ".deleteBtn", function() {
        $(this).closest("tr").remove(); // 클릭된 버튼이 속한 행 삭제
    });
    
    // 저장버튼 클릭 시
    $("#saveBtn").click(function () {
        // 리스트의 각 행을 읽어와서 데이터를 배열에 저장
        var dataToSend = [];
        var year_month = "${stock.st_year_month}"; // 형식 변환 (연도 + 월)
        var year_month_day = "${stock.st_year_month_day}"; // 형식 변환 (연도 + 월 + 일)

        if ($("#resultList").find("tr").find("td:eq(0)").text() === "") {
        	alert("저장할 리스트가 없습니다. 제품을 등록해주세요.")
            return;
        }
        
        $("#resultList").find("tr").each(function () {
            var itemCode = $(this).find("td:eq(0)").text();
            var quantity = $(this).find("td:eq(2)").text();
            
            dataToSend.push({
                p_itemcode: itemCode,
                st_quantity: quantity,
                st_year_month: year_month,
                st_year_month_day: year_month_day
            });
        });

        // Ajax 요청으로 컨트롤러에 데이터 전송
        $.ajax({
            url: "lhsRegistStockNewItem?empNo=" + ${empData.empNo},
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(dataToSend),
            success: function (response) {
            	alert("기초재고에 등록되었습니다.");
                window.location.href = "/lhsListStock?empNo=" + ${empData.empNo};
            },
            error: function (xhr, status, error) {
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
	 <div class="buyDetail">
	 <label class="buyDetailLabel">기초재고 등록</label>
	 
	 		<div class="searchBar">
				<div class="container-fluid">
		               <div class="row">
	                       <div class="col">
	                       		<form action="lhsFormRegistStockNewItem" method="get">
	                     	  		<input type="hidden" name="empNo" value="${empData.empNo}">
	                           		<button type="submit" class="btn btn-primary btn-block" id="registStockBeginBtn">기초재고 등록</button>
	                           	</form>
	                       </div>
	                       <div class="col">
	                       		<form action="lhsFormRegistStockSurvey" method="get">
	                           		<input type="hidden" name="empNo" value="${empData.empNo}">
	                           		<button type="submit" class="btn btn-primary btn-block" id="registStockSurveyBtn">실사 재고조사 등록</button>
	                           	</form>
	                       </div>
	                    </div>
	                    
	                    <div class="row">
                    	  <div class="input-group">
	                    	  	<span class="input-group-text" ><i class="fa-solid fa-calendar-days" ></i></span>
							    <input type="text" class="form-control sysdate" readonly>
						  </div>
						  <select class="form-select mr-2" name="search" id="selectItemCode"></select>
				  		</div>
				  </div>
			</div>
		 
	 <div class="titleBox">
	 
	 	<div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">제품코드</label>
		    <input type="text" class="form-control itemCode" id="detailTitle" placeholder="" readonly>
		  	<label for="detailManager" id="detailManagerLabel">제품명</label>
		    <input type="text" class="form-control itemName" id="detailManager" placeholder="" readonly>
		  </div>
		  <div class="form-group" id="titleBox1">
		    <label for="detailTitle" id="detailTitleLabel">수량</label>
		    <input type="text" class="form-control quantity" id="detailTitle" placeholder="">
		  	<label for="detailManager" id="detailManagerLabel">등록일</label>
		    <input type="text" class="form-control regdate" id="detailManager" placeholder="" readonly>
		  </div>
	 
		   
		</div>

	<div class="temporayBtn">
   	<button type="button" class="btn btn-primary" id="registBtn">등록</button>
  	</div>
   	</div>
   	<div class="text-center">
	   	<table class="table" style="margin-left: 70px; width: 80%; hegight: 30px;">
		    <thead>
		        <tr>
		            <th scope="col">제품코드</th>
		            <th scope="col">제품명</th>
		            <th scope="col">수량</th>
		            <th scope="col">등록일</th>
		            <th scope="col"></th>
		        </tr>
		    </thead>
		    <tbody id="resultList"></tbody>
		</table>
	</div>   	
   	
    <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
  
   
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	 </div>
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>