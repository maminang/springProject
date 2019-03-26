<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="../../resources/js/upload.js" type="text/javascript"></script>
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

	<div class="container">
		<div class="row">
			<form action="/board/update" method="post">
				<div class="form-group">
					<label>제목</label> <input class="form-control" id="title"
						name="title" required="required" value="${vo.title }">
				</div>

				<div class="form-group">
					<label for="writer">작성자</label> <input class="form-control"
						id="writer" name="writer" value="${vo.writer}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="3" id="content" name="content"
						required="required">${vo.content}</textarea>
				</div>

				<input type="hidden" name="bno" value="${vo.bno}"> <input
					type="hidden" value="${cri.page}" name="page"> <input
					type="hidden" value="${cri.perPage}" name="perPage">
			</form>

			<div class="form-group">
				<label>업로드할 파일을 드랍하세요.</label>
				<div class="fileDrop"></div>
			</div>

			<ul class="uploadedList clearfix">
			</ul>

			<div class="form-group">
				<button class="btn btn-info" type="submit">등록</button>
			</div>
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
		var bno = ${vo.bno};
			
		var source = $("#source").html();
		var template = Handlebars.compile(source);
		$(document).ready(function() {
			
			getAllAttach(bno);
			
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
			
			$(".uploadedList").on("click", ".delbtn", function(event) {
				event.preventDefault();
				var $delBtn=$(this);
				var $delLi = $(this).parent("div").parent("li");
				
				var delOk = confirm("수정버튼과 상관없이 파일이 서버에서 즉시 삭제됩니다. \n 삭제하시겠습니까?")
				if (delOk) {
					$.ajax({
						url: "/board/deleteFile",
						type: "post",
						data: {
							fileName : $delBtn.attr("href"),
							bno: bno
						},
						dataType: "text",
						success:function(result){
							$delLi.remove();
						}
					})
				}
			})
			
			$(".btn-info").click(function(event) {
				event.preventDefault();
				var $form=$("form");
				var str="";
				
				$(".delbtn").each(function (index) {
					str+="<input name='files["+index+"]' value='"+$(this).attr("href")+"' type='hidden' />"
				});
				
				$form.append(str);
				$form.get(0).submit();
			});
			
		});
		
		function getAllAttach(bno) {
			$.getJSON("/board/getAttach/"+bno, function(result) {
				$(result).each(function () {
					var data=getFileInfo(this);
					$(".uploadedList").append(template(data));
				})
			})
		}
	</script>
</body>
</html>