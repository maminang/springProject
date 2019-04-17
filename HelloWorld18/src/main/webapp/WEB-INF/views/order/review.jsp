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
.col-container {
	display: table; /* Make the container element behave like a table */
	width: 100%; /* Set full-width to expand the whole page */
}

.col {
	display: table-cell;
	/* Make elements inside the container behave like table cells */
}

.img-thumbnail {
	height: 120px;
	width: auto;
}
</style>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
	<div class="container">
		<div class="col-12">
			<h1 style="text-align: center;">주문검토</h1>
			<hr>
		</div>
	</div>
	<div class="col-container">
		<div class="col-sm-1"></div>
		<div class="col-sm-8">
			<table class="table">
				<thead>
					<tr>
						<th>제품</th>
						<th></th>
						<th>가격</th>
						<th>수량</th>
						<th>총합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.detailList}" var="detail"
						varStatus="status">
						<tr>
							<td><img alt="하아니 이게 왜 안되지?"
								src="/displayFile?fileName=${detail.pdto.images[0]}"
								class="img-thumbnail"></td>
							<td>${detail.pdto.eng_name}<br> ${detail.pdto.kr_name}
							</td>
							<td>${detail.price}</td>
							<td>${detail.amount}</td>
							<td>₩${detail.price * detail.amount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>총합계</td>
						<td>₩${order.total_price}</td>
					</tr>
					<tr>
						<td>	
							<div class="form-group" id="divAddress">                                                                                          
								<label for="divAddress" class="col-lg-2 control-label">주소</label>                                                             
								<input value="${order.postNum}" name="postNum" type="text" id="postNum" placeholder="우편번호" class="form-control" readonly="readonly">
								<input value="${order.address}" name="address" type="text" id="address" placeholder="주소" class="form-control" readonly="readonly">            
								<input value="${order.dtl_adres}" name="DTL_ADRES" type="text" id="DTL_ADRES" placeholder="상세주소" class="form-control" readonly="readonly">    
							</div>                                                                                                                            
							<label for="shipping_memo">배송 메모</label>                                                                                          
							<textarea rows="5" class="form-control" id="shipping_memo" name="shipping_memo">${order.shipping_memo}</textarea>                                       
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="/order/payment" class="btn btn-info">결제하기</a>
						<td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="col-sm-2">
			<div class="row">
				<div class="Jumbotron">
					<h3 class="text-center">주문요약</h3>
					<br> 총 합계 : ₩${order.total_price}
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>

</body>
</html>