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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
	<div class="container">
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th></th>
						<th>가격</th>
						<th>주문일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="order">
						<tr>
							<th>${order.ono}</th>
							<th><a href="/order/readOrder?ono=${order.ono}">주문 자세히 보기</a></th>
							<th>${order.total_price}</th>
							<th>${order.order_date}</th>
						</tr>
					</c:forEach>
				</tbody>
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