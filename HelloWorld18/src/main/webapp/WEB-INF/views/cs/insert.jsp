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

<script src="../../resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


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


<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}

.uploadedList li {
	list-style-type: none;
}
</style>

<title>Insert title here</title>
</head>
<body>

<!-- Header -->
	<jsp:include page="../header.jsp"/>

<br>
<br><br>
<br><br>
	<!-- <div class="floating">
		<div class="row">

			<a class="btn btn-info" id="a" type="submit">등록하기</a>

		</div>
		<br>
		<div class="row">

			<a class="btn btn-info" href="https://open.kakao.com/o/s5ZqXQib">카카오톡</a>

		</div>
		

	</div> -->


	<div class="container" style="width: 800px;">
		<div class="row">
			<form action="/cs/insert" method="post">
				<div class="form-group">
					<label for="qtitle">제목</label> <input required class="form-control"
						id="qtitle" name="qtitle"  style="width: 200%;">

				</div>


				<div class="form-group">
					<label for="quser">질문자 이름</label> <input required
						class="form-control" id="quser" name="quser" style="width: 200%;">
				</div>


				<div class="form-group">
					<label for="qpassword">비밀번호</label> <input required
						class="form-control" id="qpassword" name="qpassword"  style="width: 200%;">
				</div>


				<div class="form-group">
					<label for="qtype">질문 유형</label> <select class="form-control"
						name="qtype"  style="width: 200%;">
						<option value="사이즈추천/상품문의">사이즈추천/상품문의</option>
						<option value="주문/결제/입금확인">주문/결제/입금확인</option>
						<option value="배송관련문의">배송관련문의</option>
						<option value="교환/반품문의">교환/반품문의</option>
						<option value="배송전 변경/취소/직거래">배송전 변경/취소/직거래</option>
						<option value="적립금/쿠폰/회원관련">적립금/쿠폰/회원관련</option>
						<option value="배송문의/해외배송신청 및 문의">배송문의/해외배송신청 및 문의</option>
						<option value="마이페이지">마이페이지</option>
						<option value="쇼핑 가이드">쇼핑 가이드</option>
						<option value="기타">기타</option>
					</select>
				</div>

				<div class="form-group">
					<label for="form-group">질문내용</label>
					<textarea required class="form-control" id="qcontent"
						name="qcontent"  style="width: 200%;"></textarea>

				</div>



				<div class="form-group">
					<label for="email">이메일주소</label> <input required
						class="form-control" id="email" name="email"  style="width: 200%;">
				</div>

				<div class="form-group">
					<label for="qphone">핸드폰번호 </label> <input required
						class="form-control" id="qphone" name="qphone"  style="width: 200%;">
				</div>

				<div class="form-group">
					<!-- <label for="open">질문 비공개 </label>  -->
					<input name="qstatus" value="1" type=hidden>
				</div>

				<div class="form-group">
					<input name="qfile" type=hidden>
				</div>




				<div class="form-group">
					<button class="btn btn-info" id="a" type="submit">등록하기</button>
				</div>



			</form>


		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {

			/* $("button[type='submit']").click(function() {
				$("form").submit();
			}) */
		});
	</script>


	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3">
			<span>
				<img src="{{imgsrc}}">
				<!-- 핸들바스 마크업 작업 -->
			</span>
			<div>
				<a target="{{target}}" href="{{getLink}}">{{fileName}}</a>
				<a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></a>
			</div>
			<input type="hidden" name="qfile" value="{{fullName}}">
		</li>
	</script>
	
		<!-- Footer -->
	<jsp:include page="../footer.jsp"/>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<script type="text/javascript">
		var source = $("#source").html();
		var template = Handlebars.compile(source);
		$(document).ready(
				function() {
					$(".uploadedList").on("click", ".delbtn", function(event) {
						event.preventDefault();
						var $delBtn = $(this);
						var $delLi = $(this).parent("div").parent("li");
						/* 제이쿼리에서 변수에 $ 있으면 엘리먼트를 뜻함 */
						$.ajax({
							url : "/deletefile",
							type : "post",
							/* 일반컨트롤러 어노테이션을 받았기 때문에 type에 post와 get밖에 넘겨받을 수 없다. */
							data : {
								fileName : $delBtn.attr("href")
							},
							dataType : "text",
							success : function(result) {
								$delLi.remove();
							}
						})
						/*더 공부하기 [JavaScript] 이벤트 핸들러 종류 */
					});
					$(".fileDrop").on("dragenter dragover", function(event) {
						event.preventDefault();
					});
					$(".fileDrop").on("drop", function(event) {
						event.preventDefault();
						var files = event.originalEvent.dataTransfer.files;
						var file = files[0];
						var formData = new FormData();
						formData.append("file", file);
						$.ajax({
							url : "/uploadAjax",
							type : "post",
							data : formData,
							dataType : "text",
							processData : false,
							contentType : false,
							success : function(data) {
								alert(data);
								/* alert(data.target); */
								/* upload.js에서 선언한 함수 호출하여 사용  */
								var result = getFileInfo(data);

								$(".uploadedList").append(template(result));
							}
						});
					});
					$("button[type='submit']").click(
							function(event) {
								/* event.preventDefault(); */
								var $form = $("form");
								var str = "";
								$(".delbtn").each(
										function(index) {
											str += "<input name='files["
													+ index + "]' value='"
													+ $(this).attr("href")
													+ "' type='hidden'/>";
										});
								$form.append(str);
								$form.get(0).submit();
							})

				});
	</script>





	<!-- 
선택자 사용방법
1. 아이디 선택 #
2. 클래스 선택 .
3. [] 속성값 type이 "~"인 것을 지칭(반드시 type이라는 속성이 명기되어 있어야 한다.)
input 태그는 type값 입력하지 않으면 디폴트값 text로 지정되지만, 
선택자를 이용할 때에는 type="text"로 호출해도 해당 input태그 안에 type값이 text라고 명기되어있지 않으면 선택하지 못함.
$("button[type='submit'])
버튼 테그들 중에서 type이 'submit'인 것을 선택한다는 의미
 -->
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