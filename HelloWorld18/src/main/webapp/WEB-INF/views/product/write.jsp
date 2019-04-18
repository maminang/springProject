<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Write</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="../../resources/images/icons/favicon.png"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
<!--===============================================================================================-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted red;
	background-color: lightslategray;
	margin: auto;
}

.uploadedList li {
	list-style-type: none;
}
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
<body>
	<jsp:include page="../header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<h1 class="text-center">상품등록</h1>
	<hr>


	<div class="container">
		<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" id="in">
			<form action="/product/write" method="post">
				<!-- 카데고리 -->
				<div class="container" align="right">
					<label>카테고리</label> <select class="category" name="category">
						<option value="citrus">시트러스</option>
						<option value="floral">플로랄</option>
						<option value="fruity">프루티</option>
						<option value="spicy">스파이시</option>
						<option value="lightFloral">라이트 플로랄</option>
						<option value="woody">우디</option>
					</select>
				</div>
				<div class="form-group">
					<label>영어이름명</label><input id="pdName" class="form-control"
						name="eng_name" required><br>
				</div>
				<div class="form-group">
					<label>한글이름명</label><input id="pdName" class="form-control"
						name="kr_name" required><br>
				</div>

				<div class="form-group">
					<label>대표이미지를 드랍하세요</label>
					<div class="fileDrop"></div>
				</div>

				<ul class="uploadedList clearfix">
				</ul>

				<div class="form-group">
					<label>제품 소개</label>
					<textarea class="form-control" rows="10" name="prdct_dscrp"></textarea>
				</div>
				
				<div class="form-group">
					<label>전성분</label>
					<textarea class="form-control" rows="10" name="INGRD"></textarea>
				</div>
				
				<div id="detail">
					<button id="addDetailForm" class="btn">디테일추가</button>

					<div class="volume">
						<label>용량</label><input class="form-control" name="volume"
							required>
					</div>

					<div class="form-group">
						<label>가격</label><input id="price" class="form-control"
							name="price" required><br>
					</div>
				</div>
				
				<div class="row">
					<button class="btn btn-secondary" type="reset" value="초기화">초기화</button>
					<button class="btn btn-success" type="submit" value="등록">등록</button>
				</div>
			</form>
		</div>

	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />


	<%-- 여기까지가 뷰 --%>

	<script id="source" type="text/x-handlebars-template">
		<li class="col-xs-3"><span><img src="{{imgsrc}}"></span>
			<div>
				<a href="{{getLink}}">
					{{fileName}}
				</a> 
				<a class="btn btn-danger btn-xs btn-right delbtn glyphicon glyphicon-remove" 
				href="{{fullName}}">
				</a>
			</div>
		</li>
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var source = $("#source").html();
			var template = Handlebars.compile(source);

			// :::::::::::::::::::::::::::::::::::::::::::::::::파일드랍:::::::::::::::::::::::::::::::::::::::::::::::::::::::
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				var files = event.originalEvent.dataTransfer.files;
				for (var i = 0; i < files.length; i++) {
					var file = files[i];

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
							/* db에 넣을 이미지파일이름만 추출 */
							var OrgFileName = data.substring(data.indexOf('img')+4, data.length);
							var str = "";
							str = "<div><img alt='메렁' src='/displayFile?fileName="+data+"'/><a href='/displayFile?fileName="+data+"' target='_blank'>"+getOriginalName(data)+"</a><small data-src='"+data+"' class='btn btn-danger glyphicon glyphicon-remove'>";
							str += "<input type='hidden' name='images' value='"+data+"'>";
							str += "</small></div>";
							$(".uploadedList").append(str);
						}
					})
				}
			})
			
			function getOriginalName(fileName) {
				var originalName = "";

				var idx = fileName.indexOf("_") + 1;
				originalName = fileName.substring(idx);

				return originalName;
			}
			
			$(".uploadedList").on("click", "small", function () {
				var $that = $(this);
				alert($that)
				$.ajax({
					url:"/deleteFile",
					type:"post",
					data:{
						fileName:$that.attr("data-src")
					},
					dataType: "text",
					success:function(result){
						alert("삭제되었습니다")
						$that.parent("div").remove();
					}
				});
			});
			
			$("#addDetailForm").click(function() {
				var str="";
				str = "<div class='volume'><label>용량</label><input class='form-control' name='volume' required></div><div class='form-group'><label>가격</label><input id='price' class='form-control' name='price' required><br></div>"
				$("#detail").append(str);
			});
		});
	</script>
</body>
</html>