<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<!-- login 모달 창 -->
<div id="login" class="w3-modal">
	<div class="w3-modal-content w3-card-8 w3-animate-zoom"
		style="max-width: 600px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('login').style.display='none'"
				class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright"
				title="Close Modal">×</span>
		</div>

		<form class="w3-container" action="form.asp">
			<div class="w3-section">
				<label><b>${str_signInUserName}</b></label> <input
					class="w3-input w3-border w3-margin-bottom" type="text"
					placeholder="Enter Username" name="usrname" required> <label><b>${str_signInPassword}</b></label>
				<input class="w3-input w3-border" type="text"
					placeholder="Enter Password" name="psw" required>
				<button class="w3-btn-block w3-green w3-section w3-padding"
					type="submit">${str_signIn}</button>
				<input class="w3-check w3-margin-top" type="checkbox"
					checked="checked"> ${str_signInRememberMe}
			</div>
		</form>

		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<span class="w3-right w3-padding w3-hide-small w3-tiny">${str_signInNotMember}<a
				href="mainSignUp.do">${str_signInBecomeMember}</a>
				<br>${str_signInPasswordSearchMent}<a href="mainForgot.do">${str_signInPasswordSearchMent}</a>
			</span>
			<button
				onclick="document.getElementById('login').style.display='none'"
				type="button" class="w3-btn w3-red">${str_signInCancel}</button>
		</div>

	</div>
</div>
<!-- login 모달 창 끝 -->
</html>