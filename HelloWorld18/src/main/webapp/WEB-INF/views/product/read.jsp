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
<style type="text/css">
.container {
	border: 1px dashed #bcbcbc;
	text-align: right;
	width: 700px;
	height: auto;
}

.box {
	border: 1px dashed #bcbcbc;
	height: auto;
	text-align: center;
	margin: auto;
	width: 800px;
}

.leftbox {
	width: 300px;
	border: 1px dashed red;
	text-align: center;
	display: inline-block;
}

.rightbox {
	width: 300px;
	border: 1px dashed red;
	text-align: center;
	display: inline-block;
}

#img {
	border: 1px dashed blue;
	height: 300px;
	width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
	<div class="box">
		<div class="leftbox">

			<!-- 		이미지 -->
			<div id="img">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">

						<%-- 이미지갯수에 맞춰서 li나오게 --%>
						<c:forEach items="${pd.images}" varStatus="status">

							<%-- 반드시 첫번째 carousel은 class="active가 들어가야함" --%>
							<c:if test="${status.index == 0}">
								<li data-target="#carousel-example-generic"
									data-slide-to="${status.index}" class="active"></li>
							</c:if>
							<c:if test="${status.index != 0}">
								<li data-target="#carousel-example-generic"
									data-slide-to="${status.index}"></li>
							</c:if>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">

						<%-- 위와 같이 이미지갯수에 맞춤 --%>
						<c:forEach items="${pd.images}" varStatus="status">

							<%-- 위와 같이 class="active" --%>
							<c:if test="${status.index == 0}">
								<div class="item active">
									<img src="/displayFile?fileName=${pd.images[status.index]}"
										alt="...">
								</div>
							</c:if>
							<c:if test="${status.index != 0}">
								<div class="item">
									<img src="/displayFile?fileName=${pd.images[status.index]}"
										alt="...">
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- 			이미지 -->
		</div>
		<!-- leftbox -->

		<div class="rightbox">
			<div>${pd.kr_name }</div>
			<div>${pd.eng_name }</div>
			<br>
			<div>${pd.prdct_dscrp }</div>
			<br>

			<!-- Button trigger modal 모달 모달모달-->
			<a data-toggle="modal" data-target="#exampleModalCenter">전성분</a><br>
			<!-- Button trigger modal 모달 모달모달-->

			장바구니에 용량이랑 가격도 넣어야함
			<!-- 			값 넣어주는 곳인데 나중에 고쳐야함 -->
			<form>
				<div>
					<select name="vp">
						<c:forEach items="${pdd}" var="var">
							<option>₩${var.price } ${var.volume}ml</option>
						</c:forEach>
					</select>
				</div>
				수량 : <input type="number" value="1" name="amount" min="1" required
					autofocus> <input value="NamepeN" name="id" type="hidden">
				<input value="${pd.pno }" name="pno" type="hidden"> <a
					id="cart" class="btn btn-success">장바구니에 담기</a>
			</form>
			<!-- 			값 넣어주는 곳인데 나중에 고쳐야함 -->
			<hr>

			<!-- 			공유하기 modal -->
			<a type="button" data-toggle="modal"
				data-target=".bs-example-modal-sm">공유하기</a> <br>
			<!-- 			공유하기 modal -->

			<!-- 			리뷰 작성하기 -->
			<a href="#">리뷰 작성하기</a>
			<!-- 			리뷰 작성하기 -->

		</div>
	</div>





	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">전성분</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">${pd.INGRD}</div>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<!-- 	공유하기 Modal -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<h3 style="text-align: center;">
					<a
						href="http://www.facebook.com/sharer/sharer.php?u=http://211.183.8.71:8089/shoppingCart/read">facebook</a>
					<a
						href="https://twitter.com/intent/tweet?text=TEXT&url=${pageContext.request.requestURL }">twitter</a>
				</h3>
			</div>
		</div>
	</div>
	<!-- 	공유하기 Modal -->

	<jsp:include page="../footerBar.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {

			//장바구니에 담기	
			$("#cart").click(function() {
				$("form").attr("action", "/shoppingCart/insertShoppingCart");
				$("form").attr("method", "GET");
				$("form").submit();
				alert("장바구니에 담겼습니다");
			});

		});
	</script>
</body>
</html>