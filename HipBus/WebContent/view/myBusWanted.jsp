<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<script src="/HipBus/scripts/ajax.js"></script>

<title>${str_mybusTitle}</title>
<body class="w3-theme-l5">
	<!-- Navbar -->
	<c:import url="../top.do" />
	<textarea rows="" cols="" readonly="readonly"></textarea>
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>
		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}&email=${email}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-bullhorn"></i>&nbsp; Wanted
						</h3>
					</div>
					<div class="w3-row-padding w3-padding-16 w3-center">
						<!-- 글이 없는 경우 -->
						<!-- 글이 있는 경우 -->
						<div class="w3-col m4">
							<img src="${project}/view/img/poster1.jpg" alt="poster" style="width: 100%">
							<h5><span class="w3-badge w3-green">D-3</span> 구합니다!</h5>
							<p class="w3-tiny"> 2017.02.16 | 0 </p>
						</div>
					</div>

				</div>

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
