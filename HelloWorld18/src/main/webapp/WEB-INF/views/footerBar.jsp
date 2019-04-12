<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.footerDiv {
	border: 1px solid #e6e6e6;
}

.footerText{
	margin-left: 10px;
	margin-right: 10px;
}

</style>
<div class="page-footer"id="footerInfo">
</div>
<script id="footerSource" type="text/x-handlebars-template">
	<div class="col-xs-12 col-sm-4 footerDiv">
		<p class="footerText">회사명 : {{companyname}}</p>
		<p class="footerText">대표 : {{representative}}</p>
		<p class="footerText">사업자 등록번호 : {{bsns_reg_no}}</p>
		<p class="footerText">통신판매업신고 : {{cmnct_saler_report}}</p>
		<p class="footerText">주소 : {{address}}</p>
		<p class="footerText">제휴 : {{partnership_email}}</p>
</div>
<div class="col-xs-12 col-sm-8 footerDiv">
		<p class="footerText">고객지원 센터 : {{phone_number}}</p>
		<p class="footerText">업무시간 : {{work_hour}}</p>
		<p class="footerText">예금주 : {{account_holder}}</p>
		<p class="footerText">따봉링크 : {{facebook_address}}</p>
		<p class="footerText">카카오톡링크 : {{kakaotalk_address}}</p>
		<p class="footerText">인스타 링크 : {{instagram_address}}</p>
</div>
<div class="row footerDiv"><p class="footerText">{{copyright}}</p></div>
</script>
<script type="text/javascript">
	getFooterInfo()

	function getFooterInfo() {
		$.getJSON("/footerInfo", function(data) {
			var source = $("#footerSource").html();
			var template = Handlebars.compile(source)

			$("#footerInfo").html(template(data));
			alert
		})
	}
</script>