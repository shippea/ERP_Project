<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>현승 Index </h1>
	<a href="lhs">사원 리스트</a><p>
	<a href="lhsListStock?emp_no=${empData.emp_no}">기초기말 재고 조회</a><p>
	<a href="lhsManageRegistStock?emp_no=${empData.emp_no}">재고관리</a><p>
	<a href="lhsListRnPCondBuy?emp_no=${empData.emp_no}">수불내역 조회(폼4개)</a><p>

</body>
</html>