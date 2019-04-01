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


<script>
	var bDisplay = true;
	function doDisplay() {
		var con = document.getElementById("hiddencontent");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>




	<jsp:include page="../headerBar.jsp" />
	<div class="container">
		<div class="row">
			<div>
				<img src="/resources/img/csCenter.jpg">
			</div>
			<a> <img src="/resources/img/faqtitle.jpg" alt="faq">
			</a> <a> <img src="/resources/img/qnatitle.jpg" alt="qna">
			</a>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>

					<!-- ${cslist } 컨트롤러 model에 바인딩할 때 "" 안에 있는 값과 대소문자까지 일치해야 불러올 수 있다. -->
					<c:forEach var="cs" items="${cslist }">
						<tr>
							<a href="javascript:doDisplay();">
							<td>${cs.idnbr }</td>
							<%-- <td><a href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${vo.bno }">${vo.title}</a></td> --%>
							<td>${cs.qtype}</td>
							<td>${cs.qtitle}</td>
							<!-- DTO에 선언된 변수명과 일치해야한다. -->
							</a>

							<!--자바스크립트 이용하여 내용 숨기기 mainia.tistory.com/2710-->
						</tr>
						<tr>
							<td>
							<div style="display:block" id="hiddencontent">
								${cs.qcontent}
							</div>
							</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
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


		<jsp:include page="../footerBar.jsp" />
		<script type="text/javascript">
			$(document).ready(function() {

			});
		</script>
</body>
</html>