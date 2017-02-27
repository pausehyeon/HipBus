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
					<div class="w3-container w3-center w3-theme-d5">
						<h3>
							<i class="fa fa-bullhorn"></i>&nbsp; Wanted : ${article.subject}
						</h3>
					</div>

					<div class="w3-row-padding w3-margin-top w3-margin-bottom">
						<c:if test="${(article.imglocation eq null) or (article.imglocation eq '')}">
							<div class="w3-col m12 w3-align-left">
								<h5>${article.subject}</h5>
								<p>${article.content}</p>
							</div>
						</c:if>
						<c:if test="${(article.imglocation ne null) and (article.imglocation ne '')}">
							<div class="w3-col m6 w3-align-left">
								<img src="${project}/hipbusSave/${article.imglocation}" width="100%">
							</div>
							<div class="w3-col m6 w3-align-left">
								<div class="w3-row">
									<h5>${article.subject}</h5>
								</div>
								<div class="w3-row">
									<p>${article.content}</p>
								</div>
							</div>
						</c:if>
					</div>

					<div class="w3-row-padding w3-white w3-center">
						<c:if test="${article.driver eq sessionScope.memEmail}">
							<div class="w3-col m6 l3">
								<a href="myBusWantedModify.do?driver=${driver}&num=${article.num}" class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-pencil w3-margin-right"></i>${str_modBoard}</a>
							</div>
						</c:if>
						<c:if test="${article.driver eq sessionScope.memEmail or mem_level==3}">
							<div class="w3-col m6 l3">
								<a href="myBusWantedDeletePro.do?driver=${driver}&num=${article.num}" class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-close w3-margin-right"></i>${str_delBoard}</a>
							</div>
						</c:if>
						<c:if test="${article.driver ne sessionScope.memEmail}">
							<div class="w3-col m6 l3">
								&nbsp;
								<!-- ^ 가운데 정렬을 위해 추가한 공백 컬럼 -->
							</div>
						</c:if>
						<div class="w3-col m6 l3">
							<a href="myBusWanted.do?driver=${driver}" class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-bus w3-margin-right"></i>${str_mylist}</a>
						</div>
						<div class="w3-col m6 l3">
							<a href="garageWanted.do" class="w3-btn-block w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
						</div>
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
