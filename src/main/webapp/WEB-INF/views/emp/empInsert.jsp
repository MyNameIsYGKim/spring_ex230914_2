<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 등록</title>
</head>
<body>
	<form action="empInsert" method="post">
		<div>
			<label>first_name : <input type="text" name="firstName"></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="lastName" required="required"></label>
		</div>
		<div>
			<label>email : <input type="email" name="email" required="required"></label>
		</div>
		<div>
			<label>hire_date : <input type="text" name="hireDate" required="required"></label>
		</div>
		<div>
			<label>job_id : <input type="text" name="jobId" required="required"></label>
		</div>
		<div>
			<label>department_id : <input type="number" name="departmentId"></label>
		</div>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>