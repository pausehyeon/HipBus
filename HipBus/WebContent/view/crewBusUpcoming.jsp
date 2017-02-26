<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<title>${str_crewbusTitle}</title>
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
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
						</h3>
					</div>
					<c:if test="${isMember}">
						<div class="w3-row-padding w3-margin-top w3-margin-bottom">
							<div class="w3-col m12">
								<a href="crewBusUpcomingWrite.do?driver=${driver}" class="w3-btn w3-padding w3-theme-d5 w3-margin-left w3-right"> <i class="fa fa-pencil w3-margin-right"></i>${str_post}</a>
							</div>
						</div>
					</c:if>
					<div class="w3-row-padding w3-padding-16 w3-center">
						<c:if test="${upcomings!=null}">
							<c:forEach var="article" items="${upcomings}">
								<div class="w3-col m4 l3 w3-hover-opacity w3-margin-bottom" onclick="location='crewBusUpcomingRead.do?driver=${driver}&num=${article.num}'">
									<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" width="100%">
									<!-- D-day 연산을 위해 시스템 날짜를 받아옴 -->
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:parseNumber var="today" value="${now.time/ (1000*60*60*24)}" integerOnly="true" />
									<fmt:parseNumber var="perf_date" value="${article.perf_date.time/ (1000*60*60*24)}" integerOnly="true" />
									<!-- D-n 초록색, D-3 ~ D-1 빨간 색, D-day으로 나누어표시 -->
									<p>
										<c:if test="${(today - perf_date) lt (-3)}">
											<span class="w3-badge w3-green">D${today - perf_date}</span>
										</c:if>
										<c:if test="${( (today - perf_date) ge (-3) ) and ((today - perf_date) lt 0)}">
											<span class="w3-badge w3-red">D${today - perf_date}</span>
										</c:if>
										<c:if test="${(today - perf_date) eq 0}">
											<span class="w3-badge w3-red">D-Day</span>
										</c:if>
										<c:if test="${fn:length(article.subject) le 7}">
											${article.subject}
										</c:if>
										<c:if test="${fn:length(article.subject) gt 7}">
											${fn:substring(article.subject, 0, 7)}...
										</c:if>
									</p>
									<p class="w3-tiny">${article.nick}|
										<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
										| ${article.readcount}
									</p>
								</div>
							</c:forEach>
						</c:if>
						
						<!-- 마감된 공연일정 -->
						<c:if test="${pastUpcomings!=null}">
							<c:forEach var="article" items="${pastUpcomings}">
								<div class="w3-col m4 l3 w3-hover-opacity w3-margin-bottom" onclick="location='crewBusUpcomingRead.do?driver=${driver}&num=${article.num}'">
									<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" width="100%" class="w3-grayscale-max">
									<p>
										<span class="w3-badge">${str_ended}</span>
										<c:if test="${fn:length(article.subject) le 7}">
											${article.subject}
										</c:if>
										<c:if test="${fn:length(article.subject) gt 7}">
											${fn:substring(article.subject, 0, 7)}...
										</c:if>
									</p>
									<p class="w3-tiny">${article.nick}|
										<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
										| ${article.readcount}
									</p>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${upcomings.isEmpty()}">
							<div class="w3-col">
								<h4>아직 작성한 글이 없습니다.</h4>
							</div>
						</c:if>
					</div>
				</div>
				<!-- 여기까지 -->
				<!-- End Middle Column -->
			</div>

			<!-- Right Column -->
			<c:import url="../crewBusRight.do?driver=${driver}" />
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
