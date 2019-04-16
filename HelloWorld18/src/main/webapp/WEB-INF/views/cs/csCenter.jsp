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



<style>
.floating {
	position: fixed;
	right: 50%;
	bottom: 50px;
	margin-right: -720px;
	text-align: center;
	width: 120px;
}
</style>





<title>Insert title here</title>

</head>

<body>





	<div class="floating">

		<a href="https://open.kakao.com/o/s5ZqXQib"> <img
			style="width: 50px; height: 50px" src="/resources/img/kakao.jpg">

		</a>

	</div>







	<jsp:include page="../headerBar.jsp" />

	<div class="container">

		<div class="row">

			<a class="btn btn-info" href="/cs/insertui">질문하기</a>

		</div>

		<!-- <table>
			<tr>
				<td height="0">
					<div Style="height: 100%">
						<img src="/resources/img/faqtitle.jpg">
					</div>
				<td height="0">
					<div Style="height: 100%">
						<img src="/resources/img/qnatitle.jpg">
					</div>
			</tr>
		</table>
 -->




		<div class="row" style="text-align: center;">

			<img src="/resources/img/csCenter.jpg"> <br>



		</div>

	</div>

	<div class="container">

		<div class="row">

			<table class="table table-hover">
				<colgroup>

					<col width="20%" />

					<col width="20%" />

					<col width="60%" />

				</colgroup>
				<thead>

					<tr>

						<th>번호</th>

						<th>분류</th>

						<th>제목</th>

					</tr>

				</thead>

				<tbody>



					<!-- ${cslist } 컨트롤러 model에 바인딩할 때 "" 안에 있는 값과 대소문자까지 일치해야 불러올 수 있다. -->

					<c:forEach var="cs" items="${list }">

						<tr>



							<td>${cs.bno }</td>

							<%-- <td><a href="/cs/csCenter${pm.makeQuery(pm.cri.page)}&bno=${vo.bno }">${vo.title}</a></td> --%>

							<td id="${cs.bno}">${cs.qtype}</td>

							<td><a
								href="/cs/csRead${pm.makeQuery(pm.cri.page) }&bno=${cs.bno}">${cs.qtitle}</a></td>



							<!-- DTO에 선언된 변수명과 일치해야한다. -->





						</tr>

						<tr style="display: none;">

							<td colspan="3" id="h${cs.bno}">
								<!--자바스크립트 이용하여 내용 숨기기 mainia.tistory.com/2710--> ${cs.qcontent}

							</td>

						</tr>




					</c:forEach>

				</tbody>

			</table>

		</div>

	</div>

	<!-- class row -->





	<div class="row text-center">

		<ul class="pagination pagination-lg">



			<c:if test="${pm.beginPageNum != 1}">

				<li><a href="/cs/csCenter?page=${pm.beginPageNum-1}">&laquo;</a></li>

			</c:if>



			<c:forEach begin="${pm.beginPageNum}" end="${pm.stopPageNum }"
				var="idx">

				<li class="${idx == pm.cri.page ? 'active' : ''}"><a
					href="/cs/csCenter${pm.makeQuery(idx)}"> ${idx}</a></li>

			</c:forEach>



			<c:if test="${pm.stopPageNum != pm.totalPage }">

				<li><a href="/cs/csCenter?page=${pm.stopPageNum+1}">&raquo;</a></li>

			</c:if>



		</ul>

	</div>


	<form action="/cs/search" method="get" target="_blanck">


		<div class="row">
			<div class="col-xs-3 col-sm-2">
				<select class="form-control" id="ssel" name="searchType">
					<option disabled>검색기준</option>
					<option value="qtitle">제목</option>
					<option value="quser">작성자</option>
					<option value="qcontent">내용</option>
				</select>
			</div>
			<div class="input-group col-xs-9 col-sm-10">
				<span class="input-group-btn"> <input class="form-control"
					id="keyword" name="keyword">

					<button class="btn btn-success">검색</button>
				</span>
			</div>
		</div>
	</form>








	<jsp:include page="../footerBar.jsp" />

	<script type="text/javascript">

			$(document).ready(function() {
				
				var f_target=$(this).parent("tr").next("tr").css("display","inline");
				
				
				
				
				
				/* $(#).click(function(event){
					$('#h51').parent("tr").next("tr").css("display","onblock");
					/* if($('.name_by_id2').css("display", "none")){
						$('name_by_id2').css("display", "inline-block");
					}else{
						$('name_by_id2').css("display", "none");
					} */
				}); 
				$(this)
				$('#c${cs.bno}').click(function(event){
					alert("test");	 
					
					/* if($('.name_by_id2').css("display", "none")){
						$('name_by_id2').css("display", "inline-block");
					}else{
						$('name_by_id2').css("display", "none");
					} */
				});
			
			

		</script>




</body>

</html>