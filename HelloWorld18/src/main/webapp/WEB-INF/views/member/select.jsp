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
	<a href="/member/insertui">회원 등록</a><br>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="member">
				<tr>
					<td>${member.id}</td>
					<td><a href="/member/selectById?id=${member.id}">${member.name}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>