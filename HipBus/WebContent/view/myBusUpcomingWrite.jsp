<%@page import="java.sql.Timestamp"%>
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
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<form name="writeUpcomingForm" action="myBusUpcomingWritePro.do?driver=${driver}" method="post">
						<div class="w3-container w3-center w3-black">
							<h3>
								<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
							</h3>
						</div>
	
						<div class="w3-row-padding w3-padding-12">
							<input class="w3-input" type="text" required="required" autofocus="autofocus"
									name="showName">							 
								<label class="w3-label w3-validate">${str_showName}</label>
						</div>
						<div class="w3-row-padding">
							<div class="w3-col m6">
								<div class="w3-row-padding w3-right-align">
									<input type="text" class="w3-input" required="required"
											name="location"> 
									<label>${str_location}</label>
								</div>
							</div>
							<div class="w3-col m6">
								<div class="w3-row-padding w3-right-align">
									<input type="text" class="w3-input" required="required"
											name="cast"> 
									<label>${str_cast}</label>
								</div>
							</div>
						</div>
						<div class="w3-row-padding">
							<div class="w3-col m6">
								<div class="w3-row-padding w3-right-align">
									<input type="datetime-local" class="w3-input" required="required"
											name="showDate"> 
									<label>${str_date}</label>
								</div>
							</div>
							<div class="w3-col m6">
								<div class="w3-row-padding w3-right-align">
									<input type="number" min="0" step="5" placeholder="분 단위" class="w3-input" required="required"
											name="runningTime"> 
									<label>RunningTime</label>
								</div>
							</div>
						</div>
						<div class="w3-row-padding">
							<div class="w3-col m6">
								<div class="w3-row-padding w3-right-align">
									<input type="number" min="0" step="100" class="w3-input"
											name="price"> 
									<label>티켓가격</label>
								</div>
							</div>
						</div>
						<div class="w3-row-padding w3-padding-32">
							<textarea name="content" id="editor" required class="w3-input"></textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
						</div>
						<div class="w3-row w3-padding-jumbo w3-theme-l3">
							<span>* <i class="fa fa-image"></i> &nbsp;${str_insertThumbnail} </span>
							<input name="upload" type="file" accept="image/*" required>
						</div>
						<div class="w3-row-padding w3-white w3-center">
							<p>
								<button type="button" onclick="funcs()">
								확인
								</button>
								<script type="text/javascript">
								function funcs() {
									alert("${driver}");
								}
								</script>
								<button type="submit" class="w3-btn">${str_post}</button>
							</p>
							<i class="glyphicon glyphicon-search"></i>
						</div>
					</form>
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
