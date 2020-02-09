
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
<title>Insert title here</title>
<style type="text/css">
#img {
   width: 100px;
   height: auto;
}

.X {
   float: left;
}

.wrap-num-product {
   float: left;
}

#amount {
   float: left;
   margin-right: 20px
}

.column-1 {
   width: 100px;
   text-align: center;
}

.column-3 {
   width: 100px;
}

.column-4 {
   width: 150px;
}

.colum-5 {
   width: 200px;
}

.a {
   text-align: center;
}
</style>
</head>
<body>
   <jsp:include page="header.jsp" />
   <div class="container">
      <div class="row">
         <table class="table table-hover">
            <thead id="thead">
               <tr>
                  <th class="a">이미지</th>
                  <th class="th">용량</th>
                  <th class="th">가격</th>
                  <th class="th">수량</th>
                  <th class="th">합계</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list}" var="list" varStatus="status">
                  <c:if test="${list.pno != 0 }">
                     <tr class="table_row">
                        <td class="column-1 th"><img id="img"
                           src='/displayFile?fileName=${pd[status.index].images[0] }'
                           alt="왜안나옴"><br> ${pd[status.index].eng_name }</td>
                        <td class="column-2 th">${list.volume }</td>
                        <td class="column-3 th">${list.price }</td>
                        <td class="column-4 th">
                           <form method="post">
                              <div class="wrap-num-product flex-w m-l-auto ">
                                 <a class="a">${list.amount }</a> 
                                 <input type="number" value="1" min="1" max="${list.amount }" name="amount"
                                    required autofocus>
                              </div>
                              <button class="X">X</button>
                              <input hidden="hidden" value="${list.pno }" name="pno">
                              <input type="hidden" value="${list.volume }" name="volume">
                           </form>
                        </td>
                        <td class="column-5 th">${list.amount*list.price}</td>
                     </tr>
                  </c:if>
               </c:forEach>
            </tbody>
            <tfoot>
               <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><a href="/order/checkout" class="btn btn-info">주문하기</a></td>
               </tr>
            </tfoot>
         </table>
      </div>
   </div>

   <jsp:include page="footer.jsp" />
   <script type="text/javascript">
      $(document).ready(function() {
         $(".X").click(function() {
            $("form").attr("action", "/shoppingCart/deleteShoppingCart");
            $("form").attr("method", "GET");
            $("Form").submit();
         });
      });
   </script>

</body>
</html>