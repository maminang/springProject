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

<!-- modal -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
<!--// modal -->
	<form action="/member/updatePW?id=${dto.id}&pw=${dto.pw}">
	
                <input type="hidden" value="${dto.id }" class="form-control" id="id" name="id"  placeholder="id" maxlength="30">
			<div class="form-group" id="OridivPassword">
                <label for="inputPassword" class="col-lg-2 control-label">기존 패스워드 입력</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="oripassword" name="oripw"  placeholder="패스워드" maxlength="30">
                </div>
            </div>
	 		<div class="form-group" id="divPassword">
                <label for="inputPassword" class="col-lg-2 control-label">새로운 패스워드 입력</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="pw" name="pw" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPasswordCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">새로운 패스워드 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                </div>
            </div>
            
            <button type="submit">저장</button>
            <button type="reset">초기화</button>
	</form>
	
<script type="text/javascript">
	$(document).ready(function(){
		
		 var modalContents = $(".modal-contents");
         var modal = $("#defaultModal");
         
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
		 
		 $( "form" ).submit(function( event ) {
             
             var divPassword = $('#divPassword');
             var divPasswordCheck = $('#divPasswordCheck');
             var oripassword = $('#oripassword');
             var pw = "${dto.pw}";
             
           //기존 패스워드
             if($('#oripassword').val()==""){
                 modalContents.text("기존 패스워드를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 oripassword.removeClass("has-success");
                 oripassword.addClass("has-error");
                 $('#oripassword').focus();
                 return false;
             }else{
            	 oripassword.removeClass("has-error");
            	 oripassword.addClass("has-success");
             }
             
             //패스워드 검사
             if($('#pw').val()==""){
                 modalContents.text("변경된 패스워드를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
                 $('#pw').focus();
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
              
             //기존 패스워드 비교
//              if($('#oripassword').val()!=pw){
//                  modalContents.text("기존 패스워드가 일치하지 않습니다.");
//                  modal.modal('show');
//                  return false;
//              }
             
           //패스워드 비교
             if($('#pw').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
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
	});
		 
	});
</script>	
</body>
</html>