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
<style>
	.uploadedList{
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
				<label for="title">제목</label> <input class="form-control"
					readonly="readonly" value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input class="form-control"
					readonly="readonly" value="${vo.writer }">
			</div>
			<div class="form-group">
				<label for="content">내용</label> <input class="form-control"
					readonly="readonly" value="${vo.content }">
			</div>

			<div class="form-group">
				<label>첨부파일</label>
				<ul class="uploadedList clearfix">
					
				</ul>
			</div>
		</div>

		<%-- 버튼 --%>
		<div class="row">
			<div class="form-group">
				<button id="list" class="btn btn-info">목록</button>
				<button id="update" class="btn btn-warning">수정</button>
				<button id="danger" class="btn btn-danger">삭제</button>
				<button id="reply" class="btn btn-primary">댓글</button>
			</div>
		</div>

		<%-- id체크 --%>
		<div class="row">
			<input class="form-control" id="inputID" placeholder="rno를 넣어주세요(숫자)">
			<button class="btn" id="inputCheckBtn">rno체크</button>
			<p id="msgforUse"></p>
		</div>

		<%-- 댓글작성UI --%>
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

		<%-- 댓글 --%>
		<div id="replies" class="row"></div>

		<%-- 댓글 페이지 --%>
		<div class="row">
			<ul class="pagination"></ul>
		</div>


		<%-- 모달 --%>
		<div class="row">
			<div id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-header">
						<button data-dismiss="modal" class="close">&times;</button>
						<p id="modal_rno" style="color: white"></p>
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

	</div>
	<%-- class container div end tag --%>


	<form>
		<input type="hidden" value="${vo.bno}" name="bno"> <input
			type="hidden" value="${cri.page}" name="page"> <input
			type="hidden" value="${cri.perPage}" name="perPage">
	</form>

	<script id="sourceAttach" type="text/x-handlebars-template">
<li class="col-xs-3 pull-left">
   <span>
      <img alt="장차법방지" src="{{imgsrc}}">
   </span>
   <div>
      <a href="{{getLink}}">{{fileName}}</a>
   </div>
</li>
</script>

	<script id="source" type="text/x-handlebars-template">
	{{#each.}}
		<div class="panel panel-info">
			<div class="panel-heading">
				<span>rno: {{rno}}, 작성자: {{replyer}}</span> <span class="pull-right">{{updateDate}}</span>
			</div>
			<div class="panel-body">
				<p>{{replyText}}</p>
				<button data-rno="{{rno}}" data-replyText="{{replyText}}" class="callModal btn btn-sm btn-success">수정/삭제</button>
			</div>
		</div>
		{{/each}}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var page = 1;
			var perPage = 15;
			var bno = ${vo.bno};
			
			getList(bno, page, perPage);
			getAllAttach(bno);
			
			$(".pagination").on("click", "li a", function(event) {
				event.preventDefault();
				page=$(this).attr("href");
				getList(bno, page, perPage);
			})
			
			$("#list").click(function() {
				$("form").attr("action", "list");
				$("form").submit();
			});

			$("#update").click(function() {
				$("form").attr("action", "update");
				$("form").submit();
			});

			$("#danger").click(function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					$("form").attr("action", "delete");
					$("form").submit();
				}
			});
			
			$("#reply").click(function() {
				$("#myCollapsible").collapse("toggle");
			});

			$("#replyInsertBtn").click(function() {
				var replyer = $("#replyer").val();
				var replyText = $("#replyText").val();

				$.ajax({
					type : 'post',
					url : '/replies',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data:JSON.stringify({
						replyer:replyer,
						replyText:replyText,
						bno:bno
					}),
					dataType:"text",
					success:function(result){
						$("#replyer").val("");
						$("#replyText").val("");
						$("#myCollapsible").collapse("toggle");
					},
					error:function(request, status, error){
						alert("fail");
						alert("code:"+request.status+"\n"+"msg:"+request.reponseText+"\n"+"error:"+error)	
					},
					complete:function(){
						getList(bno, page, perPage);
					}
				})
			});

			$("#replyResetBtn").click(function() {
				$("#replyer").val("");
				$("#replyText").val("");
			})
			
			$("#replies").on("click", ".callModal", function() {
				var rno = $(this).attr("data-rno");
				var replyText = $(this).attr("data-replyText");
				$("#modal_rno").text(rno);
				$("#modal_replyText").val(replyText);
				$("#myModal").modal("show");
			})
			
			$("#modal_update").click(function() {
				var rno=$("#modal_rno").text();
				var replyText=$("#modal_replyText").val();
				$.ajax({
					type : "put",
					url : "/replies/"+rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data:JSON.stringify({
						replyText:replyText
					}),
					dataType:"text",
					success:function(result){
						getList(bno, page, perPage);
					},
					error:function(request, status, error){
						alert("fail");
						alert("code:"+request.status+"\n"+"msg:"+request.reponseText+"\n"+"error:"+error)	
					}					
				})
			})
			
			$("#modal_delete").click(function() {
				var rno=$("#modal_rno").text();
				$.ajax({
					type : "delete",
					url : "/replies/"+rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					success:function(result){
						getList(bno, page, perPage);
					},
					error:function(request, status, error){
						alert("fail");
						alert("code:"+request.status+"\n"+"msg:"+request.reponseText+"\n"+"error:"+error)	
					}					
				})
			})
			
			$("#inputCheckBtn").click(function() {
				var inputID = $("#inputID").val();
				$.getJSON("/replies/checkID/"+inputID, function(data) {
					if (data) {
						$("#msgforUse").text("사용가능");
					} else {
						$("#msgforUse").text("사용불가능");
					}
				})
			})
			function getList(bno, page, perPage) {
				$.getJSON("/replies/"+bno+"/"+page+"/"+perPage, function(data) {
					
					var source=$("#source").html();
					var template=Handlebars.compile(source)
					var list = data.list;
					$("#replies").html(template(list));
					
					var pm = data.pm;
					printPaging(data.pm)
				});
			}
			
			function printPaging(pm) {
				var str="";
				if (pm.cri.page>1) {					
					str+="<li><a href='"+(pm.cri.page-1)+"'>&laquo;</a></li>"
				}
				for (var i = pm.beginPageNum; i <= pm.stopPageNum; i++) {
					var strClass=pm.cri.page == i?'active':'';
					str+="<li class='"+strClass+"'><a href='"+i+"'>"+i+"</a></li>"
				}
				if (pm.cri.page < pm.totalPage) {
					str+="<li><a href='"+(pm.cri.page+1)+"'>&raquo;</a></li>"
				}
				
				$(".pagination").html(str);
			}
			
			function getAllAttach(bno) {
				$.getJSON("/board/getAttach/"+bno, function(result) {
					var source = $("#sourceAttach").html();
					var template = Handlebars.compile(source);
					$(result).each(function () {
						var data=getFileInfo(this);
						$(".uploadedList").append(template(data));
					})
				})
			}
		}); //$(document).ready(function() {})
	</script>
</body>
</html>