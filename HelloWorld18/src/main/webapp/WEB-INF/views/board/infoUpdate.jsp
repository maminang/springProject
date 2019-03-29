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
	<form action="#">
		<div class="row" align="center">
			<h3># 님 환영합니다</h3>
			<h1>p. ##</h1><br><br>
		</div>

		<div class="form-group">
			<label for="id" class="col-lg-2 ">ID</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" readonly><br><br>
			</div>
		</div>

		<div class="form-group">
			<label for="name" class="col-lg-2 ">name</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" ><br><br>
			</div>
		</div>

		<div class="form-group">
			<label for="birth" class="col-lg-2 ">birth</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" ><br><br>
			</div>
		</div>

		<div class="form-group">
			<label for="e-mail" class="col-lg-2 ">e-mail</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" ><br><br>
			</div>
		</div>

		<div class="form-group">
			<label for="address" class="col-lg-2 ">address</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" ><br><br>
			</div>
		</div>

		<div class="form-group">
			<label for="phone" class="col-lg-2 ">phone</label>
			<div class="col-lg-10">
			<input class="form-control" value="#" ><br><br>
			</div>
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