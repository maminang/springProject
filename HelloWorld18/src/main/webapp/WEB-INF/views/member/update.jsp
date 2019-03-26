<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/update" method="post">
		ID : <input name="id" readonly="readonly" value="${dto.id }"><br>
		NAME : <input name="name" required="required" value="${dto.name }"><br>
		AGE : <input name="age" required="required" value="${dto.age }"><br>
		<input type="submit">
	</form>
</body>
</html>