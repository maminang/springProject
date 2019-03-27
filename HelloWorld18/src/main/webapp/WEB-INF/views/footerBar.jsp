<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="page-footer" style="background-color: white">
	<div id="footerInfo">
		
	</div>
</div>
<script id="footerSource" type="text/x-handlebars-template">
		{{companyname}}<br>
		{{representative}}<br>
		{{bsns_reg_no}}<br>
		{{cmnct_saler_report}}<br>
		{{address}}<br>
		{{partnership_email}}<br>
		{{phone_number}}<br>
		{{work_hour}}<br>
		{{account_holder}}<br>
		{{facebook_address}}<br>
		{{kakaotalk_address}}<br>
		{{instagram_address}}<br>
		{{copyright}}<br>
</script>
<script type="text/javascript">
		getMenu();
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