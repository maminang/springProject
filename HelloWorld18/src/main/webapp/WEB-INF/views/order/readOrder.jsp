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
.img-thumbnail {
	height: 120px;
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