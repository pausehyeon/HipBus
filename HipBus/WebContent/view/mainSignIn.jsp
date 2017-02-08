<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>

<!-- SETTING 끝 -->

<title>HipBus - Welcome!</title>
<body onload="showDivs(1)">

	<%@ include file="navbar_main.jsp" %>

	<!-- Content -->
	<div class="w3-content"
		style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">

		<!-- Log in -->
		<div class="w3-container w3-padding-128"
			style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
			  <h2><i class="fa fa-address-card w3-xxsmall"></i> ${str_signLogin}</h2>
			</div>
			
			      <form class="w3-container" action="form.asp">
					<div class="w3-section">
					  <label><b>${str_userName}</b></label>
					  <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="usrname" required>
					  <label><b>${str_password}</b></label>
					  <input class="w3-input w3-border" type="text" placeholder="Enter Password" name="psw" required>
					  <button class="w3-btn-block w3-green w3-section w3-padding" type="submit">${btn_login}</button>
					  <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> ${str_rememberMe}</div>
			      </form>
			
			      <div class="w3-container w3-border-top w3-padding-16">
			        <span class="w3-right w3-padding w3-hide-small">${str_noMember}<a href="mainSignUp.do">${str_becomeMember}</a></span>
			      </div>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do"/>

</body>
</html>
