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

	<div class="container">
		<div class="row">
			<form action="/user/loginpost" method=post>
				<div class="form-group">
					<label for="userId">ID</label> <input id="userId"
						class="form-control" name="userId"> <label for="userPw">PW</label>
				</div>
				<div class="form-group">
					<input id="userPw" class="form-control" name="userPw"
						type="password">
				</div>
				<div class="form-group">
					<input type="submit" class="form-control btn btn-primary">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>