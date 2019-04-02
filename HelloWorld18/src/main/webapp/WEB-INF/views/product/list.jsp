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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="../../resources/js/test.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
	<div class="container">
		<div class="row">
			<a class="btn btn-info" href="/board/write">글쓰기</a>
		</div>
		<div class="row">
			<table class="table table-hover">
				<c:forEach items="${list}" var="vo">
					<div class="col-sm-4" style="border: 1px solid black">
						<a href="http://www.naver.com"> ${vo.eng_name} <br> <img
							src='/displayFile?fileName=${vo.images[0]}' alt="이미지 안나옴"
							style="width: 350px"> <br> 제품명 : ${vo.kr_name}
						</a>
					</div>
				</c:forEach>
			</table>
		</div>
		
	</div>
	<jsp:include page="../footerBar.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</body>
</html>