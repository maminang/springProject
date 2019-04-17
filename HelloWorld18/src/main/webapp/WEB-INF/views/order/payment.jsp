<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
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