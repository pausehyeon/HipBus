<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<!-- SETTING 끝 -->


<script type="text/javascript">
//<!--
	//이메일 중복체크
	function verifyemail(){
 		var params = "email=" + inputform.email.value;
		var request = new Request(function(){
			
			if(request.httpRequest.readyState == 4){
				if(request.httpRequest.status == 200){
					if(request.httpRequest.responseText.trim() == "0"){
						$('#emailresult').removeClass('w3-text-red').addClass('w3-text-blue').text(${str_emailOk});	
					}else{
						$('#emailresult').removeClass('w3-text-blue').addClass('w3-text-red').text(${str_emailNo});	
					}
				}else{
					$('#emailresult').text(request.httpRequest.status+"오류");	
				}
			}else{
				console.log( "통신중..." );
			}			
		}, "verifyEmailResult.do", "POST", params);
		request.sendRequest();
	}
		
	//닉네임 중복체크
	function verifynick(){
		var params = "nick=" + $('input[name="nick"]').val();
		var request = new Request(function() {
			if(request.httpRequest.readyState == 4){
				if(request.httpRequest.status == 200){
					if(request.httpRequest.responseText.trim() == "0"){
						$('#nickresult').removeClass('w3-text-red').addClass('w3-text-blue').text(${str_userNameOk});	
					}else{
						$('#nickresult').removeClass('w3-text-blue').addClass('w3-text-red').text(${str_userNameNo});	
					}
				}else{
					$('#nickresult').text('오류');
				}
			}else{
				console.log( "통신중..." );
			}	
		}, "verifyNickResult.do", "POST", params);
		request.sendRequest();
	}
	
	
	$(document).ready(function(){
		//이메일 길이 제한
		$('input[name="nick"]').keyup(function(){
			var maxlength = 5;
			if( $(this).val().length > maxlength){
				$('#nickresult').addClass('w3-text-red').text(maxlength+${str_emailLength});
				$(this).val( $(this).val().substring(0,maxlength) );
			}
		});
		
		//비밀번호 제한 : 반드시 숫자와 알파벳을 조합해야하며 길이가 5글자 이상, 10글자 이하여야.
		$('input[name="passwd"]').keyup(function(){
			if( isNaN( Number( $(this).val() ) ) ){
			//숫자가 아닌 경우
				//숫자가 아니면서 숫자가 하나도 없는 경우
				var containsNumber = false;
				for(var i=0; i<10; i++){
					if( $(this).val().indexOf(i) != -1)	containsNumber = true;
				}
				if(containsNumber == false){
					$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text(${str_passwordError1});
				}else if( $(this).val().length<5 ){
					//길이가 짧은 경우
					var minlength = 5; 
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text('*'+minlength+${str_passswordError2});
				}else if( $(this).val().length>10 ){
					//길이가 너무 긴 경우
					var maxlength = 10;
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text(${str_passwordError3}+maxlength+${str_passwordError4});
					$(this).val( $(this).val().substring(0, maxlength) );
				}else{
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text(${str_passwordOk});					
				}
			}else{
			//숫자인 경우
				$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text(${str_passwordError5});
			}
		});
		
		//비밀번호 확인
		$('input[name="repasswd"]').keyup(function(){
			if( $(this).val() == $('input[name="passwd"]').val() ){
				$('#repasswdresult').removeClass('w3-text-red').addClass('w3-text-blue').text(${str_passwordCheckOk});
			}else{
				$('#repasswdresult').removeClass('w3-text-blue').addClass('w3-text-red').text(${str_passwordCheckNo});
			}			
		});

	});
//-->
</script>

<title>HipBus - Welcome!</title>
<body>

	<%@ include file="navbar_main.jsp"%>


	<!-- Content -->

	<div class="w3-content" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">

		<!-- Join in -->
		<div class="w3-container w3-padding-128" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<div class="w3-container w3-center w3-black">
				<h2>
					<i class="fa fa-address-card w3-xxsmall"></i> ${str_becomeMember}
				</h2>
			</div>

			<form id="inputform" class="w3-container" method="post" action="mainSignUpPro.do">
				<p>
					<label>${str_email}</label>
					<input id="email" name="email" type="text" class="w3-input" onkeyup="verifyemail()">
				<div class="w3-text-blue w3-xsmall w3-right" id="emailresult">${str_signUpEmail}</div>
				</p>
				<br>
				<p>
					<label>${str_userName}</label>
					<input name="nick" class="w3-input" type="text" onkeyup="verifynick()">
				<div class="w3-text-blue w3-xsmall w3-right" id="nickresult">${str_signUpUserName}</div>
				</p>
				<br>
				<br>
				<p>
					<label>${str_password}</label>
					<input name="passwd" class="w3-input" type="password">
				<div class="w3-text-blue w3-xsmall w3-right" id="passwdresult">${str_signUpPassword}</div>
				</p>
				<br>
				<p>
					<label>${str_passwordCheck}</label>
					<input name="repasswd" class="w3-input" type="password">
				<div class="w3-text-blue w3-xsmall w3-right" id="repasswdresult">${str_signUpPasswordCheck}</div>
				</p>
				<br>
				<br>				
				<div class="w3-center">
					<input type="submit" value="회원가입" class="w3-btn w3-padding w3-black w3-margin">
				</div>				
			</form>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
