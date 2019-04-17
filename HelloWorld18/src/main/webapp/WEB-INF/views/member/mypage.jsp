<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Contact</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<style type="text/css">
#in {
	width: 50%;
	border: 1px solid black;
	margin: auto;
}
 
.roundBox {
	border: 0.2px solid white; 
	width: 50%;
	margin: auto;
}
</style>
</head>
<body class="animsition">
	<!-- Header -->
	<jsp:include page="../header.jsp" />
	<!-- Cart -->

	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div id="out" class="flex-w flex-tr ">
				<div id="in"
					class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">

					<form action="member/mypage" method="post">

						<h4 class="mtext-105 cl2 txt-center p-b-30">Welcome
							${mDto.id} :D</h4>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> ID </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.id}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> name </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.name}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> birth </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.birth}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> e-mail </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.email}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> address </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.postNum}
								${mDto.address} ${mDto.DTL_ADRES}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> phone </span>
							<p class="stext-115 cl6 size-213 p-t-18">${mDto.phone}</p>
						</div>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2"> point </span>
							<p class="stext-115 cl6 size-213 p-t-18">
								${mDto.point}
								<button type="button" onclick="toggleChargeHistory()"
									class="btn btn-xs">충전내역</button>
							</p>
						</div>
					</form>
				</div>
			</div>

			<a
				class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer roundBox"
				href="/member/updateui?id=${mDto.id}"> 회원정보 수정 </a> <a
				class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer roundBox"
				href="/member/pointCharge"> 포인트 충전 </a>
			<c:if test="${manager == 1}">
				<a href="/member/manage">관리자 페이지</a>
			</c:if>
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />

	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>

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
	<!--===============================================================================================-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="/resources/js/map-custom.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/js/main.js"></script>

</body>
</html>