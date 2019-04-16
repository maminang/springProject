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
			<hr>
			
			<!-- 공유하기 modal btn -->
			<div class="row">
				<a class="btn" type="button" data-toggle="modal" data-target=".bs-example-modal-sm">공유하기</a>
			</div>
			<!-- 			공유하기 modal -->

			<!-- 리뷰 작성하기 btn -->
			<div class="row">
				<a class="btn" type="button" data-toggle="modal" data-target="#replyInsertModal">리뷰작성</a>
			</div>
			<!-- 리뷰 작성하기 btn -->

		</div>

		<!-- replies -->
		<div id="replies" class="row">
		</div>

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

	<!-- ReplyInsert Modal -->
	<div class="row">
		<div class="modal fade" id="replyInsertModal" role="dialog"
			aria-labelledby="replyInsertModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="replyInsertModalLabel">댓글 작성</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label" for="title">제목</label> <input
								class="form-control" id="title">
						</div>
						<div class="form-group">
							<label class="control-label" for="id">작성자</label> <input
								class="form-control" id="id" value="${login.id}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label class="control-label" for="content">내용</label> <input
								class="form-control" id="content">
						</div>
						<div id="scoreDiv" class="form-group">
							<label class="control-label" for="score">별점</label> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <input type="hidden"
								id="score" value=5>
						</div>
						<div class="form-group">
							<label for="age_group">연령대</label> <select class="form-control"
								id="age_group">
								<option value="18 ~ 24">18 ~ 24</option>
								<option value="25 ~ 34">25 ~ 34</option>
								<option value="35 ~ 44">35 ~ 44</option>
								<option value="45 ~ 54">45 ~ 54</option>
								<option value="55 ~ 64">55 ~ 64</option>
								<option value="65 ~ ">65 ~</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<div class="form-group">
							<button id="replyInsertBtn" class="btn btn-success">등록</button>
							<button id="replyResetBtn" class="btn btn-default">초기화</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ReplyInsert Modal -->

	<jsp:include page="../footer.jsp" />

	<!-- reviewListSource -->
	<script id="reviewListSource" type="text/x-handlebars-template">
		{{#each.}}
			<div class="panel panel-info">                                                                                           
				<div class="panel-heading">                                                                                          
					<span>{{title}}</span> 
					<span class="pull-right">작성자: {{id}}</span><br>                                            
					<span class="pull-right">연령대: {{age_group}}</span>
				</div>                                                                                                               
				<div class="panel-body">                                                                                             
					<p>{{content}}</p>
					별점{{{score score}}}                                
					<form action="/review/delete" method="post">
						<input type="hidden" name="rno" value="{{rno}}">
						<input type="hidden" name="pno" value="{{pno}}">
						<input type="submit" class="btn btn-xs btn-warning" value="삭제">
					</form> 
				</div>                                                                                                               
			</div>
		{{/each}}
   </script>

	<script type="text/javascript"
		src="/scripts/amcharts/amcharts.js?v=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var pno = ${pd.pno};
            
            getReviewList(pno)
            
            function getReviewList(pno) {
				$.getJSON("/review/"+pno, function(data) {

					var source = $("#reviewListSource").html();
					var template = Handlebars.compile(source)

					$("#replies").html(template(data));
				});
			}
            
            Handlebars.registerHelper('score', function(score, options) {
            	var out = "";
				for (var i = 0; i < score; i++) {
					out += "<span class='glyphicon glyphicon-star'></span>"
				}
				for (var i = score; i < 5; i++) {
					out += "<span class='glyphicon glyphicon-star-empty'></span>"
				}
				return out;
			})

			//장바구니에 담기	
			$("#cart").click(function() {
				$("form").attr("action", "/shoppingCart/insertShoppingCart");
				$("form").attr("method", "GET");
				$("form").submit();
				alert("장바구니에 담겼습니다");
			});
			
			// replyInsert
			$("#replyInsertBtn").click(function() {
				var loginCk = ${empty login};
				
				if (loginCk) {
					if (confirm("로그인을 해야 리뷰를 입력할수 있습니다. 로그인 화면으로 가시겠습니까?")) {
						location.href = "/member/login";
					}
					return;
				}
				
	            var id = $("#id").val();
	            var content = $("#content").val();
	            var score = $("#score").val();
	            var title = $("#title").val();
	            var age_group = $("#age_group").val();
	            
	            $.ajax({
	            	type : 'post',
	                url : '/review',
	                headers : {
	                   "Content-Type" : "application/json",
	                   "X-HTTP-Method-Override" : "POST"
	                },
	                data : JSON.stringify({
	                   id : id,
	                   content : content,
	                   pno : pno,
	                   score : score,
	                   title : title,
	                   age_group : age_group
	                }),
	                dataType : "text",
	                success : function(result) {
	                   $("#title").val("");
	                   $("#content").val("");
	                   $("#replyInsertModal").modal("hide");
	                   getReviewList(pno);
	                },
	                error : function(request, status, error) {
	                   alert("fail");
	                   alert("code:" + request.status + "\n"
	                        + "msg:" + request.reponseText
	                        + "\n" + "error:" + error)
	                }
				});
			});
			
			// dynamic score button
	        var scoreClick = $("#scoreDiv span")
	        scoreClick.mouseover(function() {
				var index = $(this).index();
				scoreClick.slice(0,index).attr('class','glyphicon glyphicon-star')
				scoreClick.slice(index, 5).attr('class','glyphicon glyphicon-star-empty')
			})
			scoreClick.mouseout(function() {
				var index = $("#score").val();
				scoreClick.slice(0,index).attr('class','glyphicon glyphicon-star')
				scoreClick.slice(index, 5).attr('class','glyphicon glyphicon-star-empty')
			})
	 		scoreClick.click(function() {
				var index = $(this).index();
				$("#score").val(index);
			})
		});
	</script>
</body>
</html>