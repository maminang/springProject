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
	NUM: ${dto.num }
	<br> TNAME: ${dto.tname }
	<br> TDAY: ${dto.tday }
	<br>
	<a href="/test/updateUI?num=${dto.num }">수정</a>
	<a href="/test/delete?num=${dto.num}">삭제</a>
	<a href="/test/list">목록</a>
</body>
</html>