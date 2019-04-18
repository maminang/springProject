<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Payment</title>
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

img {
	height: 150px;
	width: auto;
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
		<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th>총가격</th>
							<th>남은 포인트</th>
							<th>결제후 포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${order.total_price}</td>
							<td>${point}</td>
							<td>${point-order.total_price}</td>
						</tr>
					</tbody>
				</table>
				<button onclick="checkPoint()" class="btn pull-right" id="checkPoint">결제하기</button>
		</div>
	</div>
	<form action="/order/complete" id="complete">
		
	</form>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			var pointCheck;
			
			$("#checkPoint").click(function () {
				var id = "${order.id}";
				var total_price = "${order.total_price}";
				
				$.ajaxSetup({async: false});
				$.getJSON("/order/checkPoint/" + id + "/" + total_price, function(data) {
					pointCheck = data;
					if (pointCheck) {
						location.href= "/order/complete"
					} else {
						if (confirm("포인트가 부족합니다. 포인트 충전 페이지로 이동하시겠습니까?")) {
							location.href = "/member/pointCharge";
						}
					}
				});
			});
		});
	</script>
</body>
</html>