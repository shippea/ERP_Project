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
.main-card {
  border: none;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
  min-width: 660px;
  margin: 30px;
}

.card-body {
  padding-bottom: 3rem;
}

.community-post-detail * {
  font-family: "NanumSquare", sans-serif;
}

.post-header .btn-container {
  position: relative;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 0.3rem 0.5rem;
  width: 100%;
  max-width: 200px;
}

.post-header .btn-container:hover button,
.post-header .btn-container:hover i {
  color: #212121;
}

.community-post-header {
  align-items: center;
  position: relative;
  flex-grow: 1;
}

.card-title-header {
  display: flex;
  flex-direction: column;
}

.post-user-container {
  display: flex;
  align-items: center;
  padding: 0.3rem 0.5rem;
  margin-top: 0px;
}

.post-user-name {
  margin-bottom: 0px;
}

.post-user-profile {
  margin-right: 10px;
  font-size: 2em;
}

.post-updated-at {
  margin-bottom: 0px;
}

.post-subtitle {
  display: flex;
  position: relative;
  justify-content: space-between;
  align-items: center;
  flex-direction: row;
  color: #757575;
  font-size: 13px;
  margin-left: 10px;
  margin: 0;
}

.post-veiw-count {
  margin-left: 10px;
  margin-bottom: 0px;
}

/*--------------------------------------------------------------
# community-post-body
--------------------------------------------------------------*/
.community-post-header {
  background-color: #fff !important;
}

.community-post-answer {
  padding: 16px;
  border-top: 1px solid #f1f3f5;
  border-bottom: 1px solid #f1f3f5;
  background-color: #f8f9fa;
}

.community-post-header-body {
  font-size: 16px;
  padding: 16px;
  min-height: 200px;
}

.answer-info-title {
  height: 27px;
  letter-spacing: -0.3px;
  color: #495057;
  font-size: 18px;
  font-weight: 700;
}

.comment-editor {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: row;
}

.comment-user-profile {
  margin-left: 10px;
  font-size: 2em;
}

.btn-container {
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: flex-end;
  height: 30px;
  margin-left: 16px;
  margin-right: 16px;
}

.form-control {
  margin-top: 8px;
  margin-bottom: 8px;
  margin-left: 16px;
  margin-right: 16px;
  min-height: calc(2em + 1rem + 2px);
}

.btn-container form {
  margin-left: 10px;
}

/*--------------------------------------------------------------
# comment
--------------------------------------------------------------*/
.re-comment-body {
  padding: 16px;
  border-top: 1px solid #f1f3f5;
  border-bottom: 1px solid #f1f3f5;
  background-color: #f8f9fa;
}

.markdown-body {
  margin-bottom: 0px;
}

.card-header {
  background-color: #f8f9fa;
}

.comment-header {
  display: flex;
  align-items: center;
  flex-direction: row;
}

.comment-user-profile {
  margin-left: 10px;
  font-size: 2em;
  margin-right: 16px;
}

.comment-user-name {
  margin-bottom: 5px;
}

.comment-header .re-btn-container {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 0.3rem 0.5rem;
  margin-left: auto;
}

.comment-updated-at {
  font-size: 13px;
}

/*--------------------------------------------------------------
# ref-comment
--------------------------------------------------------------*/
.comment-user-profile {
  margin-right: 10px;
  font-size: 2em;
}

/*--------------------------------------------------------------
# btn
--------------------------------------------------------------*/
.btn {
  position: relative;
  width: 100%;
  right: 100%;
  display: inline-block;
  border: none;
  background-color: #7e57c2;
  color: white;
}

.btn:hover {
  background-color: #9575cd;
  color: white;
}

.btn.bfcDelete {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 260px;
  bottom: 10px;
}

.btn.bfcModify {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 140px;
  bottom: 10px;
}

.btn.bfcList {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 20px;
  bottom: 10px;
}

.btn.bacReply {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  left: 20px;
  bottom: 10px;
}

.btn.bacDelete {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 150px;
  bottom: 10px;
}

.btn.bacModify {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 280px;
  bottom: 10px;
}

.btn.bacList {
  position: absolute;
  margin-top: 10px;
  width: 100px;
  right: 20px;
  bottom: 10px;
}

.submitBtn {
  position: absolute;
  width: 80px;
  right: 50px;
  margin-top: -10px;
}

.pagetitle {
  margin: 10px 0;
}

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
		<section class="community-post-detail">
			<div class="row card main-card card-body">
				<div class="card-header community-post-header">
					<h3 class="card-title post-header-title">
						${boardContents.b_name}</h3>
					<div class="card-subtitle post-user-container">
						<i class="bi bi-person-circle post-user-profile"></i>
						<div class="card-title-header">
							<h5 class="card-title post-user-name">
								<a href="#">${boardContents.emp_no}</a>
							</h5>
							<div class="card-subtitle post-subtitle">
								<p class="post-updated-at">
									작성일
									<fmt:formatDate value="${boardContents.b_regdate}"
										pattern="yyyy.MM.dd a hh:mm" />
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="community-post-header-body">
					<span class="post-content">${boardContents.b_content}</span>
				</div>

				<button type="button" class="btn bacList" onclick="goBack()">
					목록
				</button>
					
				<form action="/deleteBoard" method="post">
					<input type="hidden" name="b_no" value="${boardContents.b_no}">
				<button type="submit" class="btn bacDelete">삭제</button>
				</form>
				
				<div class="btnBox">
				
			  <c:if test="${sessionScope.emp_no eq boardContents.emp_no}">            
			  
			  <%-- <input type="button" value="수정" 
				onclick="location.href='boardModify?b_no=${boardContents.b_no}'"> --%>
			  <%-- empno=${emp.empno} --%>
               <a href="boardModify?&b_no=${boardContents.b_no}" class="btn bacModify">
						    <i class="bi bi-highlighter"></i>수정</a>
              
              <%--  <form id="deleteForm" action="/deleteAskBoard" method="post">
		 	 	  	 <input type="hidden" name="cboard_no" value="${boardAskContents.cboard_no}">
		   			 <input type="hidden" name="user_no" value="${boardAskContents.user_no}">
		    		 <button type="submit" class="badge bg-light text-dark"><i class="bi bi-trash"></i> 삭제</button>
			   </form> --%>
                </c:if>
		  		</div>
		  		
				<script>
					function goBack() {
						window.history.back();
					}
				</script>
			</div>
		</section>		
	</main>
	 
    <!-- ****** 공통 : 테이블 끝 ****** -->
   	
   	<!-- Footer 푸터 -->
   	<%@ include file="../footer.jsp"%> 
  </main>
</body>
</html>