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
/* 	border: 1px dashed red; */
	text-align: center;
	display: inline-block;
}

.rightbox {
	width: 300px;
/* 	border: 1px dashed red; */
	text-align: center;
	display: inline-block;
}

/* #img { */
/* 	border: 1px dashed blue; */
/* 	height: 300px; */
/* 	width: 300px; */
/* } */
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
					<h5 class="modal-title" id="exampleModalCenterTitle">Modal
						title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">전성분: 변성알코올, 정제수, 향료, 리모넨, 부틸페닐메칠프로피오날,
					리날룰, 제라니올, 헥실신남알, 벤질벤조에이트, 시트로넬올 [ILN36265] *제공된 성분은 동일 제품이라도 경우에
					따라 변경될 수 있습니다. 최신정보는 제품 포장의 성분을 참고하시거나 본사 고객관리지원팀으로 연락 부탁
					드립니다.사용기한: 대부분 사용기한 1년 이상 남은 제품을 배송해드립니다.사용방법: 손목, 귀 뒤 등 맥박이 뛰는 곳에
					뿌려줍니다. 단독으로 사용하거나 다른 제품과 함께 컴바이닝할 수 있으며 같은 라인의 바디 제품과 사용할 수
					있습니다.기능성 화장품 여부: 해당사항 없음제조국: 영국책임판매업자: 이엘씨에이한국(유)소비자 상담 관련 번호:
					02-3440-2930사용시 주의사항 1. 화장품을 사용하여 다음과 같이 이상이 있을 경우에는 사용을 중지할 것이며,
					계속 사용하면 증상을 악화시키므로 피부과 전문의 등에게 상담할 것 1)사용 중 붉은 반점, 부어오름, 가려움증, 자극
					등의 이상이 있을 경우 2)적용부위가 직사광선에 의해 위와 같은 이상이 있을 경우 2. 상처가 있는 곳 또는 습진 및
					피부염등의 이상이 있는 부위에는 사용을 금할 것 3. 눈에 들어가지 않도록 주의할 것 4. 보관 및 취급상의 주의사항
					1)사용 후에는 반드시 마개를 닫아 둘 것 2)유.소아의 손에 닿지 않는 곳에 보관할 것 3)고온 내지 저온의 장소 및
					직사광선이 닿는 곳에는 보관하지 말 것 *기타 제품 특이적인 주의사항은 제품 포장 참조품질 보증 기준
					이엘씨에이한국(유)를 통해 공식 수입ㆍ판매되는 제품에 한해서, 제품에 이상이 있을 경우 공정거래위원회고시 품목별 소비자
					분쟁 해결 기준에 따라 안내 받으실 수 있습니다.</div>
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