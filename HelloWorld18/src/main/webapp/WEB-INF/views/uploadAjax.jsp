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
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted red;
}

small {
	margin-left: 3px;
	color: red;
	cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="fileDrop"></div>
			<div class="uploadedList"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
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
							alert(data)
							var str = "";
							if (checkImageType(data)) {
								str = "<div><img alt='메렁' src='displayFile?fileName="+data+"'/><a href='displayFile?fileName="+getImgLink(data)+"' target='_blank'>"+getOriginalName(data)+"</a><small data-src='"+data+"'>X</small></div>";
							} else {
								str = "<div><img src='../resources/img/general.png'><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a><small data-src='"+data+"'>X</small></div>"
							}
							$(".uploadedList").append(str);
						}
					})
				}
			})
			
			$(".uploadedList").on("click", "small", function () {
				var $that = $(this);
				
				$.ajax({
					url:"deleteFile",
					type:"post",
					data:{
						fileName:$that.attr("data-src")
					},
					dataType: "text",
					success:function(result){
						alert("삭제되었습니다")
						$that.parent("div").remove();
					}
				})
			})
		});
		
		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}

		function getOriginalName(fileName) {
			var originalName = "";

			if (checkImageType(fileName)) {
				var idx = fileName.indexOf("_") + 1;
				fileName = fileName.substring(idx);
				idx = fileName.indexOf("_") + 1;
				originalName = fileName.substring(idx);
			} else {
				var idx = fileName.indexOf("_") + 1;
				originalName = fileName.substring(idx);
			}

			return originalName;
		}

		function getImgLink(fileName) {
			if (checkImageType(fileName)) {
				var prefix = fileName.substring(0 , 12);
				var suffix = fileName.substring(14);
				return prefix+suffix;
			}
			return null;
		}
	</script>
</body>
</html>