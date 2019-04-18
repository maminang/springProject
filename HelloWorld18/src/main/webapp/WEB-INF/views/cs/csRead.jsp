<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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



	<div class="container">
		<div class="row">

			<div class="form-group">
				<label for="qtitle">제목</label> <input class="form-control" readonly
					name="qtitle" id="qtitle" value=${vo.qtitle}>
			</div>


			<div class="form-group">
				<label for="quser">질문자</label> <input class="form-control" readonly
					name="quser" id="quser" value=${vo.quser}>
			</div>

			<div class="form-group">
				<label for="qtype">질문유형</label>
				<textarea class="form-control" readonly name="qtype" id="qtype">${vo.qtype}</textarea>
			</div>

			<div class="form-group">
				<label for="qcontent">질문내용</label>
				<textarea class="form-control" readonly name="qcontent"
					id="qcontent">${vo.qcontent}</textarea>
			</div>

			<%-- <div class="form-group">
			<label>첨부파일</label>
			<img src="${vo.qfile}" alt="첨부파일" width="auto">${vo.qfile}
			<ul class="uploadedList clearfix">
				
				
			</ul>
			
		</div> --%>

			<div class="form-group">
				<label for="qanswer">답변내용</label>
				<textarea class="form-control" readonly name="qanswer" id="qanswer">${vo.qanswer}</textarea>
			</div>




			<div class="form-group">
				<button id="update" class="btn btn-warning">수정</button>
				<button id="delete" class="btn btn-danger">삭제</button>
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

			$("#update").click(function() {
				$("form").attr("action", "updateauthority");
				$("form").attr("method", "get");
				$("form").submit();
			});
			$("#delete").click(function() {
				$("form").attr("action", "deleteui");
				$("form").attr("method", "get");
				$("form").submit();
			});
			$("#list").click(function() {
				$("form").attr("action", "csCenter");
				$("form").attr("method", "get");
				$("form").submit();
			});
		});
		
	</script>







</body>
</html>