	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../configHead.jsp"%>
<style>
@import url("https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css");
/*--------------------------------------------------------------
# community-post
--------------------------------------------------------------*/
.section {
	margin-right:100px;
}

.col-lg-6 {
    width: 100%;
   
}

.floatright{
	float: right;
}

.btn-primary {
    --bs-btn-color: #0d6efd;
/*     --bs-btn-bg: transparent; */
    --bs-btn-border: 1px solid #0D6DFD;
    --bs-btn-hover-color: #ffffff;
    --bs-btn-hover-bg: #B52BFC;
    --bs-btn-hover-border: 1px solid #B52BFC;
    --bs-btn-border-radius: 7px;
}
</style>
<script type="text/javascript">
function chk(){
	title_value = document.getElementById("admin_title").value;
	if(title_value.trim() !== "" || title_value === null){
		return true;
	}else{
		alert("제목을 입력해주세요");
		return false;
	}
}
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
	 
	     <section class="section">
    
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">작성하기</h5>
             <%--  <c:if test="${msg!=null}">${msg}</c:if> --%>
              <!-- General Form Elements -->
						<form action="boardWrite" method="post" name="frm">

							<div class="row mb-3">
				 				<label for="inputText" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-10">
									<!-- <input type="text" class="form-control"> -->
									<input type="text" class="form-control" name="b_name"
										value="${board.b_name}" required="required" id="b_name">
								</div>
							</div>

							<div class="row mb-3">
								<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="b_content" id="b_content"
										value="${board.b_content}" style="height: 453px"></textarea>
								</div>
							</div>
							<div class="floatright">
								<button type="submit" class="btn btn-primary">글작성</button>
								 	<!-- <a href="board">글작성 </a></button>      -->
							</div>

						</form>
						<!-- End General Form Elements -->

					</div>
          </div>

        </div>
    </section>
	</main>
	 	 
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>