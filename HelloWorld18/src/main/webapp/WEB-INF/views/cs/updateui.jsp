<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<script src="../../resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
	.fileDrop{
	width:80%;
	height:100px;
	border:1px dotted gray;
	background-color:lightslategray;
	margin:auto;
	}
	.uploadedList li{
		list-style-type:none;
	}
</style>


<title>Insert title here</title>
</head>
<body>



<div class="container">
	<div class="row">
		<form action="/cs/update" method="post">
			<div class="form-group" >
				<label for="bno">글번호</label>
				<input id ="bno" class="form-control" readonly name="bno" value="${vo.bno }">	
			</div>
			<div class="form-group" >
				<label for="quser">질문자</label>
				<input id ="quser" class="form-control" name="quser" value="${vo.quser }">
				
			</div>
			<div class="form-group" >
				<label for="qtitle">질문제목</label>
				<input id ="qtitle" class="form-control" name="qtitle" value="${vo.qtitle }">
				
			</div>
			
			<div class="form-group" >
				<label for="qtitle">질문유형</label>
				<input id ="qtype" class="form-control" name="qtype" value="${vo.qtype }" readonly>
				
			</div>
			
			<div class="form-group" >
				<label for="qphone">전화번호</label>
				<input id ="qphone" class="form-control" name="qphone" value="${vo.qphone }" >
				
			</div>
			
			<div class="form-group" >
				<label for="email">이메일</label>
				<input id ="email" class="form-control" name="email" value="${vo.email }" >
				
			</div>
			
			
			
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
			
			<div class="form-group" >
				<label for="qcontent">질문내용</label>
				<input id ="qcontent" class="form-control" name="qcontent" value="${vo.qcontent }">
				
			</div>
			
			
			
			<!-- 수정하기 눌렀을 때 수정한 글이 있더 페이지로 되돌아갈 수 있도록 하기 위해, read.jsp에서 보내는 값 받아오는 부분-->
			<input value="${vo.qfile }" name ="qfile" value="1" type=hidden>
			<input value="${cri.page }" name ="page" type=hidden>
			<input value="${cri.perPage }" name ="perPage" type=hidden>
						
		</form>
		
	
		<!-- <div class="form-group">
			<label>업로드할 파일을 드랍시키세요.</label>
			<div class="fileDrop"></div>
		</div>
		
		<ul class="uploadedList clearfix">
			
		</ul> -->
		
		
		<div class="form-group">
			<button type="submit" class="btn btn-warning">수정</button>
		</div>
	</div>
</div> <!-- class container end tag -->


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
</li>
</script>

<script type="text/javascript">
	
	/* 스크립트 태그 바로 아래 있는 변수는 var가 있는지 없는지 관계 없이 전역변수 */
	var bno="${vo.bno}";
	var source = $("#source").html();
	var template = Handlebars.compile(source);
	
	$(document).ready(function(){
		
		/*  */
		
		
		
		$(".uploadedList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var $delBtn=$(this);
			var $delLi=$(this).parent("div").parent("li");
			/* 제이쿼리에서 변수에 $ 있으면 엘리먼트를 뜻함 */
			
			var delok = confirm("수정 버튼과 상관 없이 파일이 삭제됩니다.\n정말 삭제하시겠습니까?");
			
			if(delok){
			$.ajax({
				url:"/cs/deletefile",
				type:"post",
				/* 일반컨트롤러 어노테이션을 받았기 때문에 type에 post와 get밖에 넘겨받을 수 없다. */
				data:{
					fileName:$delBtn.attr("href"),
					bno:bno
				},
				dataType:"text",
				success:function(result){
					$delLi.remove();
				}
			});
			}
			
			/*더 공부하기 [JavaScript] 이벤트 핸들러 종류 */
		});
		
		
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop",function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file=files[0];
			
			var formData=new FormData();
			formData.append("file",file);
			
			$.ajax({
				url:"/uploadAjax",
				type:"post",
				data:formData,
				dataType: "text",
				processData: false,
				contentType: false,
				success:function(data){
					alert(data);
					alert(data.target);
					/* upload.js에서 선언한 함수 호출하여 사용  */
					var result = getFileInfo(data);
					
					$(".uploadedList").append(template(result));
				}
			});
		
		});
		
		
		
		
		
		
		$(".btn-warning").click(function(){
					
			var $form=$("form");
			var str="";
			$(".delbtn").each(function(index){
				str+="<input value='"+$(this).attr("href")+"' name='files["+index+"]' type='hidden'/>"
				
			});
			$form.append(str).attr("action","update")
			.attr("method", "post");
			
			$form.get(0).submit();
		});
		getAllAttach(bno);
	});
	
	function getAllAttach(bno){
  	  $.getJSON("/cs/getAttach/"+bno, function(result){
  		/* var source = $("#source").html();
  		var template = Handlebars.compile(source); */
  		
  		$(result).each(function(){
  			var data = getFileInfo(this);
  			$(".uploadedList").append(template(data));
  		});
  		  
  		  
  	  });
    }
	
	
	
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