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
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
.container {
	border: 1px dashed #bcbcbc;
	text-align: right;
	width: 700px;
	height: auto;
}

.box {
	border: 1px dashed #bcbcbc;
	height: auto;
	text-align: center;
	margin: auto;
	width: 800px;
}

.leftbox {
	width: 300px;
	/* 	border: 1px dashed red; */
	text-align: center;
	display: inline-block;
}

.rightbox {
	width: 300px;
	/* 	border: 1px dashed red; */
	text-align: center;
	display: inline-block;
}

.glyphicon glyphicon-star{
	
}
/* #img { */
/* 	border: 1px dashed blue; */
/* 	height: 300px; */
/* 	width: 300px; */
/* } */
</style>
</head>
<body>
	<jsp:include page="../headerBar.jsp" />
	<div class="box">
		<div class="leftbox">

			<!-- 		이미지 -->
			<div id="img">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">

						<%-- 이미지갯수에 맞춰서 li나오게 --%>
						<c:forEach items="${pd.images}" varStatus="status">

							<%-- 반드시 첫번째 carousel은 class="active가 들어가야함" --%>
							<c:if test="${status.index == 0}">
								<li data-target="#carousel-example-generic"
									data-slide-to="${status.index}" class="active"></li>
							</c:if>
							<c:if test="${status.index != 0}">
								<li data-target="#carousel-example-generic"
									data-slide-to="${status.index}"></li>
							</c:if>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">

						<%-- 위와 같이 이미지갯수에 맞춤 --%>
						<c:forEach items="${pd.images}" varStatus="status">

							<%-- 위와 같이 class="active" --%>
							<c:if test="${status.index == 0}">
								<div class="item active">
									<img src="/displayFile?fileName=${pd.images[status.index]}"
										alt="...">
								</div>
							</c:if>
							<c:if test="${status.index != 0}">
								<div class="item">
									<img src="/displayFile?fileName=${pd.images[status.index]}"
										alt="...">
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- 			이미지 -->
		</div>
		<!-- leftbox -->

		<div class="rightbox">
			<div>${pd.kr_name }</div>
			<div>${pd.eng_name }</div>
			<br>
			<div>${pd.prdct_dscrp }</div>
			<br>

			<!-- Button trigger modal 모달 모달모달-->
			<a data-toggle="modal" data-target="#exampleModalCenter">전성분</a><br>
			<!-- Button trigger modal 모달 모달모달-->

			장바구니에 용량이랑 가격도 넣어야함
			<!-- 			값 넣어주는 곳인데 나중에 고쳐야함 -->
			<form>
				<div>
					<select name="vp">
						<c:forEach items="${pdd}" var="var">
							<option>₩${var.price } ${var.volume}ml</option>
						</c:forEach>
					</select>
				</div>
				수량 : <input type="number" value="1" name="amount" min="1" required
					autofocus> <input value="NamepeN" name="id" type="hidden">
				<input value="${pd.pno }" name="pno" type="hidden"> <a
					id="cart" class="btn btn-success">장바구니에 담기</a>
			</form>
			<!-- 			값 넣어주는 곳인데 나중에 고쳐야함 -->
			<hr>

			<!-- 			공유하기 modal -->
			<a type="button" data-toggle="modal"
				data-target=".bs-example-modal-sm">공유하기</a> <br>
			<!-- 			공유하기 modal -->

			<!-- 			리뷰 작성하기 -->
			<button class="btn" id="reply">리뷰 작성하기</button>
			<!-- 			리뷰 작성하기 -->

		</div>
		<!-- replies -->
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
				<div>
					<label for="score">별점</label>
					<div class="glyphicon glyphicon-star-empty" style="color: yellow" onclick="changeScore(1)"></div>
					<div class="glyphicon glyphicon-star-empty" style="color: yellow" onclick="changeScore(2)"></div>
					<div class="glyphicon glyphicon-star-empty" style="color: yellow" onclick="changeScore(3)"></div>
					<div class="glyphicon glyphicon-star-empty" style="color: yellow" onclick="changeScore(4)"></div>
					<div class="glyphicon glyphicon-star-empty" style="color: yellow" onclick="changeScore(5)"></div>
				</div>
				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-success">등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>
				</div>
			</div>
		</div>

		<div id="replies" class="row"></div>
		<!-- replies -->
	</div>





	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">전성분</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">${pd.INGRD}</div>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<!-- 	공유하기 Modal -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<h3 style="text-align: center;">
					<a
						href="http://www.facebook.com/sharer/sharer.php?u=http://211.183.8.71:8089/shoppingCart/read">facebook</a>
					<a
						href="https://twitter.com/intent/tweet?text=TEXT&url=${pageContext.request.requestURL }">twitter</a>
				</h3>
			</div>
		</div>
	</div>
	<!-- 	공유하기 Modal -->

	<!-- Replies Modal -->
	<div class="row">
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<p id="modal_pno"></p>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control" id="modal_replyText">
				</div>
				<div class="modal-footer">
					<button id="modal-update" data-dismiss="modal" class="btn btn-xs">수정</button>
					<button id="modal-delete" data-dismiss="modal" class="btn btn-xs">삭제</button>
					<button id="modal-close" data-dismiss="modal" class="btn btn-xs">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Replies Modal -->

	<jsp:include page="../footerBar.jsp" />

	<script id="source" type="text/x-handlebars-template">
   {{#each.}}
   <div class="panel panel-info">
      <div class="panel-heading">
         <span>pno: {{pno}}, 작성자: {{replyer}}</span> <span class="pull-right">{{updateDate}}</span>
      </div>
      <div class="panel-body">
         <p>{{replyText}}</p>
         <button class="btn btn-xs btn-warning callModal" data-pno="{{pno}}" data-replyText="{{replyText}}">수정/삭제</button>
      </div>
   </div>
   {{/each}}
   </script>
	<script type="text/javascript">
		$(document).ready(function() {

			//장바구니에 담기	
			$("#cart").click(function() {
				$("form").attr("action", "/shoppingCart/insertShoppingCart");
				$("form").attr("method", "GET");
				$("form").submit();
				alert("장바구니에 담겼습니다");
			});
			
			$("#replyInsertBtn").click(function() {
	            var replyer = $("#replyer").val();
	            var replyText = $("#replyText").val();
	            var pno = ${pd.pno};
	            
	            
	            $.ajax({
	               type : 'post',
	               url : '/review',
	               headers : {
	                  "Content-Type" : "application/json",
	                  "X-HTTP-Method-Override" : "POST"
	               },
	               data : JSON.stringify({
	                  replyer : replyer,
	                  replyText : replyText,
	                  pno : pno
	               }),
	               dataType : "text",
	               success : function(result) {
	                  $("#replyer").val("");
	                  $("#replyText").val("");
	                  $("#myCollapsible").collapse("toggle");
	                  getList(rno, page);
	               },
	               error : function(request, status, error) {
	                  alert("fail");
	                  alert("code:" + request.status + "\n"
	                        + "msg:" + request.reponseText
	                        + "\n" + "error:" + error)
	               },
	               complete : function() {
	               }
	            })
	         });
	         
	         $("#reply").click(function() {
	            $("#myCollapsible").collapse("toggle");
	         });
	         
	         $("#replies").on("click", ".callModal", function() {
	            var pno = $(this).attr("data-pno");
	            var replyText = $(this).attr("data-replyText");
	            $("#modal_pno").text(pno);
	            $("#modal_replyText").val(replyText);
	            $("#myModal").modal("show");
	         });

		});
		
		function changeScore(score) {
			alert("별점 변경"+score)
		}
	</script>
</body>
</html>