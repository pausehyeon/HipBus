<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>

<title>${str_mybusTitle}</title>
<script type="text/javascript">
//<!--
	//닉네임 중복체크
	function verifynick(){		
		var params = "nick=" + $('input[name="nick"]').val();			
		var request = new Request(function() {			
			if(request.httpRequest.readyState == 4){
				if(request.httpRequest.status == 200){
					if(request.httpRequest.responseText.trim() == "0"){
						$('#nickresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_userNameOk}");	
					}else{
						$('#nickresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_userNameNo}");	
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
					$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwordError1}");
				}else if( $(this).val().length<5 ){
					//길이가 짧은 경우
					var minlength = 5; 
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text('*'+minlength+"${str_passswordError2}");
				}else if( $(this).val().length>10 ){
					//길이가 너무 긴 경우
					var maxlength = 10;
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_passwordError3}"+maxlength+"${str_passwordError4}");
					$(this).val( $(this).val().substring(0, maxlength) );
				}else{
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_passwordOk}");					
				}
			}else{
			//숫자인 경우
				$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwordError5}");
			}
		});
		
		//비밀번호 확인
		$('input[name="repasswd"]').keyup(function(){
			if( $(this).val() == $('input[name="passwd"]').val() ){
				$('#repasswdresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_passwordCheckOk}");
			}else{
				$('#repasswdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwordCheckNo}");
			}			
		});

	});
//-->
</script>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h2>
							<i class="fa fa-pencil"></i>&nbsp; 회원 정보 수정
						</h2>
					</div>
					<div class="w3-content w3-padding-64">
						<h5>
							<i class="fa fa-pencil"></i><b> 기본 정보 수정 </b>
						</h5>

						<form id="inputform" enctype="multipart/form-data" action="myBusEditPro.do?driver=${driver}" method="post" class="w3-container">
							<p>
								<label>Profile Picture</label>
							<div class="w3-row-padding">
								<c:if test="${member.imglocation eq null}">
								<div class="w3-col m4 w3-center">
									<img src="${project}/view/img/HipBusLogo_pale_sq.png" class="w3-circle" width="100%" alt="Avatar">
								</div>
								</c:if>
								<c:if test="${member.imglocation ne null}">
								<div class="w3-col m4 w3-center">
									<img src="${project}/hipbusSave/${member.imglocation}" class="w3-circle" width="100%" alt="Avatar">
								</div>
								</c:if>
								<div class="w3-col m8">
									<br><br>
									<input name="upload" class="w3-input" type="file">
								</div>
							</div>
							<div class="w3-text-red w3-small w3-right"></div>
							</p>
							<br> <br>

							<p>
								<label>${str_userName}</label>
								<input name="nick" value="${member.nick}" class="w3-input" type="text" onkeyup="verifynick()">
							<div class="w3-text-red w3-small w3-right" id="nickresult">${str_signUpUserName}</div>
							</p>
							<br> <br>
							<p>
								<label>${str_password}</label>
								<input name="passwd" value="${member.passwd}" class="w3-input" type="password">
							<div class="w3-text-blue w3-small w3-right" id="passwdresult">${str_signUpPassword}</div>
							</p>
							<br>
							<p>
								<label>${str_passwordCheck}</label>
								<input name="repasswd" value="${member.passwd}" class="w3-input" type="password">
							<div class="w3-text-blue w3-small w3-right" id="repasswdresult">${str_signUpPasswordCheck}</div>
							</p>
							<br><br>
							<p>
								<label>Youtube 채널 아이디</label>
								<a class="w3-right w3-small"> <i class="fa fa-question-circle"></i> 채널 아이디 확인하는 방법 </a>
								<input name="channel_id" class="w3-input" type="text">
							</p>
							<br><br>
							<div class="w3-center">
								<input type="submit" value="수정 완료" class="w3-btn w3-padding w3-black w3-margin">
							</div>
						</form>
					</div>

					<hr>
					<div class="w3-content w3-padding-64">
						<h5>
							<i class="fa fa-hashtag"></i><b> Tags 수정 </b>
						</h5>
						<div class="w3-row">
							<div class="w3-quarter">
								<input id="tag" type="text" class="w3-input">
							</div>
							<div class="w3-rest w3-left-align">
								<span class="w3-badge w3-margin-left w3-large"> + </span>
							</div>
						</div>
						<p>
							<span class="w3-tag w3-margin-top w3-padding w3-theme-l5">#빈지노<a class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme-l4">#언프리티_랩_스타<a
									class="w3-closebtn w3-tiny w3-margin-left"
								>X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme-l3">#믹스테잎<a class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme-l2">#랩<a
									class="w3-closebtn w3-tiny w3-margin-left"
								>X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme-l1">#빈지노<a class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme">#언프리티_랩_스타<a
									class="w3-closebtn w3-tiny w3-margin-left"
								>X</a></span> <span class="w3-tag w3-margin-top w3-padding w3-theme-l5">#믹스테잎<a class="w3-closebtn w3-tiny w3-margin-left">X</a></span>
						</p>
					</div>
					<!-- 회원탈퇴 -->
					<hr>
					<div class="w3-content w3-padding-64">
						<h5>
							<i class="fa fa-sign-out"></i><b> 사이트 탈퇴</b>
						</h5>

						<p class="w3-responsive">
							<i class="fa fa-check"></i> 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br> 탈퇴 후 사이트에 게시한 내용을 수정/삭제 할 수 없습니다.
						</p>
						<form id="signoutform" class="w3-container" action="myBusDeletePro.do" method="post">
							<p>
								<label>Password</label>
								<input name="passwd" class="w3-input" type="password">
							</p>
							<br> <br>
							<input class="w3-check" type="checkbox">
							<label class="w3-validate">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
							<p class="w3-center">
								<button type="submit" class="w3-btn w3-hover-teal">탈퇴</button>
							</p>
						</form>
					</div>
				</div>
				<!-- 여기까지 -->
				<!-- End Middle Column -->

			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
