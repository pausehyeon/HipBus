<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<!-- SETTING 끝 -->

<script type="text/javascript">
//<!--
	var request = null;

	//이메일 체크
	function verifyemail(){
 		var params = "id=" + inputform.email.value;
		request = new Request(verifyemailresult, "verifyEmail.do", "POST", params);
		request.sendRequest();
	}
	
	function verifyemailresult(){
		var emailresult = document.getElementById("emailresult");
		
		if(request.httpRequest.readyState == 4){
			if(request.httpRequest.status == 200){
				emailresult.innerHTML = "정상종료 : "+request.httpRequest.responseText;
			}else{
				emailresult.innerHTML = request.httpRequest.status + "오류";				
			}
		}else{
			emailresult.innerHTML = "통신중...";
		}
			
	}
	
//-->
</script>

<title>HipBus - Welcome!</title>
<body onload="showDivs(1)">

	<%@ include file="navbar_main.jsp" %>
	

	<!-- Content -->
	
	<div class="w3-content"
		style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">

		<!-- 비밀번호 입력 -->
		<div class="w3-container w3-padding-128"
			style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
			  <h2><i class="fa fa-question-circle w3-xxsmall"></i> &nbsp;비밀번호 찾기 </h2>
			</div>
			
			<form action="mainForgotPro.do" id="inputform" class="w3-container">
				<p>
					<label>Email</label>
					<input id="email" type="text" class="w3-input" onkeyup="verifyemail()">
					<div class="w3-text-blue w3-xsmall w3-right" id="emailresult">* 가입되어 있지 않은 이메일입니다.</div>
				</p>
				<br>				
				<div class="w3-center">
					<input type="submit" value="새 비밀번호 전송" class="w3-btn w3-padding w3-black w3-margin">				
				</div>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="footer.jsp"/>

</body>
</html>