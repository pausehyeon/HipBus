<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=${googleApiKey}&region=kr" type="text/javascript"></script>
<script src="/HipBus/scripts/busScript.js"></script>

<title>${str_upcomingTitle}</title>

<body class="w3-theme-l5" onload="initMap(); codeAddress(); withoutuploadvalidate()">

	<!-- Navbar -->
	<c:import url="../top.do" />
	<!-- jQuery Validation Plugin -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
	<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<form name="writeform" action="crewBusUpcomingModifyPro.do?driver=${driver}&num=${num}" method="post" enctype="multipart/form-data">
						<div class="w3-container w3-center w3-black">
							<h3>
								<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
							</h3>
						</div>

						<div class="w3-row-padding">
							<div class="w3-col m12 w3-margin-top w3-margin-bottom">
								<input name="subject" type="text" value="${upcomingDto.subject}" required="required" autofocus="autofocus" class="w3-input">
								<label class="w3-label w3-validate">${str_perf_subject}</label>
							</div>
							<div class="w3-col m12 l6">
								<div id="map" style="width: 100%; height: 280px;" class="w3-col6"></div>
								<label class="w3-label w3-validate">${str_location}</label>
							</div>
							<div class="w3-col m12 l6">
								<div class="w3-row w3-right-align">
									<!-- 장소 기본값 설정해주기 -->
									<c:set var="perf_place" value="${fn:split(upcomingDto.perf_place, '@')}" />
									<c:set var="placeId" value="${perf_place[0]}" />
									<c:set var="perf_place" value="${perf_place[1]}" />
									<div class="w3-col m9 w3-margin-bottom">
										<input name="placeToSearch" type="text" value="${perf_place}" placeholder="${str_searchPlace}" class="w3-input">
									</div>
									<div class="w3-col m3 w3-margin-bottom" style="padding-left: 10px">
										<a onclick="codeAddress()" class="w3-btn-block w3-padding"> <i class="fa fa-search"></i>
										</a>
									</div>
									<div class="w3-col m12 w3-margin-bottom">

										<input name="showSearchResult" type="text" value="${perf_place}" disabled="disabled" class="w3-input" required="required">
										<input name="perf_place" type="hidden" value="${upcomingDto.perf_place}" class="w3-input" required="required">
										<!-- ^ 입력 값은 results[0].place_id+'@'+results[0].formatted_address의 형식으로 저장됨. ex) ChIJExW378KYfDUR8aFijbcqirQ@대한민국 서울특별시 서교동 홍대입구역 -->
										<label class="w3-label w3-validate">${str_perf_place}</label>
									</div>

									<div class="w3-col m12 w3-margin-bottom">
										<!-- 최소값을 오늘로 설정 -->
										<jsp:useBean id="defaultDateTime" class="java.util.Date" />
										<fmt:formatDate var="today" value="${defaultDateTime}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="now" value="${defaultDateTime}" pattern="hh:mm" />
										<!-- 기존 perf_date를 받아와서 format -->
										<fmt:formatDate var="perf_date" value="${upcomingDto.perf_date}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="perf_time" value="${upcomingDto.perf_date}" pattern="hh:mm" />
										
										<input name="perf_date" type="datetime-local" required="required" value="${perf_date}T${perf_time}" min="${today}T${now}" class="w3-input">
										<label class="w3-label w3-validate">${str_perf_date}</label>
									</div>
									<div class="w3-col m12 w3-margin-bottom">
										<input name="perf_runningtime" type="number" value="${upcomingDto.perf_runningtime}" min="0" step="30" class="w3-input" required="required">
										<label class="w3-label w3-validate">${str_perf_runningtime}</label>
									</div>
								</div>
							</div>
							<div class="w3-col m6 w3-margin-bottom">
								<input name="perf_cast" type="text" value="${upcomingDto.perf_cast}" required="required" class="w3-input">
								<label class="w3-label w3-validate w3-right">${str_perf_cast}</label>
							</div>
							<div class="w3-col m6 w3-margin-bottom">
								<input name="perf_price" type="number" value="${upcomingDto.perf_price}" min="0" step="1000" class="w3-input">
								<label class="w3-label w3-validate w3-right">${str_perf_price}</label>
							</div>
						</div>
						<div class="w3-row-padding w3-padding-32">
							<div class="w3-col m12">
								<textarea name="content" id="editor" required class="w3-input"></textarea>
								<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
								<script type="text/javascript">
								CKEDITOR.instances.editor
										.setData("${upcomingDto.content}");
								//-->
								</script>
							</div>
						</div>
						<div class="w3-row-padding w3-padding-32">
							<div class="w3-col s2 m2">
								<img src="${project}/hipbusSave/${upcomingDto.imglocation}" alt="poster" width="100%" class="w3-opacity-min">
							</div>
							<div class="w3-col s10 m10">
								<br><br>
								<span class="w3-text-teal"><i class="fa fa-image"></i> &nbsp;${str_selectPoster} </span>
								<input name="upload" type="file" accept="image/*">
							</div>
						</div>

						<div class="w3-row-padding w3-white w3-center">
							<p>
								<button type="submit" class="w3-btn w3-padding"><i class="fa fa-check w3-margin-rignt"></i> ${str_modifyUpcoming}</button>
							</p>
						</div>
					</form>
				</div>
			</div>

			<!-- Right Column -->
			<c:import url="../crewBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
