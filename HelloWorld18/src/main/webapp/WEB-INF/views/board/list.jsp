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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="../../resources/js/test.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
20190327 커밋 테스트222
	<div class="container">
		<div class="row">
			<a class="btn btn-info" href="/board/write">글쓰기</a>
		</div>
		<div class="row">
			<div class="col-sm-4">.col-sm-4</div>
  			<div class="col-sm-4">.col-sm-4</div>
  			<div class="col-sm-4">.col-sm-4</div>
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
						<div class="col-sm-4">
						<a href="http://www.naver.com">
						${vo.writer}<br>
						<img src="https://media1.tenor.com/images/2b2f12d9b414ccd49999c940a293f448/tenor.gif?itemid=9871568"><br>
						
						</a>
						</div>							
					</c:forEach>
				</tbody>
				
				<%-- <tbody>
					<c:forEach items="${list}" var="vo">
						
							<td>${vo.bno }</td>
							<td><a
								href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${vo.bno}">${vo.title }</a></td>
							<td>${vo.writer }</td>
							<td>${vo.regDate }</td>
							<td>${vo.viewCnt }</td>
						
					</c:forEach>
				</tbody> --%>
			</table>
		</div>
		<div class="row text-center">
			<ul class="pagination pagination-lg">

				<c:if test="${pm.beginPageNum != 1}">
					<li><a href="/board/list?page=${pm.beginPageNum-1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pm.beginPageNum}" end="${pm.stopPageNum }"
					var="idx">
					<li class="${idx == pm.cri.page ? 'active' : ''}"><a
						href="/board/list${pm.makeQuery(idx)}"> ${idx}</a></li>
				</c:forEach>

				<c:if test="${pm.stopPageNum != pm.totalPage }">
					<li><a href="/board/list?page=${pm.stopPageNum+1}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
		<form action="/board/search" method="get" target="blank"
			id="searchForm">
			<div class="row">
				<div class="col-xs-3 col-sm-2">
					<select class="form-control" id="ssel" name="searchType">
						<option disabled="disabled">검색 기준</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="input-group col-xs-9 col-sm-10">
					<input class="form-control" id="keyword" name="keyword"><span
						class="input-group-btn">
						<button class="btn btn-success">검색</button>
					</span>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn-success").click(function() {
				$("#searchForm").submit();
			});
			
			$("#btnLogout").click(function (event) {
				event.preventDefaultEvent();
				
			})
		});
	</script>
	<%-- class container --%>
</body>
</html>