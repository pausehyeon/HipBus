<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<script src="/HipBus/scripts/ajax.js"></script>

<title>${str_crewbusTitle}</title>
<body class="w3-theme-l5">
	<!-- Navbar -->
	<c:import url="../top.do" />
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>
		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-theme-l1">
						<h3>
							<i class="fa fa-bullhorn"></i>&nbsp; ${str_wanted}
						</h3>
					</div>
					<p class="w3-small w3-left">&nbsp;&nbsp;&nbsp;&nbsp;${str_wantedMsg}</p>
					<c:if test="${isMember}">
						<div class="w3-row-padding w3-margin-top w3-margin-bottom">
							<div class="w3-col m12">
								<a href="crewBusWantedWrite.do?driver=${driver}" class="w3-btn w3-padding w3-theme-d5 w3-margin-left w3-right"> <i class="fa fa-pencil w3-margin-right"></i>${str_post}</a>
							</div>
						</div>
					</c:if>

					<div class="w3-row-padding w3-padding-16 w3-center">
						<!-- 글이 없는 경우 -->
						<c:if test="${(count eq 0) or (articles eq null)}">
							<div class="w3-col m12">
								<h5>글이 없습니다.</h5>
							</div>
						</c:if>

						<!-- 글이있는경우 -->
						<c:if test="${(count ne 0) and (articles ne null)}">
							<c:forEach var="article" items="${articles}">
								<div class="w3-col m4 w3-hover-opacity" onclick="location = 'crewBusWantedRead.do?driver=${driver}&num=${article.num}'">
									<!-- 대표 이미지가 있는 경우 -->
									<c:if test="${(article.imglocation ne null) and (article.imglocation ne '') }">
										<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" style="width: 100%">
									</c:if>
									<!-- 대표 이미지가 없는 경우 -->
									<c:if test="${(article.imglocation eq null) or (article.imglocation eq '') }">
										<img src="${project}/view/img/HipBusLogo_pale_sq.png" alt="poster" style="width: 100%" class="w3-opacity">
									</c:if>
									<!-- D-day 연산을 위해 시스템 날짜를 받아옴 -->
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:parseNumber var="today" value="${now.time/ (1000*60*60*24)}" integerOnly="true" />
									<fmt:parseNumber var="duedate" value="${article.duedate.time/ (1000*60*60*24)}" integerOnly="true" />
									<!-- D-n 초록색, D-3 ~ D-1 빨간 색, D-day, 마감으로 나누어표시 -->

									<h5>
										<c:if test="${(today - duedate) lt (-3)}">
											<span class="w3-badge w3-green">D${today - duedate}</span>
										</c:if>
										<c:if test="${( (today - duedate) ge (-3) ) and ((today - duedate) lt 0)}">
											<span class="w3-badge w3-red">D${today - duedate}</span>
										</c:if>
										<c:if test="${(today - duedate) eq 0}">
											<span class="w3-badge w3-red">D-Day</span>
										</c:if>
										<c:if test="${(today - duedate) gt 0}">
											<span class="w3-badge">${str_ended}</span>
										</c:if>

										<c:if test="${fn:length(article.subject) le 7}">
											${article.subject}
										</c:if>
										<c:if test="${fn:length(article.subject) gt 7}">
											${fn:substring(article.subject, 0, 7)}...
										</c:if>
									</h5>

									<p class="w3-tiny">${article.nick}|
										<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
										| ${article.readcount}
									</p>
									<hr>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${!pastArticles.isEmpty()}">
							<c:forEach var="article" items="${pastArticles}">
								<div class="w3-col m4 w3-hover-opacity" onclick="location = 'crewBusWantedRead.do?driver=${driver}&num=${article.num}'">
									<!-- 대표 이미지가 있는 경우 -->
									<c:if test="${(article.imglocation ne null) and (article.imglocation ne '') }">
										<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" style="width: 100%" class="w3-grayscale-max">
									</c:if>
									<!-- 대표 이미지가 없는 경우 -->
									<c:if test="${(article.imglocation eq null) or (article.imglocation eq '') }">
										<img src="${project}/view/img/wanted.png" alt="poster" style="width: 100%" class="w3-grayscale-max">
									</c:if>

									<h5>
										<span class="w3-badge">${str_ended}</span>
										<c:if test="${fn:length(article.subject) le 7}">
											${article.subject}
										</c:if>
										<c:if test="${fn:length(article.subject) gt 7}">
											${fn:substring(article.subject, 0, 7)}...
										</c:if>
									</h5>

									<p class="w3-tiny">${article.nick}|
										<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
										| ${article.readcount}
									</p>
									<hr>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${pastArticles.isEmpty() and articles.isEmpty()}">
							<div class="w3-col">
								<h4>아직 작성한 글이 없습니다.</h4>
							</div>
						</c:if>
					</div>

				</div>

				<!-- End Middle Column -->
			</div>

			<!--  Right Column -->
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
