<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="${project}/scripts/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/HipBus/scripts/mainScript.js"></script>

<!-- jQuery Validation Plugin -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>
<!-- SETTING 끝 -->

<title>HipBus - Welcome!</title>
<body onload="forgotformvalidate()">

	<%@ include file="navbar_main.jsp" %>
	

	<!-- Content -->
	
	<div class="w3-content" style="max-width: 1100px;margin-top:0px;margin-bottom: 80px">
	<div class="w3-row w3-container w3-padding-64">
		<!-- 여백 -->
	</div>

		<!-- 비밀번호 입력 -->
		<div class="w3-container w3-padding-128"
			style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
			  <h2><i class="fa fa-question-circle w3-xxsmall"></i>${str_searchPassword} </h2>
			</div>
			
			<form name="forgotform" action="mainForgotPro.do" id="inputform" class="w3-container">
				<div class="w3-row w3-container w3-padding-64">
					<p>
						<label>Email</label>
						<input name="email" type="text" class="w3-input">
					</p>
				</div>
				<input type="hidden" name="num" value="1">				
				<div class="w3-center">
					<input type="submit" value="${str_newPasswordSend}" class="w3-btn w3-padding w3-black w3-margin">				
				</div>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do"/>

</body>
</html>