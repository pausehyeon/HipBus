<!-- 주석 지현 -->

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

	//이메일 중복체크
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

		<!-- Join in -->
		<div class="w3-container w3-padding-128"
			style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
			  <h2><i class="fa fa-address-card w3-xxsmall"></i> &nbsp;Become a HipDriver</h2>
			</div>
			
			<form id="inputform" class="w3-container">
				<p>
					<label>Email</label>
					<input id="email" type="text" class="w3-input" onkeyup="verifyemail()">
					<div class="w3-text-blue w3-xsmall w3-right" id="emailresult">*이 주소로 가입인증 메일이 발송되므로 반드시 정확한 주소를 입력해주세요.</div>
				</p>
				<br>				
				<p>
					<label>Nick Name</label>
					<input class="w3-input" type="text">
					<div class="w3-text-red w3-xsmall w3-right">*이미 존재하는 닉네임입니다.</div>
				</p>
				<br><br>
				<p>
					<label>Password</label>
					<input class="w3-input" type="text">
					<div class="w3-text-blue w3-xsmall w3-right">*비밀번호는 숫자와 알파벳 5~10자리로 입력해주세요.</div>
				</p>
				<br>
				<p>
					<label>Password 확인</label>
					<input class="w3-input" type="text">
					<div class="w3-text-blue w3-xsmall w3-right">*확인을 위해 다시 한번 입력해주세요.</div>
				</p>
				<br><br>
				<div class="w3-center">
					<input type="submit" value="회원가입" class="w3-btn w3-padding w3-black w3-margin">				
				</div>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="footer.jsp"/>

</body>
</html>
