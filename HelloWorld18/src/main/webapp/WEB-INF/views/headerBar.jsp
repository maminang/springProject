<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">DEmoNeyo</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<c:if test="${empty login}">
					<li><a href="/member/login" class="glyphicon glyphicon-log-in">로그인</a></li>
				</c:if>
				<c:if test="${not empty login}">
					<li><a href="/member/logout"
						class="glyphicon glyphicon-log-out">로그아웃</a></li>
				</c:if>
				<li><a href="/member/signup" class="glyphicon glyphicon-pencil">회원가입</a></li>
				<li><a href="/member/mypage" class="glyphicon glyphicon-user">마이페이지</a></li>
				<li><a href="#" class="glyphicon glyphicon-shopping-cart">장바구니</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a
					class="dropdown-toggle glyphicon glyphicon-search"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"></a>
					<ul class="dropdown-menu">
						<li><form class="navbar-form navbar-left"
								action="/product/search">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="검색"
										name="keyword">
								</div>
								<button type="submit"
									class="btn btn-default glyphicon glyphicon-search"></button>
							</form></li>
					</ul></li>

			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav navbar-nav" id="menu">
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#"
				class="dropdown-toggle glyphicon glyphicon-menu-hamburger"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Action1</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="#">Separated link</a></li>
				</ul></li>
		</ul>
	</div>
</nav>

<script id="menuSource" type="text/x-handlebars-template">
	{{#each.}}
			<li><a href="{{href}}">{{category}}</a></li>
	{{/each}}
</script>
<script type="text/javascript">
	$(document).ready(function() {
	});

	function getMenu() {
		$.getJSON("/menu", function(data) {
			var source = $("#menuSource").html();
			var template = Handlebars.compile(source)

			$("#menu").html(template(data));
		})
	}
</script>