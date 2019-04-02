<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="../headerBar.jsp" />
	
	<div class="container">
	<form action="member/update" method="post">
		<div class="row" align="center">
			<h3>${mDto.id} 님 환영합니다</h3>
			<a href=infoUpdate.jsp> 회원정보 수정</a>
			<h1>p. ##</h1><br><br>
		</div>
		
		<div class="form-group">
			<label for="pw" class="col-lg-2 ">ID</label>
			<input name="pw" value="${mDto.pw}">
		</div>
		
		<div class="form-group">
			<label for="id" class="col-lg-2 ">ID</label>
			<input name="id" value="${mDto.id}">
		</div>

		<div class="form-group">
			<label for="name" class="col-lg-2 ">name</label>
			<input name="name" value="${mDto.name}">
		</div>

		<div class="form-group">
			<label for="birth" class="col-lg-2 ">birth</label>
			<input name="birth" value="${mDto.birth}">
		</div>

		<div class="form-group">
			<label for="e-mail" class="col-lg-2 ">e-mail</label>
			<input name="email" value="${mDto.email}">
		</div>

		<div class="form-group">
			<label for="address" class="col-lg-2 ">address</label>
			<input name="address" value="${mDto.address}">
		</div>

		<div class="form-group">
			<label for="phone" class="col-lg-2 ">phone</label>
			<input name="phone" value="${mDto.phone}">
		</div>


		<br>
		<button class="btn" type="submit">수정</button>
		<button class="btn" type="reset">초기화</button>
		<br><br>
	</form>
	</div>




<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
<jsp:include page="../footerBar.jsp" />	
</body>
</html>