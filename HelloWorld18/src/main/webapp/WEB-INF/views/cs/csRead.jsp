<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="../../resources/js/upload.js"></script>


<style type="text/css">
.uploadedList {
	list-style: none;
	margin-bottom: 50px;
}
</style>


<title>Insert title here</title>
</head>
<body>
<!-- Header -->
	<jsp:include page="../header.jsp"/>

<br><br><br><br><br>


	<div class="container" style="width: 800px;>
		<div class="row">

			<div class="form-group">
				<label for="qtitle">제목</label> <input class="form-control" readonly
					name="qtitle" id="qtitle" value=${vo.qtitle} style="width: 100%;">
			</div>

			<div class="form-group">
				<label for="quser">질문자</label> <input class="form-control" readonly
					name="quser" id="quser" value=${vo.quser} style="width: 100%;">
			</div>

			<div class="form-group">
				<label for="qtype">질문유형</label>
				<textarea class="form-control" readonly name="qtype" id="qtype" style="width: 100%;">${vo.qtype}</textarea>
			</div>

			<div class="form-group">
				<label for="qcontent">질문내용</label>
				<textarea class="form-control" readonly name="qcontent"
					id="qcontent" style="width: 100%;">${vo.qcontent}</textarea>
			</div>

			<%-- <div class="form-group">
			<label>첨부파일</label>
			<img src="${vo.qfile}" alt="첨부파일" width="auto">${vo.qfile}
			<ul class="uploadedList clearfix">
				
				
			</ul>
			
		</div> --%>

			<div class="form-group">
				<label for="qanswer">답변내용</label>
				<textarea class="form-control" readonly name="qanswer" id="qanswer" style="width:100%;">${vo.qanswer}</textarea>
			</div>




			<div class="form-group">
				<button id="update" class="btn btn-warning"	onclick="location.href = 'updateauthority?bno=${vo.bno}' ">수정</button>
				<button id="delete" class="btn btn-danger" onclick="location.href = 'deleteui?bno=${vo.bno}' ">삭제</button>
				<button id="list" class="btn btn-info">목록</button>
				<button id="reply" class="btn btn-primary"
					onclick="location.href = 'answerui?bno=${vo.bno}' ">답변</button>
			</div>

		</div>



		<div class="row">
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<label for="replyer">작성자</label> <input class="form-control"
						id="replyer">
				</div>


				<div class="form-group">
					<label for="replyText">내용</label> <input class="form-control"
						id="replyText">
				</div>

				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-success">등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>
				</div>


			</div>
		</div>


		<div class="row" id="replies"></div>

		<div class="row">
			<ul class="pagination"></ul>
		</div>



	</div>

	<div class="row">
		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-header">
					<button data-dismiss="modal" class="close">&times;</button>
					<p id="modal_rno"></p>
				</div>
				<div class="modal-body">
					<input id="modal_replyText" class="form-control">
				</div>
				<div class="modal-footer">
					<button id="modal_update" data-dismiss="modal" class="btn btn-xs">수정</button>
					<button id="modal_delete" data-dismiss="modal" class="btn btn-xs">삭제</button>
					<button id="modal_close" data-dismiss="modal" class="btn btn-xs">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<div class="row">
		<div id="myCollapsible" class="collapse">
			<div class="form-group">
				<label for="replyer">작성자</label> <input class="form-control"
					id="replyer">
			</div>
		</div>
	</div>

	<!-- 클래스 컨테이너 div 엔드태그 -->

	<form>
		<input value="${vo.bno}" name="bno" type="hidden"> <input
			value="${cri.page}" name="page" type="hidden"> <input
			value="${cri.perPage}" name="perpage" type="hidden">
	</form>
	<!--    여러개일경우를 대비해서 이렇게 -->



	<!-- Footer -->
	<jsp:include page="../footer.jsp"/>


	<script id="sourceAttach" type="text/x-handlebars-template">
	<li class="col-xs-3 pull-left">
		<span>
			<img src="{{imgsrc}}">
		</span>
		<div>
			<a href="{{getLink}}">{{fileName}}</a>
		</div>
	</li>
</script>
	<!-- 새창에 열리게 하려면 이 코드를 위에 삽입<a target="{{target}}" href="{{getLink}}">{{fileName}}</a> -->




	<script id="source" type="text/x-handlebars-template">
{{#each.}}
   <div class="panel panel-info">
         
         <div class="panel-heading">
         <span> rno : {{rno}}, 작성자: {{replyer}}</span>
         <span class="pull-right">{{updateDate}}</span>
         </div>
         
         <div class="panel-body">
         <p>{{replyText}}</p>
         <button data-replyText="{{replyText}}" data-rno="{{rno}}"class="callModal btn btn-sm btn-success">수정/삭제</button>
         </div>
      </div>

{{/each}}
</script>


	<script type="text/javascript">
		$(document).ready(function() {

			$("#inputCheckBtn").click(function() {
				var inputID = $("#inputID").val();
				$.getJSON("/replies/checkid/" + inputID, function(data) {
					if (data) {
						$("#msgforuse").text("사용가능");
					} else {
						$("#msgforuse").text("사용불가");
					}
				});
			});

			$("#inputCheckBtn2").click(function() {
				var inputID = $("#inputID2").val();
				$.getJSON("/replies/checkid2/" + inputID, function(data) {

					$("#msgforuse2").text(data);
				});

			});

			var bno = ${vo.bno};
			
			
			
			$("#list").click(function() {
				$("form").attr("action", "csCenter");
				$("form").attr("method", "get");
				$("form").submit();
			});
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