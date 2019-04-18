<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Read Order</title>
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
.img-thumbnail {
	height: 120px;
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
						<th>제품</th>
						<th></th>
						<th>가격</th>
						<th>수량</th>
						<th>총합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.detailList}" var="detail"
						varStatus="status">
						<tr>
							<td><img alt="하아니 이게 왜 안되지?"
								src="/displayFile?fileName=${detail.pdto.images[0]}"
								class="img-thumbnail"></td>
							<td>${detail.pdto.eng_name}<br> ${detail.pdto.kr_name}
							</td>
							<td>${detail.price}</td>
							<td>${detail.amount}</td>
							<td>₩${detail.price * detail.amount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>총합계</td>
						<td>₩${order.total_price}</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>