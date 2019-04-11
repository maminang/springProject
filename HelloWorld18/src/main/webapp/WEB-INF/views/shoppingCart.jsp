
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<jsp:include page="headerBar.jsp" />
	<div class="container">
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제품</th>
						<th>용량</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list" varStatus="status">
						<c:if test="${list.pno != 0 }">
							<tr>
								<td>${list.pno}</td>
								<td>${list.volume }</td>
								<td>${list.price }</td>
								<td>${list.amount}</td>
								<td>${list.amount*list.price}</td>
								<td>
									<form method="post">
										<input type="number" value="1" min="1" max="${list.amount }"
											name="amount" required autofocus> <input
											hidden="hidden" value="${list.pno }" name="pno"> <input
											type="hidden" value="${list.volume }" name="volume">
										<button class="X">X</button>
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="/order/checkout" class="btn btn-info">주문하기</a></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>

	<jsp:include page="footerBar.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$(".X").click(function() {
				$("form").attr("action", "/shoppingCart/deleteShoppingCart");
				$("form").attr("method", "GET");
				$("Form").submit();
			});
		});
	</script>

</body>
</html>