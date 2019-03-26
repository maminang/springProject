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
			<form action="/board/supdate" method="post">
				<div class="form-group">
					<label>제목</label> <input class="form-control" id="title"
						name="title" required="required" value="${vo.title }">
				</div>

				<div class="form-group">
					<label for="writer">작성자</label> <input class="form-control"
						id="writer" name="writer" value="${vo.writer}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="3" id="content" name="content"
						required="required">${vo.content}</textarea>
				</div>
				<input type="hidden" name="bno" value="${vo.bno}"> <input
					type="hidden" value="${cri.page}" name="page"> <input
					type="hidden" value="${cri.perPage}" name="perPage"> <input
					type="hidden" value="${cri.searchType}" name="searchType">
				<input type="hidden" value="${cri.keyword}" name="keyword">
			</form>
			<div class="form-group">
				<button class="btn btn-info" type="submit">등록</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn-info").click(function() {
				$("form").submit();
			});
		});
	</script>
</body>
</html>