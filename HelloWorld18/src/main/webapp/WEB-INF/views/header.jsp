<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Jo Malone
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25">
							Help & FAQ
						</a>
						
						<c:if test="${empty login}">
							<a href="/member/login" class="flex-c-m trans-04 p-lr-25">Login</a>
						</c:if>
						<c:if test="${not empty login}">
							<a href="/member/logout" class="flex-c-m trans-04 p-lr-25">Logout</a>
						</c:if>
						
						<a href="/member/mypage" class="flex-c-m trans-04 p-lr-25">
							My Page
						</a>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="/" class="logo">
						<img src="../../resources/images/icons/jomalone_logo.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="/">Home</a>
							</li>

							<li class="active-menu">
								<a href="/product/list">Shop</a>
								<ul class="sub-menu" id="menu">
								</ul>
							</li>

							<li class="label1" data-label1="hot">
								<a href="/product/bestSeller">Best Seller</a>
							</li>
							
							<li>
								<a href="#">About</a>
							</li>
							
							<li>
								<a href="#">Contact</a>
							</li>							
							
							<li>
								<a href="#">Customer Service</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart">
							<a href="/shoppingCart/listShoppingCart/">
								<i class="zmdi zmdi-shopping-cart"></i>
							</a>
						</div>

					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="/"><img src="../../resources/images/icons/jomalone_logo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 js-show-cart">
					<a href="/shoppingCart/listShoppingCart/">
						<i class="zmdi zmdi-shopping-cart"></i>
					</a>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Jo Malone
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
					
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQ
						</a>
						
						<c:if test="${empty login}">
							<a href="/member/login" class="flex-c-m p-lr-10 trans-04">Login</a>
						</c:if>
						<c:if test="${not empty login}">
							<a href="/member/logout" class="flex-c-m p-lr-10 trans-04">Logout</a>
						</c:if>

						<a href="/member/mypage" class="flex-c-m p-lr-10 trans-04">
							My Page
						</a>

					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="/">Home</a>
				</li>

				<li>
					<a>Shop</a>
					<ul class="sub-menu-m" id="menu-m">
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>
				
				<li>
					<a href="/product/bestSeller">Best Seller</a>
				</li>

				<li>
					<a href="#">About</a>
				</li>

				<li>
					<a href="#">Contact</a>
				</li>
				
				<li>
					<a href="#">Customer Service</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="../../resources/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15" action="/product/search">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="keyword" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>
	<script id="menuSource" type="text/x-handlebars-template">
	{{#each.}}
			<li><a href="{{href}}">{{category}}</a></li>
	{{/each}}
	</script>
	<script type="text/javascript">
		getMenu();
		function getMenu() {
			$.getJSON("/menu", function(data) {
				var source = $("#menuSource").html();
				var template = Handlebars.compile(source)

				$("#menu").html(template(data));
				$("#menu-m").html(template(data));				
			});
		}
	</script>