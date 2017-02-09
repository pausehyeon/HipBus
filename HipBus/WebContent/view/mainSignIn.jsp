<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<!-- SETTING 끝 -->

<title>HipBus - Welcome!</title>
<body>
	<!-- navigation -->
	<%@ include file="navbar_main.jsp"%>

	<!-- Content -->
	<div class="w3-content" style="max-width: 500px; margin-top: 0px; margin-bottom: 80px">

		<!-- Sign in -->
		<div class="w3-container w3-padding-64 w3-margin-top">
			<div class="w3-container w3-center w3-black">
				<h2>
					<i class="fa fa-address-card w3-xxsmall"></i> &nbsp; ${str_signIn}
				</h2>
			</div>

			<div class="w3-section">
				<form method="Post" action="signInPro.do" class="w3-container">
					<label><b>${str_signInUserName}</b></label>
					<input name="email" type="text" placeholder="Enter Username" name="usrname" required class="w3-input w3-border w3-margin-bottom">
					<label><b>${str_signInPassword}</b></label>
					<input name="passwd" type="password" placeholder="Enter Password" name="psw" required class="w3-input w3-border">
					<input name="rememberMe" type="checkbox" value="1" checked="checked" class="w3-check w3-margin-top">
					${str_signInRememberMe}
					<input type="submit" value="${str_signIn}" class="w3-btn-block w3-green w3-section w3-padding">
				</form>
			</div>

			<div class="w3-container w3-border-top w3-padding-16">
				<span class="w3-right w3-padding w3-hide-small">${str_signInNotMember}<a href="mainSignUp.do">${str_signInBecomeMember}</a></span>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
