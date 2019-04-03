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
	<form action="member/mypage" method="post">
		<div class="row" align="center">
			<h3>${mDto.id} 님 환영합니다</h3>
			<a href="/member/updateui?id=${mDto.id}"> 회원정보 수정</a>
			<h1>p. ##</h1><br><br>
		</div>
		
		<div class="form-group">
			<label for="id" class="col-lg-2 ">ID</label>
			${mDto.id}
		</div>

		<div class="form-group">
			<label for="name" class="col-lg-2 ">name</label>
			${mDto.name}
		</div>

		<div class="form-group">
			<label for="birth" class="col-lg-2 ">birth</label>
			${mDto.birth}
		</div>

		<div class="form-group">
			<label for="e-mail" class="col-lg-2 ">e-mail</label>
			${mDto.email}
		</div>

		<div class="form-group">
			<label for="address" class="col-lg-2 ">address</label>
			
			${mDto.postNum}
			${mDto.address}
			${mDto.DTL_ADRES}
		</div>

		<div class="form-group">
			<label for="phone" class="col-lg-2 ">phone</label>
			${mDto.phone}
		</div>
		
<!-- ::::::::::::::::::::::::::::::::::::::::::::::::주문List:::::::::::::::::::::::::::::::::::: -->
		<c:forEach items="#" var="#">
			<tr>
<%-- 				<td>${pno}</td> --%>
<%-- 				<td>${eng_name}</td> --%>
<%-- 				<td>${kr_name}</td> --%>
<%-- 				<td>${prdct_dscrp}</td> --%>
<%-- 				<td>${volume}</td> --%>
<%-- 				<td>${price}</td> --%>
			</tr>
		</c:forEach>
<!-- 		<img alt="#" src="img"> -->
		<a>주문List</a> |
		<a href="#">배송조회</a><br>
		주문List주문List주문List주문List주문List주문List주문List주문List주문List주문List
		
<!-- ::::::::::::::::::::::::::::::::::::::::::::::::내가 한 Q&A:::::::::::::::::::::::::::::::::::: -->
		
		
	</form>
	</div>




<script type="text/javascript">
	$(document).ready(function(){
		/* if (${empty login}) {
			alert("dddddddddd");
			self.location="/member/login";
		} */
	});
</script>
<jsp:include page="../footerBar.jsp" />	
</body>
</html>