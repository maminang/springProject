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
			<form action="/member/pointCharge" method="post">
				<div class="form-group">
					<input type="hidden" name="id" value="${login.id}"> <input
						placeholder="충전할 금액을 입력해 주세요" name="point" class="form-control">
					<input type="submit" class="btn">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
	<jsp:include page="../footerBar.jsp" />
</body>
</html>