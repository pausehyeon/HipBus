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
			<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge" >
				<div class="w3-row">
					<a href="myBus.do" class="w3-closebtn"><span>&times;</span></a>
				</div>
				<div class="w3-row-padding w3-center w3-theme-l5">
					<div class="w3-col m4 l6 w3-padding-32 ">
						<iframe src="http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg" frameborder="0" allowfullscreen></iframe>
						<p class="w3-center w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수: 0</p>
						<h5>정지현님의 라이브</h5>
					</div>
					<div class="w3-col m4 l6 w3-padding-32 w3-theme-l5">
						<iframe src="http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg" frameborder="0" allowfullscreen></iframe>
						<p class="w3-center w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수: 0</p>
						<h5>정지현님의 라이브</h5>
					</div>
					<div class="w3-col m4 l6 w3-padding-32 w3-theme-l5">
						<iframe src="http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg" frameborder="0" allowfullscreen></iframe>
						<p class="w3-center w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수: 0</p>
						<h5>정지현님의 라이브</h5>
					</div>
					<div class="w3-col m4 l6 w3-padding-32 w3-theme-l5">
						<iframe src="http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg" frameborder="0" allowfullscreen></iframe>
						<p class="w3-center w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수: 0</p>
						<h5>정지현님의 라이브</h5>
					</div>
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
