<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
						</h3>
					</div>

					<div class="w3-row-padding w3-padding-12">
						<input class="w3-input" type="text" required="required"
							autofocus="autofocus"> <label
							class="w3-label w3-validate">${str_showName}</label>
					</div>
					<div class="w3-row-padding">
						<div class="w3-col m6">
							<div class="w3-row-padding w3-right-align">
								<input type="text" class="w3-input"> <label>${str_location}</label>
							</div>
						</div>
						<div class="w3-col m6">
							<div class="w3-row-padding w3-right-align">
								<input type="text" class="w3-input"> <label>${str_cast}</label>
							</div>
						</div>
					</div>
					<div class="w3-row-padding">
						<div class="w3-col m6">
							<div class="w3-row-padding w3-right-align">
								<input type="datetime-local" class="w3-input"> <label>${str_date}</label>
							</div>
						</div>
						<div class="w3-col m6">
							<div class="w3-row-padding w3-right-align">
								<input type="time" class="w3-input"> <label>${str_time}</label>
							</div>
						</div>
					</div>
					<div class="w3-row-padding w3-padding-32">
						<textarea class="w3-input" id="editor" cols="1" rows="15"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('editor');
						</script>
					</div>
					<div class="w3-row-padding w3-white w3-center">
						<p>
							<button class="w3-btn">${str_post}</button>
						</p>
						<i class="glyphicon glyphicon-search"></i>
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
