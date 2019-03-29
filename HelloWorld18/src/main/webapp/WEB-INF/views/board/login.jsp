<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="../headerBar.jsp" />
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
				<form method="post" action="main.jsp">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<button type="submit" class="btn" id="loginBtn" value="로그인">로그인</button>
					<button type="submit" class="btn" id="signinBtn" value="회원가입">회원가입</button>
				</form>
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function(){
		$("#signinBtn").click(function(){
			$("form").attr("action","signup");
			$("form").attr("method","get");
			$("form").submit();
		});
		$("#loginBtn").click(function(){
			$("form").attr("action","login");
			$("form").attr("method","get");
			$("form").submit();
		});
	});
</script>	
<jsp:include page="../footerBar.jsp" />
</body>
</html>