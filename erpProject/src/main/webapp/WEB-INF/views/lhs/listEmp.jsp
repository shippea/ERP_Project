<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원관리 </h1>
	
	<table>
		<tr><th>사원번호</th><th>사원이름</th><th>사원역할</th></tr>
			<c:forEach var="emp" items="${listEmp }">
				<tr><td>${emp.dept_name }</td>
					<td>${emp.emp_no }</td>
					<td><a href="lhsIndex?emp_no=${emp.emp_no }">${emp.emp_name }</a></td>
					<td>${emp.emp_role }</td></tr>
			</c:forEach>
			
			
	</table>	
	



</body>
</html>