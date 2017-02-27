<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>
<title>${str_upcomingTitle}</title>

<c:if test="${upcomingDto eq null}">
	<script type="text/javascript">
		alert('존재하지 않는 글입니다.');
		history.back();
	//-->
	</script>
</c:if>
<c:if test="${upcomingDto ne null}">

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
				<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
				<!-- End Left Column -->

				<!-- Middle Column -->
				<!-- 여기서부터 -->
				<div class="w3-col m7">
					<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
						<div class="w3-container w3-center w3-theme-d5">
							<h3>
								<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
							</h3>
						</div>

						<div class="w3-row-padding w3-margin-top">
							<div class="w3-col m12 l6 w3-padding-12 w3-center">
								<img src="${project}/hipbusSave/${upcomingDto.imglocation}" width="100%">
							</div>
							<div class="w3-col m12 l6 w3-margin-top">
								<p>
									<span style="font-weight: bold;">${str_perf_subject}</span> ${upcomingDto.subject}
								</p>
								<p>
									<span style="font-weight: bold;">${str_perf_cast}</span> ${upcomingDto.perf_cast}
								</p>
								<p>
									<fmt:formatDate var="date" value="${upcomingDto.perf_date}" pattern="yyyy년 MM월 dd일" />
									<span style="font-weight: bold;">${str_perf_date}</span> ${date}
								</p>
								<p>
									<fmt:formatDate var="perf_time" value="${upcomingDto.perf_date}" pattern="a hh시 mm분" />
									<span style="font-weight: bold;">${str_perf_runningtime}</span> ${perf_time}( ${upcomingDto.perf_runningtime}${str_minute} )
								</p>
								<c:set var="perf_place" value="${fn:split(upcomingDto.perf_place, '@')}" />
								<c:set var="placeId" value="${perf_place[0]}" />
								<c:set var="perf_place" value="${perf_place[1]}" />
								<p>
									<span style="font-weight: bold;">${str_perf_place}</span> ${perf_place}
								</p>
							</div>
							<div class="w3-col m12 l6">
								<iframe width="100%" height="200" frameborder="0" style="border: 0" src="https://www.google.com/maps/embed/v1/place?q=place_id:${placeId}&key=${googleApiKey}" allowfullscreen></iframe>
							</div>
						</div>

						<div class="w3-row-padding w3-margin-bottom">
							<div class="w3-col m12 w3-padding-jumbo w3-padding-32">
								<p>${upcomingDto.content}</p>
							</div>

							<c:if test="${isMember}">
								<div class="w3-col m6 l3">
									<a href='crewBusUpcomingModify.do?driver=${driver}&num=${upcomingDto.num}' class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left w3-margin-bottom w3-theme-d5"> <i
										class="fa fa-pencil w3-margin-right"
									></i>${str_modBoard}</a>
								</div>
								<div class="w3-col m6 l3">
									<a href='crewBusUpcomingDeletePro.do?driver=${driver}&num=${upcomingDto.num}' class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left w3-margin-bottom w3-theme-d5"> <i
										class="fa fa-close w3-margin-right"
									></i>${str_delBoard}</a>
								</div>
							</c:if>
							<c:if test="${!isMember}">
								<div class="w3-col m6 l3">
									&nbsp;
									<!-- ^ 가운데 정렬을 위해 추가한 공백 컬럼 -->
								</div>
							</c:if>
							<div class="w3-col m6 l3">
								<a href="crewBusWanted.do?driver=${driver}" class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left w3-margin-bottom w3-theme-d5"> <i class="fa fa-bus w3-margin-right"></i>${str_mylist}</a>
							</div>
							<div class="w3-col m6 l3">
								<a href='crewBusUpcoming.do?driver=${driver}' class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left w3-margin-bottom w3-theme-d5"> <i class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
							</div>
						</div>
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
</c:if>
</html>
