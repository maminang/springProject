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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />

	<div class="container">

		<form action="member/mypage" method="post">
			<div class="row" align="center">
				<h3>${mDto.id}님환영합니다</h3>
				<a href="/member/updateui?id=${mDto.id}"> 회원정보 수정</a> <a
					href="/member/pointCharge">포인트 충전</a>
				<c:if test="${manager == 1}">
					<a href="/member/manage">관리자 페이지</a>
				</c:if>
				<h1>p. ##</h1>
				<br> <br>
			</div>

			<div class="form-group">
				<label for="id" class="col-lg-2 ">ID</label> ${mDto.id}
			</div>

			<div class="form-group">
				<label for="name" class="col-lg-2 ">name</label> ${mDto.name}
			</div>

			<div class="form-group">
				<label for="birth" class="col-lg-2 ">birth</label> ${mDto.birth}
			</div>

			<div class="form-group">
				<label for="e-mail" class="col-lg-2 ">e-mail</label> ${mDto.email}
			</div>

			<div class="form-group">
				<label for="address" class="col-lg-2 ">address</label>

				${mDto.postNum} ${mDto.address} ${mDto.DTL_ADRES}
			</div>

			<div class="form-group">
				<label for="phone" class="col-lg-2 ">phone</label> ${mDto.phone}
			</div>

			<div class="form-group">
				<label for="point" class="col-lg-2 ">point</label> ${mDto.point}
				<button type="button" onclick="toggleChargeHistory()"
					class="btn btn-xs">충전내역</button>
			</div>







			<!-- ::::::::::::::::::::::::::::::::::::::::::::::::주문List:::::::::::::::::::::::::::::::::::: -->
			<c:forEach items="#" var="#">
				<tr>
					<%-- 				<td>${pno}</td> --%>
					<%-- 				<td>${eng_name}</td> --%>
					<%-- 				<td>${kr_name}</td> --%>
					<%-- 				<td>${prdct_dscrp}</td> --%>
					<%-- 				<td>${volume}</td> --%>
					<%-- 				<td>${price}</td> --%>
				</tr>
			</c:forEach>
			<!-- 		<img alt="#" src="img"> -->
			<a href="/order/list">주문List</a> | <a href="#">배송조회</a><br>
			주문List주문List주문List주문List주문List주문List주문List주문List주문List주문List

			<!-- ::::::::::::::::::::::::::::::::::::::::::::::::내가 한 Q&A:::::::::::::::::::::::::::::::::::: -->


		</form>
	</div>


	<!-- point charge history modal -->
	<div id="chargeHistoryModal" class="modal fade" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">충전내역</h4>
				</div>
				<div class="modal-body" id="chargeHistoryList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>충전일</th>
								<th>포인트</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{{chargedate}}</td>
								<td>{{point}}</td>
							<tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script id="chargeHistorySource" type="text/x-handlebars-template">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>충전일</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				{{#each.}}
				<tr>
					<td>{{chargedate}}</td>
					<td>{{point}}</td>
				<tr>
				{{/each}}
			</tbody>
		</table>
</script>

	<script type="text/javascript">
		$(document).ready(function() {
		});

		function toggleChargeHistory() {
			$('#chargeHistoryModal').modal('toggle')
			var id = "${mDto.id}";
			$.getJSON("/member/getChargeHistory/" + id, function(data) {
				var source = $("#chargeHistorySource").html();
				var template = Handlebars.compile(source)

				$("#chargeHistoryList").html(template(data));
			})
		}
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>