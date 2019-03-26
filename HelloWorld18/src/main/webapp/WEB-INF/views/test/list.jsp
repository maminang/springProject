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
	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>tname</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="test">
				<tr>
					<th>${test.num}</th>
					<th><a href="/test/read?num=${test.num}">${test.tname}</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/test/writeUI">글쓰기</a>
</body>
</html>