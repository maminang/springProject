<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../../../resources/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="../../../resources/css/main.css">
<!--===============================================================================================-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



<style>
.floating {
	position: fixed;
	right: 70%;
	bottom: 450px;
	margin-right: -720px;
	text-align: center;
	width: 120px;
}
</style>





<title>Insert title here</title>

</head>

<body>

<!-- Header -->
	<jsp:include page="../header.jsp"/>

<br><br><br><br><br>
	



	<div class="floating">
		<div class="row">

			<a class="btn btn-info" href="/cs/insertui">질문하기</a>

		</div>
		<br>
		<div class="row">

			<a class="btn btn-info" href="https://open.kakao.com/o/s5ZqXQib">카카오톡</a>

		</div>
		

	</div>







	<div class="container">

		

		<!-- <table>
			<tr>
				<td height="0">
					<div Style="height: 100%">
						<img src="/resources/img/faqtitle.jpg">
					</div>
				<td height="0">
					<div Style="height: 100%">
						<img src="/resources/img/qnatitle.jpg">
					</div>
			</tr>
		</table>
 -->



<br>
<br>
		<div class="row" style="text-align: center; ">

			<img src="/resources/img/csCenter.jpg"> <br>



		</div>

	</div>

	<div class="container">

		<div class="row">

			<table class="table table-hover">
				<colgroup>

					<col width="20%" />

					<col width="20%" />

					<col width="60%" />

				</colgroup>
				<thead>

					<tr>

						<th>번호</th>

						<th>분류</th>

						<th>제목</th>

					</tr>

				</thead>

				<tbody>



					<!-- ${cslist } 컨트롤러 model에 바인딩할 때 "" 안에 있는 값과 대소문자까지 일치해야 불러올 수 있다. -->

					<c:forEach var="cs" items="${list }">

						<tr>



							<td>${cs.bno }</td>

							<%-- <td><a href="/cs/csCenter${pm.makeQuery(pm.cri.page)}&bno=${vo.bno }">${vo.title}</a></td> --%>

							<td id="${cs.bno}">${cs.qtype}</td>

							<td><a
								href="/cs/csRead${pm.makeQuery(pm.cri.page) }&bno=${cs.bno}">${cs.qtitle}</a></td>



							<!-- DTO에 선언된 변수명과 일치해야한다. -->





						</tr>

						<tr style="display: none;">

							<td colspan="3" id="h${cs.bno}">
								<!--자바스크립트 이용하여 내용 숨기기 mainia.tistory.com/2710--> ${cs.qcontent}

							</td>

						</tr>




					</c:forEach>

				</tbody>

			</table>

		</div>

	</div>

	<!-- class row -->







	<div style="text-align: center; ">


		<ul  >



			<c:if test="${pm.beginPageNum != 1}">

				<li style="display:inline;"><a href="/cs/csCenter?page=${pm.beginPageNum-1}">&laquo;</a></li>

			</c:if>



			<c:forEach begin="${pm.beginPageNum}" end="${pm.stopPageNum }"
				var="idx">

				<li style="display:inline;"class="${idx == pm.cri.page ? 'active' : ''}"><a
					href="/cs/csCenter${pm.makeQuery(idx)}"> ${idx}</a></li>

			</c:forEach>



			<c:if test="${pm.stopPageNum != pm.totalPage }">

				<li style="display:inline;"><a href="/cs/csCenter?page=${pm.stopPageNum+1}">&raquo;</a></li>

			</c:if>



		</ul>

	</div>
	
	<!-- Footer -->
	<jsp:include page="../footer.jsp"/>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	


	<script type="text/javascript">
		$(document).ready(
				function() {

					var f_target = $(this).parent("tr").next("tr").css(
							"display", "inline");

					/* $(#).click(function(event){
						$('#h51').parent("tr").next("tr").css("display","onblock");
						/* if($('.name_by_id2').css("display", "none")){
							$('name_by_id2').css("display", "inline-block");
						}else{
							$('name_by_id2').css("display", "none");
						} */
				});
		$(this)
		$('#c${cs.bno}').click(function(event) {
			alert("test");

			/* if($('.name_by_id2').css("display", "none")){
				$('name_by_id2').css("display", "inline-block");
			}else{
				$('name_by_id2').css("display", "none");
			} */
		});
	</script>
	
	
	<!--===============================================================================================-->	
	<script src="../../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/bootstrap/js/popper.js"></script>
	<script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="../../resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/slick/slick.min.js"></script>
	<script src="../../resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="../../resources/js/main.js"></script>
	<script id="menuSource" type="text/x-handlebars-template">
		{{#each.}}
			<li class="p-b-10">
				<a href="{{href}}" class="stext-107 cl7 hov-cl1 trans-04">
					{{category}}
				</a>
			</li>
		{{/each}}
	</script>
	<script type="text/javascript">
		getMenu();
		function getMenu() {
			$.getJSON("/menu", function(data) {
				var source = $("#menuSource").html();
				var template = Handlebars.compile(source)

				$("#categories").html(template(data));
			})
		}
	</script>
	
</body>
</html>	