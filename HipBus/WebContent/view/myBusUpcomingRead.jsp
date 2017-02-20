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
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming} : ${upcomingDto.subject}
						</h3>
					</div>
					<div class="w3-right">
						<button class="w3-btn" onclick="location='myBusUpcomingModify.do?driver=${driver}&num=${upcomingDto.num}'">
						<i class="fa fa-pencil"></i></button>
						<button class="w3-btn"><i class="fa fa-trash-o"></i></button>
					</div>

					<div class="w3-row-padding w3-margin-top">
						<div class="w3-col m12 w3-padding-12 w3-center">
							<img src="${project}/hipbusSave/${upcomingDto.imglocation}">
						</div>
						<div class="w3-col m2">
							<div class="w3-row-padding w3-right-align">
								<label>${str_location}</label>
							</div>
						</div>
						<div class="w3-col m4">
							<div class="w3-row-padding w3-left-align">
								<label>${upcomingDto.perf_place}</label>
							</div>
						</div>
						<div class="w3-col m2">
							<div class="w3-row-padding w3-right-align">
								<label>${str_cast}</label>
							</div>
						</div>
						<div class="w3-col m4">
							<div class="w3-row-padding w3-left-align">
								<label>${upcomingDto.perf_cast}</label>
							</div>
						</div>
					</div>
					<div class="w3-row-padding">
						<div class="w3-col m2">
							<div class="w3-row-padding w3-right-align">
								<label>${str_date}</label>
							</div>
						</div>
						<div class="w3-col m4">
							<div class="w3-row-padding w3-left-align">
								<label>${upcomingDto.perf_date}</label>
							</div>
						</div>
						<div class="w3-col m2">
							<div class="w3-row-padding w3-right-align">
								<label>${str_time}</label>
							</div>
						</div>
						<div class="w3-col m4">
							<div class="w3-row-padding w3-left-align">
								<label>${upcomingDto.perf_runningtime} ${str_minute}</label>
							</div>
						</div>
					</div>
					<div class="w3-row-padding w3-padding-32 w3-padding-jumbo">
						<p>
							${upcomingDto.content}
						</p>
					</div>
					<div class="w3-row-padding w3-white w3-center">
						<p>
							<button class="w3-btn">${str_goUpcomingList}</button>
						</p>
						<i class="glyphicon glyphicon-search"></i>
					</div>
				</div>
			</div>


			<!-- Right Column -->
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
