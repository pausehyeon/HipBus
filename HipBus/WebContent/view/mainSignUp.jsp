<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="${project}/scripts/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<!-- SETTING 끝 -->

<!-- jQuery Validation Plugin -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>

<title>HipBus - Welcome!</title>
<body onload="becomeformvalidate()">

	<%@ include file="navbar_main.jsp"%>

	<!-- Content -->
	<div class="w3-content" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">

		<!-- Join in -->
		<div class="w3-container w3-padding-128" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
				<h2>
					<i class="fa fa-address-card w3-xxsmall"></i> ${str_topContent2}
				</h2>
			</div>

			<div class="w3-row-padding">
				<form id="inputform" class="w3-container" method="post" action="mainSignUpPro.do">
					<div class="w3-col m12 w3-margin-top w3-margin-bottom">
						<label>${str_email}</label>
						<!--  onkeyup="verifyemail()"  -->
						<input id="email" name="email" type="text" class="w3-input" required="required">
					</div>
					<div class="w3-col m12 w3-margin-top w3-margin-bottom">
						<label>${str_userName}</label>
						<!-- onkeyup="verifynick()"  -->
						<input name="nick" class="w3-input" type="text" required="required">
					</div>
					<div class="w3-col m12 w3-margin-top w3-margin-bottom">
						<label>${str_password}</label>
						<input name="passwd" id="passwd" class="w3-input" type="password" required="required">
					</div>
					<div class="w3-col m12 w3-margin-top w3-margin-bottom">
						<label>${str_passwordCheck}</label>
						<input name="repasswd" class="w3-input" type="password" required="required">
					</div>
					<div class="w3-col m12 w3-margin-top w3-margin-bottom w3-center">
						<input type="submit" value="회원가입" class="w3-btn w3-padding w3-black w3-margin">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
