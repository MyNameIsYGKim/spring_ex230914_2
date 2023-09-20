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
	<button type="button">선택삭제</button>
	<button type="button" onclick="location.href='empInsert'">등록</button>
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
		
		// 단건삭제
		$('tr button').on('click', empInfoDel);
		
		function empInfoDel(event){
			let trTag = event.currentTarget.closest('tr');
			let empId = $(trTag).children().eq(1).text();
			
			$.ajax('empDelete?employeeId='+empId)
			.done(result => {
				console.log(result);
				//trTag.remove();
				
				let deletedId = result.list[0];
				$('tbody > tr > td:nth-of-type(2)').each(function(idx, tag){
					if(tag.textContent == deletedId){
						$(tag).parent().remove();
					}
				})
			})
			.fail(reject => console.log(reject));
		};
		// 선택삭제
		$('button:eq(0)').on('click', empListDelete);
		
		function empListDelete(event){
			// 선택한 사원번호를 가지는 배열
			let empIdList = getEmpList();
			
			// ajax
			$.ajax('empDelete', {
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(empIdList)
			})
			.done(result=>{
				if(result){
					// 강제 페이지 전환 방법(ajax에 부적합!)
					location.href='empList';
					
					
				}
			})
			.fail(reject => console.log(reject));
		}
		
		function getEmpList(){
			let checkTag = $('tbody input[type="checkbox"]:checked');
			
			let empList = [];
			checkTag.each(function(idx,inTag){
				let empId = $(inTag).parent().next().text();
				empList.push(empId);
			});
			
			return empList;
		}
	</script>
</body>
</html>













