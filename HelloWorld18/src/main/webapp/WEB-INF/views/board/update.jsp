<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<form action="/member/update" method="post">
		<div class="row" align="center">
			<h3>${dto.id} 님 회원정보 수정하기
		</div>
		
		<div class="form-group">
			<label for="signUpDate" class="col-lg-2 ">signUpDate</label>
			${dto.signUpDate}
		</div>
		
		<div class="form-group">
			<label for="point" class="col-lg-2 ">point</label>
			${dto.point}
		</div>
		
		<div class="form-group">
			<label for="id" class="col-lg-2 ">ID</label>
			<input id="id" name="id" value="${dto.id}">
		</div>

		<div class="form-group">
			<label for="pw" class="col-lg-2 ">pw</label>
			<a href="/member/updatePWUI?id=${dto.id}">비밀번호 수정하기</a>
		</div>

		<div class="form-group">
			<label for="name" class="col-lg-2 ">name</label>
			<input id="name" name="name" value="${dto.name}">
		</div>
		
		
		<div class="form-group" id="divBirth">
             <label for="birth" class="col-lg-2">birth</label>
        <c:out value="${fn:substring(dto.birth,0,10)}"/>
        </div>

		<div class="form-group">
			<label for="e-mail" class="col-lg-2 ">e-mail</label>
			<input id="email" name="email" value="${dto.email}">
		</div>


		<div class="form-group">
			<label for="postNum" class="col-lg-2 ">postNum</label>
			<input id="postNum" name="postNum" value="${dto.postNum}">
		</div>

		<div class="form-group">
			<label for="address" class="col-lg-2 ">address</label>
			<input id="address" name="address" value="${dto.address}">
			<input id="DTL_ADRES" name="DTL_ADRES" value="${dto.DTL_ADRES}">
		</div>

		<div class="form-group">
			<label for="phone" class="col-lg-2 ">phone</label>
			<input id="phone" name="phone" value="${dto.phone}">
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
<jsp:include page="../footer.jsp" />	
</body>
</html>