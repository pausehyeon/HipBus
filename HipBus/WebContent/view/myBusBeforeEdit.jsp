<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>HipBus - My Bus</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="../top.do"/>


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
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h2>
							<i class="fa fa-pencil"></i>&nbsp; 회원 정보 수정
						</h2>
					</div>
					<div class="w3-content w3-padding-64">
						<h5>
							<b> * 정보 수정을 위해 비밀번호를 다시 한번 입력해주세요. </b>
						</h5>

						<form id="inputform" class="w3-container">
							<p>
								<label>Email</label> <input class="w3-input" type="text" value="aaa@email.com" disabled="disabled">
							</p>
							<br> <br>
							<p>
								<label>Password</label> <input class="w3-input" type="text">
							</p>
							<br>
							<div class="w3-center">
								<input type="submit" value="확인"
									class="w3-btn w3-padding w3-black w3-margin">
							</div>
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
	<c:import url="../bottom.do"/>

</body>
</html>
