<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="../../resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>

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
</style>

<title>Insert title here</title>
</head>
<body>
	<h1>상품등록</h1>
	<hr>
<!-- 카데고리 -->	
	<div class="container" align="right">
		<label>카테고리</label>
		<select class="category">
			<option>플로럴</option>
			<option>시트러스</option>
			<option>우디</option>
		</select>
	</div>
	
	<div class="container">
		<div class="row">
			<form action="/project/list" >
				<div class="form-group">
					<label>상품명</label><input id="pdName" class="form-control" name="pdName" required ><br>
				</div>
				
				<div class="form-group">
					<label>대표이미지를 드랍하세요</label>
					<div class="fileDrop"></div>
				</div>
				
				<ul class="uploadedList clearfix">
				</ul>
				
				<div class="form-group">
					<label>가격</label><input id="price" class="form-control" name="price" required ><br>
				</div>

				<div class="form-group">
					<label>재고 수량</label><input type="number" id="quantity" class="form-control" name="quantity" required ><br>
				</div>
				
				<div class="row col-sm-10">
					<label>상세페이지(이미지 업로드)</label>
					<textarea name="editor1"></textarea>
	                <script>
	                        CKEDITOR.replace( 'editor1' );
	                </script>
     		   </div>
     		   <div class="row">
					<button class="btn btn-secondary" type="reset" value="초기화">초기화</button>
					<button class="btn btn-success" type="submit" value="등록">등록</button>
     		   </div>
			</form>
		</div>
	
	</div>
	
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
	$(document).ready(function(){
	var source = $("#source").html();
	var template = Handlebars.compile(source);
	
// :::::::::::::::::::::::::::::::::::::::::::::::::파일드랍:::::::::::::::::::::::::::::::::::::::::::::::::::::::
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
				/* 쿼리로 안되게 막아놓음 */
				processData : false,
				/* 컨텐트타입변환되는걸 막아놓음 */
				contentType : false,
				success : function(data) {
					var result = getFileInfo(data);
					alert(result);
					$(".uploadedList").append(template(result));
				}
			});
		});
		
		
	});
</script>	
</body>
</html>