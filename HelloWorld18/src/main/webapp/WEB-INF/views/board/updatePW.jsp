<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Login</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="../../resources/images/icons/favicon.png"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../../resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
<!--===============================================================================================-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="animsition">
   
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
   
   <!-- Header -->
   <jsp:include page="../header.jsp"/>


   <!-- Title page -->
   <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../../resources/images/login_background_img.jpg');">
      <h2 class="ltext-105 cl0 txt-center" style="color: black">
         <br><br>
         PASSWORD CHECK
         <br><br>
      </h2>
   </section>   


   <!-- Content page -->
   <section class="bg0 p-t-104 p-b-116">
      <div class="container">
         <div class="flex-w flex-tr">
            <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
            
               <form action="/member/updatePW?id=${dto.id}">
                  <h4 class="mtext-105 cl2 txt-center p-b-30">
                     PASSWORD CHECK
                  </h4>
                  
                   <input type="hidden" value="${dto.id}" class="form-control" id="id" name="id"  placeholder="id" maxlength="30">
            <div class="form-group" id="oripassword">
                   <label for="inputPassword" class="col-lg-5 control-label">기존 패스워드</label>
                  <div class="bor8 m-b-20 how-pos4-parent input-group">
                          <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" id="oripw" type="text" name="oripw" placeholder="Your Password" maxlength="15">
                             <span class="input-group-btn">
                        <button type="button"id="pwcheck" class="btn bg3 cl0 size-121">확인</button>
                        </span>
                        </div>
            </div>
            
                  <div class="form-group" id="divPassword">
                     <label for="inputPassword" class="col-lg-5 control-label">새로운 패스워드</label>
                        <div class="bor8 m-b-20 how-pos4-parent">
                           <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" id="pw" type="password" name="pw" placeholder="New password" maxlength="15">
                        </div>
                  </div>
                  
                  <div class="form-group" id="divPasswordCheck">
                     <label for="inputPasswordCheck" class="col-lg-5 control-label">새로운 패스워드</label>
                        <div class="bor8 m-b-20 how-pos4-parent" >
                           <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" id="passwordCheck" type="password" placeholder="New password Check" maxlength="15">
                        </div>
                  </div>
                  <br>
                  <br>
   
               <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" type="submit">저장</button>
               <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" type="reset">초기화</button>
                  
               </form>
            </div>

            <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
               <div class="flex-w w-full p-b-42">
                  <span class="fs-18 cl5 txt-center size-211">
                     <span class="lnr lnr-map-marker"></span>
                  </span>

                  <div class="size-212 p-t-2">
                     <span class="mtext-110 cl2">
                        Address
                     </span>

                     <p class="stext-115 cl6 size-213 p-t-18">
                        ${info.address}
                     </p>
                  </div>
               </div>

               <div class="flex-w w-full p-b-42">
                  <span class="fs-18 cl5 txt-center size-211">
                     <span class="lnr lnr-phone-handset"></span>
                  </span>

                  <div class="size-212 p-t-2">
                     <span class="mtext-110 cl2">
                        Lets Talk
                     </span>

                     <p class="stext-115 cl1 size-213 p-t-18">
                        ${info.phone_number }
                     </p>
                  </div>
               </div>

               <div class="flex-w w-full">
                  <span class="fs-18 cl5 txt-center size-211">
                     <span class="lnr lnr-envelope"></span>
                  </span>

                  <div class="size-212 p-t-2">
                     <span class="mtext-110 cl2">
                        Sale Support
                     </span>

                     <p class="stext-115 cl1 size-213 p-t-18">
                        ${info.partnership_email}
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>   

   <jsp:include page="../footer.jsp"/>

   <!-- Back to top -->
   <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
         <i class="zmdi zmdi-chevron-up"></i>
      </span>
   </div>

<!--===============================================================================================-->   
   <script src="../../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="../../resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="../../resources/vendor/bootstrap/js/popper.js"></script>
   <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="../../resources/vendor/select2/select2.min.js"></script>
   <script>
      $(".js-select2").each(function(){
         $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
         });
      })
   </script>
<!--===============================================================================================-->
   <script src="../../resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
   <script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
   <script>
      $('.js-pscroll').each(function(){
         $(this).css('position','relative');
         $(this).css('overflow','hidden');
         var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
         });

         $(window).on('resize', function(){
            ps.update();
         })
      });
   </script>
   
   <script type="text/javascript">
   $(document).ready(function(){
      
       var modalContents = $(".modal-contents");
         var modal = $("#defaultModal");
         var pwck;
         
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
             var pw = $('#pw').val();
             var divPasswordCheck = $('#divPasswordCheck');
              
             if((passwordCheck=="") || (pw!=passwordCheck)){
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
             //alert(pm);
           //기존 패스워드
             if($('#oripw').val()==""){
                 modalContents.text("기존 패스워드를 입력하여 주시기 바랍니다.");
                 modal.modal('show');
                  
                 oripassword.removeClass("has-success");
                 oripassword.addClass("has-error");
                 $('#oripw').focus();
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
              if(!pwck){
                 modalContents.text("기존 패스워드를 확인해 주세요.");
                 modal.modal('show'); 
//                  alert("안맞음");
                 return false;
             } 
              
             
           //패스워드 비교
             if($('#pw').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                 modalContents.text("새로운 패스워드와 확인이 일치하지 않습니다.");
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
       $("#pwcheck").click(function(event) {
          var id = "${dto.id}"
          var oripw = $('#oripw').val();
          
       $.ajax({
                 async: true,
                 type : 'POST',
                 data : {id:id,oripw:oripw},
                 url : "/member/pwcheck",
                 success : function(data) {
                    pwck = data
                    if (!pwck) {
                       modalContents.text("기존 패스워드가 일치하지 않습니다.");
                         modal.modal('show');
                         return false;
               }else {
                  modalContents.text("기존 패스워드가 일치합니다.");
                        modal.modal('show');
               }
                 }
                 })
         });
       
   });
</script>   
<!--===============================================================================================-->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
   <script src="../../resources/js/map-custom.js"></script>
<!--===============================================================================================-->
   <script src="../../resources/js/main.js"></script>

</body>
</html>