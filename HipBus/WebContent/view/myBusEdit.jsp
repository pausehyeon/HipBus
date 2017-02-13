<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>${str_mybusTitle}</title>
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
			<c:import url="../myBusLeft.do"></c:import>
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

						<form id="inputform" enctype="multipart/form-data" action="myBusEditPro.do" method="post" class="w3-container">
							<p>
								<label>Profile Picture</label>
							<div class="w3-row">
								<div class="w3-quarter w3-center">
									<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle" style="height: 106px; width: 106px" alt="Avatar">
								</div>
								<div class="w3-rest">
									<a class="w3-input w3-right-align">
										HipBusLogo_colored_sq.png(기존 파일명) &nbsp;&nbsp;<i class="fa fa-download"></i>
									</a>
									<input name="upload" class="w3-input" type="file">
								</div>
							</div>
							<div class="w3-text-red w3-xsmall w3-right">*파일 형식에 맞지 않습니다.</div>
							</p>
							<br> <br>

							<p>
								<label>Nick Name</label>
								<input class="w3-input" type="text">
							<div class="w3-text-red w3-xsmall w3-right">*이미 존재하는 닉네임입니다.</div>
							</p>
							<br> <br>
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
							<br> <br>
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
						<form id="signoutform" class="w3-container">
							<p>
								<label>Password</label>
								<input class="w3-input" type="text">
							</p>
							<br> <br>
							<input class="w3-check" type="checkbox">
							<label class="w3-validate">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
							<p class="w3-center">
								<button class="w3-btn w3-hover-teal">탈퇴</button>
							</p>
						</form>
					</div>
				</div>
				<!-- 여기까지 -->
				<!-- End Middle Column -->

			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
