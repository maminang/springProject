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


<script src="../../resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



<title>Insert title here</title>
</head>
<body>





	<div class="container">
		<div class="row">
			<form action="/cs/delete" method="get">
				<div class="form-group">
					<label for="password">삭제를 계속 진행하시려면 비밀번호를 입력하세요</label> <input
						id="password" class="form-control" name="password">
				</div>







				<input value="${vo.bno }" name="bno" type=hidden>
				<!-- 수정하기 눌렀을 때 수정한 글이 있더 페이지로 되돌아갈 수 있도록 하기 위해, read.jsp에서 보내는 값 받아오는 부분-->
				<input value="${cri.page }" name="page" type=hidden> <input
					value="${cri.perPage }" name="perPage" type=hidden>

			</form>




			<div class="form-group">
				<button type="submit" class="btn btn-warning">삭제</button>
			</div>
		</div>
	</div>
	<!-- class container end tag -->



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
		var bno = "${vo.bno}";
		var source = $("#source").html();
		var template = Handlebars.compile(source);

		var qpassword = "${vo.qpassword}";

		$(document).ready(
				function() {

					$(".btn-warning").click(
							function() {
								var $form = $("form");
								var str = "";
								var password = $('#password').val();

								if (password == qpassword) {
									$(".delbtn").each(
											function(index) {
												str += "<input value='"
														+ $(this).attr("href")
														+ "' name='files["
														+ index
														+ "]' type='hidden'/>"
											});
									$form.append(str).attr("action", "delete")
											.attr("method", "get");
									$form.get(0).submit();

								} else {
									alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
								}

							});
					getAllAttach(bno);
				});
	</script>



</body>
</html>