<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>CheckOut</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../../resources/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
<!--===============================================================================================-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.col-container {
	display: table; /* Make the container element behave like a table */
	width: 100%; /* Set full-width to expand the whole page */
}

.col {
	display: table-cell;
	/* Make elements inside the container behave like table cells */
}
</style>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../header.jsp" />
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-12">
			<h1 style="text-align: center;">주문하기</h1>
			<hr>
		</div>
	</div>

	<div class="col-container">
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
			<h4>배송지 입력</h4>
			<hr>
			<form action="/order/review">
				<div class="form-group" id="divAddress">
					<label for="divAddress" class="col-lg-2 control-label">주소</label>
						<input value="${order.postNum}" name="postNum" type="text" id="postNum" placeholder="우편번호" class="form-control">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn">
						<input value="${order.address}" name="address" type="text" id="address" placeholder="주소" class="form-control">
						<input value="${order.dtl_adres}" name="DTL_ADRES" type="text" id="DTL_ADRES" placeholder="상세주소" class="form-control">
				</div>
				<label for="shipping_memo">배송 메모</label>
				<textarea cols="5" class="form-control" id="shipping_memo" name="shipping_memo"></textarea>
				<p class="text-right"><input type="submit" class="btn" value="주문검토"></p>
			</form>
		</div>
		<div class="col-sm-2">
			<div class="row">
				<div class="Jumbotron">
					<h3 class="text-center">주문요약</h3>
					<br> 총 합계 : ₩${order.total_price}
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>