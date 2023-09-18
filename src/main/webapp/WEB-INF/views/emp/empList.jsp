<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 날짜와 숫자 포멧 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 사원 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<p>${result }</p>
	<table>
		<thead>
			<tr>
				<th>Check</th><!-- input type="checkbox" -->
				<th>employee_id</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>email</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
				<th>Delete</th><!-- <button>Del</button> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${empList }" var="emp">
			<!-- items:가져올 데이터, var: 임시 네임 -->
			<!-- <tr onclick="location.href='empInfo?employeeId=${emp.employeeId}'"> -->
				<tr>
					<td><input type="checkbox"></td>
					<td>${emp.employeeId }</td>
					<td>${emp.firstName }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td>
						<fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${emp.jobId }</td>
					<td>${emp.salary } $</td>
					<td><button type="button">Del</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		let message = [
						<c:forEach begin="1" end="5">
						`${result}`,
						</c:forEach>
						];
		
		if(message.length > 0) alert(message.toString());
		
		// 두 가지 이상의 하위요소를 배제할 때.
		$('tbody > tr').on('click', function(e){
			if(e.target.tagName != 'TD') return;
			
			/* 자바 스크립트 방식 */
			// let empId = e.currentTarget.firstElementChild.nextElementSibling.textContent;
			
			/* jquery 방식 */
			let empId = $(e.currentTarget).find('td:nth-of-type(2)').text();
												// 'td:eq(1)'
			
			location.href= 'empInfo?employeeId=' + empId;
		});
	</script>
</body>
</html>













