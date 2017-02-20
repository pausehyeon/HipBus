<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>${str_mybusTitle}</title>
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
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-calendar"></i>&nbsp; ${str_upcomingList}
						</h3>
					</div>
					<div class="w3-row-padding w3-padding-16 w3-center">
					<c:if test="${upcomings!=null}">
						<c:forEach var="article" items="${upcomings}">
							<div class="w3-col m4 l3 w3-hover-grey" onclick="location='myBusUpcomingRead.do?driver=${driver}&num=${article.num}'">
								<img src="${project}/hipbusSave/${article.imglocation}" alt="poster"
									style="width: 100%">
								<h4>${article.subject}</h4>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${upcomings==null}">
							<div class="w3-col m4 l3">
								<h4>${아직 작성한 글이 없습니다.}</h4>
							</div>
					</c:if>
					</div>
				</div>
				<!-- 여기까지 -->
				<!-- End Middle Column -->
			</div>

			<!-- Right Column -->
			<c:import url="../myBusRight.do?driver=${driver}" />
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
