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
<style type="text/css">
.container {
	border: 1px dashed #bcbcbc;
	text-align: right;
	width: 700px;
	height: auto;
}

#img {
	border: 1px dashed #bcbcbc;
	text-align: left;
	height: 300px;
}

#info {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<div id="img">이미지 이미지 이미지 이미지 이미지 이미지 이미지 이미지 이미지 이미지 이미지 이미지
					이미지</div>
				<div id="info">I'm a product description. I'm a great place to
					add more details about your product such as sizing, material, care
					instructions and cleaning instructions.</div>
			</div>
			<div class="col-md-5">
				<div>상품명</div>
				<div>상품번호</div>
				<div>가격</div>
				<div>사이즈</div>
				<form action="#">
					<select>
						<option>S</option>
						<option>M</option>
						<option>L</option>
						<option>XL</option>
					</select>
					<div>수량</div>
					<input type="number" value="1" autofocus>
					<button id="cart" class="btn btn-success">장바구니에 담기</button>
				</form>
				<hr>
				<div>
					<button class="btn" data-toggle="collapse" data-target="#demo">상품정보</button>
					<div id="demo" class="collapse">내용</div>
				</div>
				<hr>
				<div>
					<button class="btn" data-toggle="collapse" data-target="#demo1">정보2</button>
					<div id="demo1" class="collapse">내용</div>
				</div>
				<hr>
				<div>
					<button class="btn" data-toggle="collapse" data-target="#demo2">정보3</button>
					<div id="demo2" class="collapse">내용</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//장바구니에 담기
			$("#cart").click(function() {
				$("form").attr("action", "#");
				$("form").submit();
			});

		});
	</script>

</body>
</html>