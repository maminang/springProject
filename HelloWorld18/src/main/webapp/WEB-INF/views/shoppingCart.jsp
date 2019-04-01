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
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<c:if test="${list.pno > 0 }">
								<td>${list.pno}</td>
								<td>가격 아직 안함</td>
								<td>${list.amount}</td>
								<td>가격 * ${list.amount }</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<jsp:include page="footerBar.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>

</body>
</html>