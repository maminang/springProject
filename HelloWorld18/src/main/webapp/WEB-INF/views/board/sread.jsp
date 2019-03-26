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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="form-group">
				<label for="title">제목</label> <input class="form-control"
					readonly="readonly" value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input class="form-control"
					readonly="readonly" value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="content">내용</label> <input class="form-control"
					readonly="readonly" value="${vo.content }">
			</div>
		</div>

		<div class="row">
			<div class="form-group">
				<button id="list" class="btn btn-info">목록</button>
				<button id="update" class="btn btn-warning">수정</button>
				<button id="danger" class="btn btn-danger">삭제</button>
			</div>
		</div>

	</div>

	<%-- 버튼 --%>
	<form>
		<input type="hidden" value="${vo.bno}" name="bno"> <input
			type="hidden" value="${cri.page}" name="page"> <input
			type="hidden" value="${cri.perPage}" name="perPage"> <input
			type="hidden" value="${cri.searchType}" name="searchType"> <input
			type="hidden" value="${cri.keyword}" name="keyword">
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn-info").click(function() {
				$("form").attr("action", "search");
				$("form").submit();
			});
			$(".btn-warning").click(function() {
				$("form").attr("action", "supdate");
				$("form").submit();
			});
			$(".btn-danger").click(function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					$("form").attr("action", "sdelete");
					$("form").submit();
				}
			});
		});
	</script>
</body>
</html>