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
	<jsp:include page="../headerBar.jsp"/>
	<div class="container">
		<div class="row">
		</div>
	</div>
	
<script type="text/javascript">
	$(document).ready(function(){
		if (${login==null}) {
			alert("비밀번호 확인 후 다시 로그인해주세요")
			self.location="/member/login";
		} else {
			self.location="/"
		}
	});
</script>	
</body>
</html>