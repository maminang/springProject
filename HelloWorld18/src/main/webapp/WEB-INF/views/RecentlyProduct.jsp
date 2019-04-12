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
<style type="text/css">
.Recently {
	border: 2px solid red;
	width: auto;
	height: auto;
	text-align: center;
	position: fixed;
	top: auto;
	right: 100px;
}

.img {
	width: 100px;
	height: auto;
	text-align: center;
}
</style>
</head>
<body>



	<div class="Recently">
		<div class="row">
			<c:forEach items="${list }" var="list" varStatus="status">
				<a onclick="location.href='/+-product/read?pno=${list.pno}'">
					<img class="img img-thumbnail" alt="${list.images[0] }"
					src="/displayFile?fileName=${list.images[0]}"><br>
				</a>
				${list.pno }<br>
				${list.eng_name }<br>
			</c:forEach>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$.getJSON("/product/recentlyProduct", function(data) {
				alert(data)
			})
		});
	</script>
</body>
</html>