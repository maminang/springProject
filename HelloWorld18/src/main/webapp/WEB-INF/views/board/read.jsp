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
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="../resources/img/math_img_1.jpg" alt="...">
							<div class="carousel-caption">...</div>
						</div>
						<div class="item">
							<img src="../resources/img/math_img_2.jpg" alt="...">
							<div class="carousel-caption">...</div>
						</div>
						<div class="item">
							<img src="../resources/img/math_img_3.jpg" alt="...">
							<div class="carousel-caption">...</div>
						</div>
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
			<!-- 			이미지 밑에 상품 설명 -->
			<div>I'm a product description. I'm a great place to add more
				details about your product such as sizing, material, care
				instructions and cleaning instructions.</div>
			<!-- 			이미지 밑에 상품 설명 -->
		</div>
		<!-- leftbox -->

		<div class="rightbox">
			<div>잉글리쉬 페어 앤 프리지아 코롱</div>
			<div>English Pear & Freesia Cologne</div>
			<br>
			<div>은은하면서 신선하고 감미로운 향. 부드럽고 감미로운 향을 부여하는 잉글리쉬 페어 앤 프리지아는 가을의
				정수라 할 수 있습니다. 화이트 프리지아 부케향에 이제 막 익은 배의 신선함을 입히고, 호박, 파출리, 우디향으로 은은함을
				더했습니다. 감미롭고 특별한 향이 느껴집니다.</div>
			<br>

			<!-- Button trigger modal 모달 모달모달-->
			<a data-toggle="modal" data-target="#exampleModalCenter">전성분</a><br>
			<!-- Button trigger modal 모달 모달모달-->

			<div>
				<select>
					<option>$100 30ml</option>
					<option>$200 100ml</option>
				</select>
			</div>
			<!-- 			값 넣어주는 곳인데 나중에 고쳐야함 -->
			<form>
				수량 : <input type="number" value="1" name="amount" autofocus>
				<input value="NamepeN" name="id" type="hidden"> <input
					value="1" name="pno" type="hidden">
				<button id="cart" class="btn btn-success">장바구니에 담기</button>
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
	${pageContext.request.requestURL }
	<!-- 	공유하기 Modal -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<h3 style="text-align: center;">
					<a
						href="http://www.facebook.com/sharer/sharer.php?u=${pageContext.request.requestURL }">facebook</a>
					<a
						href="https://twitter.com/intent/tweet?text=TEXT&url=${pageContext.request.requestURL }">twitter</a>
				</h3>
			</div>
		</div>
	</div>



	<%-- 	<jsp:include page="footerBar.jsp" /> --%>

	<script type="text/javascript">
		$(document).ready(function() {

			//장바구니에 담기	
			$("#cart").click(function() {
				$("form").attr("action", "/product/insertShoppingCart");
				$("form").attr("method", "GET");
				$("form").submit();
			});

			$(document).ready(function() {
				$('[data-toggle="popover"]').popover({
					container : "body"
				});
			});

		});
	</script>
</body>
</html>