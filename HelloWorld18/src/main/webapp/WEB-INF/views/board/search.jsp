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
			<h1>검색결과</h1>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.bno }</td>
							<td><a
								href="/board/sread${pm.makeSearchQuery(pm.cri.page)}&bno=${vo.bno}">${vo.title }</a></td>
							<td>${vo.writer }</td>
							<td>${vo.regDate }</td>
							<td>${vo.viewCnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row text-center">
			<ul class="pagination pagination-lg">

				<c:if test="${pm.beginPageNum != 1}">
					<li><a
						href="/board/search${pm.makeSearchQuery(pm.beginPageNum-1)}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pm.beginPageNum}" end="${pm.stopPageNum }"
					var="idx">
					<li class="${idx == pm.cri.page ? 'active' : ''}"><a
						href="/board/search${pm.makeSearchQuery(idx)}"> ${idx}</a></li>
				</c:forEach>

				<c:if test="${pm.stopPageNum != pm.totalPage }">
					<li><a href="/board/search${pm.makeSearchQuery(pm.stopPageNum+1)}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
	<%-- class container --%>
</body>
</html>