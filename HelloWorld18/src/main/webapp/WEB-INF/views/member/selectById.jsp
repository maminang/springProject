<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ID: ${dto.id }<br>
NAME: ${dto.name }<br>
AGE: ${dto.age }<br>
regdate: ${dto.regdate }<br>

<a href="/member/updateui?id=${dto.id }">수정</a>
<a href="/member/delete?id=${dto.id }">삭제</a>
<a  href="/member/select">목록</a>
</body>
</html>