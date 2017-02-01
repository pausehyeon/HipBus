<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>HipBus - My Bus</title>
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
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h2>
							<i class="fa fa-calendar"></i>&nbsp; 다가오는 공연
						</h2>
					</div>
					<div class="w3-row-padding w3-padding-16 w3-center">
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster1.jpg" alt="poster"
								style="width: 100%">
							<h4>The Perfect Sandwich, A Real NYC Classic</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster6.jpg" alt="poster"
								style="width: 100%">
							<h4>Let Me Tell You About This Steak</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster2.jpg" alt="poster"
								style="width: 100%">
							<h4>Cherries, interrupted</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster3.jpg" alt="poster"
								style="width: 100%">
							<h4>Once Again, Robust Wine and Vegetable Pasta</h4>
						</div>

						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster4.jpg" alt="poster"
								style="width: 100%">
							<h4>All I Need Is a Popsicle</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster5.jpg" alt="poster"
								style="width: 100%">
							<h4>Salmon For Your Skin</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster6.jpg" alt="poster"
								style="width: 100%">
							<h4>The Perfect Sandwich, A Real Classic</h4>
						</div>
						<div class="w3-col m4 l3">
							<img src="${project}/view/img/poster6.jpg" alt="poster"
								style="width: 100%">
							<p class="w3-center w3-tiny">
								작성자:Jihyeon<br> 작성일:2016-12-19 | 조회수: 0
							</p>
							<h4>Le French</h4>
						</div>
					</div>

				</div>
				<!-- 여기까지 -->
				<!-- End Middle Column -->
			</div>

			<!-- Right Column -->
			<c:import url="../myBusRight.do" />
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
