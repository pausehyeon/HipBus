<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>

<title>${str_upcomingTitle}</title>


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
			<c:import url="../myBusLeft.do?driver=${driver}&email=${email}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-bullhorn"></i>&nbsp; Wanted
						</h3>
					</div>

					<div class="w3-row-padding w3-margin-top w3-margin-bottom">
						<div class="w3-col m6 w3-center">
							<img src="${project}/view/img/poster1.jpg" width="100%">
						</div>
						<div class="w3-col m6 w3-center">
							<div class="w3-row">
								<h5>제목</h5>
							</div>
							<div class="w3-row">
								<p>글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용 글 내용</p>
							</div>
						</div>
					</div>
					<div class="w3-row-padding w3-white w3-center">
						<p>
							<a href="garageWanted.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
								<i class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
						</p>
					</div>
				</div>
			</div>


			<!-- Right Column -->
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
