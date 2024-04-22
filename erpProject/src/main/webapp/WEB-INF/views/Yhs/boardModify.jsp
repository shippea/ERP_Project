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

</style>
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
	      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>공지사항</h6>
            </div>
            		<section class="section">
			<div class="row justify-content-center">
				<div class="col-lg-13">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">글 수정</h5>

							<!-- General Form Elements -->
							<form id="boardUpdate" method="post" action="/boardUpdate"  enctype="multipart/form-data">
							
								<input type="text" name="b_no" value="${boardContents.b_no}" readonly /> 
								
								<div class="mb-3">
									<input id="ModifyTitle" type="text" class="form-control" name="b_name" placeholder="제목을 입력하세요." value="${boardContents.b_name}">
								</div>
								<div class="mb-3">
									<textarea class="form-control" style="height: 550px;"
										name="b_content" >${boardContents.b_content}</textarea>
								</div>
								<div class="mb-3">
									<button type="button" class="btn bfmCancle" onclick="goBack()">취소</button>
									<button type="submit" class="btn bfmModify">저장</button>
								</div>
							</form>
							<!-- End General Form Elements -->
							</div>
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