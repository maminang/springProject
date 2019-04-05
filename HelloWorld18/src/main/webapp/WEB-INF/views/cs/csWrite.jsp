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

<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}

.uploadedList li {
	list-style-type: none;
}
</style>

<title>Insert title here</title>

<!-- 질문하기 양식 유효성 검사 
	
	https://coding-factory.tistory.com/196
	https://intro0517.tistory.com/135
	
	자바스크립트로 구현하면 submit 눌렀을 때에만 동작하는 한계가 있는듯.
	모달과 제이쿼리 이용하는 것으로 변경
	https://hellogk.tistory.com/37
-->


</head>
<body>

<div class="container">
	<!-- 모달창 -->
	<div class="modal fade" id="defaultModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body">
					<p class="modal-contents"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!--// 모달창 -->
	
	
	<div class="floating">

		<a href="https://open.kakao.com/o/s5ZqXQib"> <img
			style="width: 50px; height: 50px" src="/resources/img/kakao.jpg">

		</a>

	</div>

	<jsp:include page="../headerBar.jsp" />



<form method="POST">
유저 목록 <p />
<!-- 모델에 추가된 현재 로그인한 SecurityUser 의 친구목록을 자동 checked 한다 -->
<!-- items의 userlist 는 전체 userlist이고 path의 user는 friendlist가 셋팅된 현재 로그인한 SecurityUser이다 -->

<input items="${userlist}" id="userlist" name="userlist" type="checkbox" value="openStatus">
<input type="submit" />
</form>


	<div class="container">
		<div class="row">
			<form name="ck" action="cs/csWrite" method="post">

				<div class="form-group">
					<label class="col-lg-2" for="quser">질문자 이름</label> <input required
						class="col-lg-10 onlyHangul" id="quser" name="quser">
				</div>


				<div class="form-group">
					<label class="col-lg-2 " for="qpassword">비밀번호</label> <input
						name="password" required type="password" class="col-lg-10 onlyAlphabetAndNumber"
						id="password" name="qpassword"> <br> <label
						class="col-lg-2" for="qpassword">비밀번호확인</label> <input
						name="checkpw" required type="password" id="divPassword" class="col-lg-10 onlyAlphabetAndNumber"
						 name="qpassword"><br>
				</div>


				<div class="form-group">
					<label for="title" class="col-lg-2">질문 제목</label> <input
						class="col-lg-10" required id="qtitle" name="qtitle"><br>
				</div>
				<br>

				<div class="form-group" >
					<label class="col-lg-2" for="inputEmail">이메일</label> <input
						name="email" type="email" class="col-lg-10 email" id="email"
						data-rule-required="true" id="email"  maxlength="40"><br>
						선택 입력: 이메일을 적어주시면 답변완료되었을 때 이메일로 알려드립니다.
				</div>

				<div class="form-group" id="divPhoneNumber">
					<label class="col-lg-2" for="inputPhoneNumber">휴대폰 번호</label> <input
						name="phone" type="tel" class="col-lg-10 divPhoneNumber"
						id="phoneNumber" data-rule-required="true"
						 maxlength="11"><br>
						 선택 입력: -를 제외하고 숫자만 입력하세요. 휴대폰 번호를 적어주시면 답변완료되었을 때 sms로 알려드립니다.
				</div>
				

				<div class="form-group">
					<label for="qtype" class="col-lg-2">질문 유형</label> <select
						class="col-lg-10">
						<option value="type1">사이즈추천/상품문의</option>
						<option value="type2">주문/결제/입금확인</option>
						<option value="type3">배송관련문의</option>
						<option value="type4">교환/반품문의</option>
						<option value="type5">배송전 변경/취소/직거래</option>
						<option value="type6">적립금/쿠폰/회원관련</option>
						<option value="type7">배송문의/해외배송신청 및 문의</option>
						<option value="type8">마이페이지</option>
						<option value="type9">쇼핑 가이드</option>
						<option value="type10">기타</option>
					</select>
				</div>
				<br>

				<div class="form-group">
					<label for="open">질문 공개여부 </label> <br> <input type="checkbox"
						name="openStatus" value="openStatus"> <br>
				</div>

				<label for="title">질문 내용 </label>
				<textarea class="form-control" rows="8" style="resize: none">최대한 상세히 적어주세요</textarea>



				<div class="form-group">
					<label>업로드할 파일을 드랍시키세요.</label>
				</div>

				
			</form>
			<div class="fileDrop"></div>
			
			<br>
			<div class="form-group">
					<div>
						<button style=" margin: auto;  width: 50%; text-align:center;" type="submit" class="btn btn-default">등록</button>
					</div>
				</div>
		</div>
	</div>

	<!-- 
	정상등록되면 이메일 발송하도록 구현
	https://m.blog.naver.com/PostView.nhn?blogId=racoon_z&logNo=220695568817&proxyReferer=https%3A%2F%2Fwww.google.com%2F
	https://offbyone.tistory.com/167
	 -->

	<form style="display: none;" action="send" method="post">
		<input type="email" name="receiver" placeholder="abc@abc.com"><br>
		<input type="text" name="subject"><br> 글 내용 :
		<textarea rows="5" cols="30" name="content"></textarea>
		<p>
			<input type="submit" value="메일 보내기">
	</form>



	<script type="text/javascript">
	 $(function(){
         //모달을 전역변수로 선언
         var modalContents = $(".modal-contents");
         var modal = $("#defaultModal");
          
         $('.onlyAlphabetAndNumber').keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
             }
         });
          
         $(".onlyHangul").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
             }
         });
      
         $(".onlyNumber").keyup(function(event){
             if (!(event.keyCode >=37 && event.keyCode<=40)) {
                 var inputVal = $(this).val();
                 $(this).val(inputVal.replace(/[^0-9]/gi,''));
             }
         });
          
         //------- 검사하여 상태를 class에 적용
         $('#id').keyup(function(event){
              
             var divId = $('#divId');
              
             if($('#id').val()==""){
                 divId.removeClass("has-success");
                 divId.addClass("has-error");
             }else{
                 divId.removeClass("has-error");
                 divId.addClass("has-success");
             }
         });
          
         $('#password').keyup(function(event){
              
             var divPassword = $('#divPassword');
              
             if($('#password').val()==""){
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
             }else{
                 divPassword.removeClass("has-error");
                 divPassword.addClass("has-success");
             }
         });
          
         $('#passwordCheck').keyup(function(event){
              
             var passwordCheck = $('#passwordCheck').val();
             var password = $('#password').val();
             var divPasswordCheck = $('#divPasswordCheck');
              
             if((passwordCheck=="") || (password!=passwordCheck)){
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
         });
          
         $('#name').keyup(function(event){
              
             var divName = $('#divName');
              
             if($.trim($('#name').val())==""){
                 divName.removeClass("has-success");
                 divName.addClass("has-error");
             }else{
                 divName.removeClass("has-error");
                 divName.addClass("has-success");
             }
         });
          
         $('#nickname').keyup(function(event){
              
             var divNickname = $('#divNickname');
              
             if($.trim($('#nickname').val())==""){
                 divNickname.removeClass("has-success");
                 divNickname.addClass("has-error");
             }else{
                 divNickname.removeClass("has-error");
                 divNickname.addClass("has-success");
             }
         });
          
         $('#email').keyup(function(event){
              
             var divEmail = $('#divEmail');
              
             if($.trim($('#email').val())==""){
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
             }else{
                 divEmail.removeClass("has-error");
                 divEmail.addClass("has-success");
             }
         });
          
         $('#phoneNumber').keyup(function(event){
              
             var divPhoneNumber = $('#divPhoneNumber');
              
             if($.trim($('#phoneNumber').val())==""){
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
         });
         
       //------- validation 검사
         $( "form" ).submit(function( event ) {
              
             var provision = $('#provision');
             var memberInfo = $('#memberInfo');
             var divId = $('#divId');
             var divPassword = $('#divPassword');
             var divPasswordCheck = $('#divPasswordCheck');
             var divName = $('#divName');
             var divNickname = $('#divNickname');
             var divEmail = $('#divEmail');
             var divPhoneNumber = $('#divPhoneNumber');
              
             //회원가입약관
             if($('#provisionYn:checked').val()=="N"){
                 modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                 modal.modal('show'); //모달 띄우기
                  
                 provision.removeClass("has-success");
                 provision.addClass("has-error");
                 $('#provisionYn').focus();
                 return false;
             }else{
                 provision.removeClass("has-error");
                 provision.addClass("has-success");
             }
              
             //개인정보취급방침
             if($('#memberInfoYn:checked').val()=="N"){
                 modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 memberInfo.removeClass("has-success");
                 memberInfo.addClass("has-error");
                 $('#memberInfoYn').focus();
                 return false;
             }else{
                 memberInfo.removeClass("has-error");
                 memberInfo.addClass("has-success");
             }
              
             //아이디 검사
             if($('#id').val()==""){
                 modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divId.removeClass("has-success");
                 divId.addClass("has-error");
                 $('#id').focus();
                 return false;
             }else{
                 divId.removeClass("has-error");
                 divId.addClass("has-success");
             }
              
             //패스워드 검사
             if($('#password').val()==""){
                 modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
                 $('#password').focus();
                 return false;
             }else{
                 divPassword.removeClass("has-error");
                 divPassword.addClass("has-success");
             }
              
             //패스워드 확인
             if($('#passwordCheck').val()==""){
                 modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
                 $('#passwordCheck').focus();
                 return false;
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
              
             //패스워드 비교
             if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                 modalContents.text("패스워드가 일치하지 않습니다.");
                 modal.modal('show');
                  
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
                 $('#passwordCheck').focus();
                 return false;
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
              
             //이름
             if($('#name').val()==""){
                 modalContents.text("이름을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divName.removeClass("has-success");
                 divName.addClass("has-error");
                 $('#name').focus();
                 return false;
             }else{
                 divName.removeClass("has-error");
                 divName.addClass("has-success");
             }
              
             //이메일
             if($('#email').val()==""){
                 modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
                 $('#email').focus();
                 return false;
             }else{
                 divEmail.removeClass("has-error");
                 divEmail.addClass("has-success");
             }
              
             //휴대폰 번호
             if($('#phoneNumber').val()==""){
                 modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
                 $('#phoneNumber').focus();
                 return false;
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
              
          
         });
          
     });
	</script>

	<jsp:include page="../footerBar.jsp" />



	<script id="source" type="text/x-handlebars-template">
<li class="col-xs-3">
<span>
	<img src="{{imgsrc}}">
	<!-- 핸들바스 마크업 작업 -->
</span>
<div>
	<a target="{{target}}" href="{{getLink}}">{{fileName}}</a>
	<a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></a>
</div>
</li>
</script>


	<script id="source" type="text/x-handlebars-template">
<li class="col-xs-3">
<span>
	<img src="{{imgsrc}}">
	<!-- 핸들바스 마크업 작업 -->
</span>
<div>
	<a target="{{target}}" href="{{getLink}}">{{fileName}}</a>
	<a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}"><span class="glyphicon glyphicon-remove"></span></a>
</div>
</li>
</script>



	<script type="text/javascript">
	
	var source=$("#source").html();
	var template =Handlebars.compile(source);
	
	$(document).ready(function(){
		
		$(".uploadedList").on("click", ".delbtn", function(event){
			event.preventDefault();
			var $delBtn=$(this);
			var $delLi=$(this).parent("div").parent("li");
			/* 제이쿼리에서 변수에 $ 있으면 엘리먼트를 뜻함 */
			
			
			$.ajax({
				url:"/deletefile",
				type:"post",
				/* 일반컨트롤러 어노테이션을 받았기 때문에 type에 post와 get밖에 넘겨받을 수 없다. */
				data:{
					fileName:$delBtn.attr("href")
				},
				dataType:"text",
				success:function(result){
					$delLi.remove();
				}
			
				
			})
			
			/*더 공부하기 [JavaScript] 이벤트 핸들러 종류 */
		});
		
		
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop",function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file=files[0];
			
			var formData=new FormData();
			formData.append("file",file);
			
			$.ajax({
				url:"/uploadAjax",
				type:"post",
				data:formData,
				dataType: "text",
				processData: false,
				contentType: false,
				success:function(data){
					alert(data);
					alert(data.target);
					/* upload.js에서 선언한 함수 호출하여 사용  */
					var result = getFileInfo(data);
					
					$(".uploadedList").append(template(result));
				}
			});
		
		});
		
		$("button[type='submit']").click(function(){
			
			event.preventDefault();
			var $form=$("form");
			var str="";
			
			$(".delbtn").each(function(index){
				str+="<input name='files["+index+"]' value='"+$(this).attr("href")+"' type='hidden'/>";
			});
			$form.append(str);
			$form.get(0).submit();
			
			//$("form").submit();
			
			/* alert("zzzz"); */
			/* $("#a")
			$("#c")
			$(".btn z")
			$("button[type='submit']")
			$("input[type='text']) */
		})
	});
</script>
</div>

</body>
</html>