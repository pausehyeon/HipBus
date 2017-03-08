<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>


<title>${str_Title}</title>
<body onload="boardSet()">

	<c:import url="../top.do" />

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<h3>${str_Upcoming}</h3>
			<p>${str_UpcomingTitle}</p>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<div class="w3-row-padding w3-padding-16 w3-left">
					<div class="w3-col m12 w3-cell-middle">
						<form action="garageUpcoming.do" method="get">
							<c:if test="${(startDate eq null ) or (endDate eq null)}">
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
								<input name="startDate" type="date" value="${today}" required="required" class="w3-padding w3-theme-l4 w3-btn w3-margin-right">
								<span class="w3-center">~ </span>
								<input name="endDate" type="date" value="${today}" required="required" class="w3-padding w3-theme-l4 w3-btn w3-margin-left">
							</c:if>
							<c:if test="${(startDate ne null ) and (endDate ne null)}">
								<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDate" />
								<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDate" />
								<input name="startDate" type="date" value="${startDate}" required="required" class="w3-padding w3-theme-l4 w3-btn w3-margin-right">
								<span class="w3-center">~ </span>
								<input name="endDate" type="date" value="${endDate}" required="required" class="w3-padding w3-theme-l4 w3-btn w3-margin-left">
							</c:if>
								<input type="submit" value="${str_Search}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right">
						</form>
					</div>
				</div>
				<h1>&nbsp;</h1>
				<!-- ^ 칸 나누기 위해 추가한 공백 -->
				<div class="w3-row-padding w3-padding-16 w3-center">
					<c:if test="${count eq 0}">
						<p class="w3-center w3-cell-middle" style="font-weight: bold;">${str_noUpcoming}</p>
					</c:if>
					<c:if test="${count ne 0 and dateList eq null}">
						<c:forEach var="article" items="${articles}">
							<c:if test='${fn:contains(article.driver, "@")}'>
								<c:set var="url" value="myBusUpcomingRead.do?driver="></c:set>
							</c:if>
							<c:if test='${not fn:contains(article.driver, "@")}'>
								<c:set var="url" value="crewBusUpcomingRead.do?driver="></c:set>
							</c:if>
							<div class="w3-col m4 l3" onclick="location='${url}${article.driver}&num=${article.num}'">
								<c:if test="${article.imglocation eq null }">
									<img src="${project}/view/img/poster1.jpg" alt="poster" style="width: 100%">
								</c:if>
								<c:if test="${article.imglocation ne null }">
									<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" style="width: 100%">
								</c:if>
								<c:if test="${fn:length(article.subject) gt 7 }">
									<p class="w3-large w3-slim">${fn:substring(article.subject, 0, 7)}...</p>
								</c:if>
								<c:if test="${ fn:length(article.subject) le 7 }">
									<p class="w3-large w3-slim">${article.subject}</p>
								</c:if>

								<span><fmt:formatDate value="${article.perf_date}" type="both" pattern="M월 d일 공연 예정" /></span>
								<p class="w3-tiny">
									${article.nick} |
									<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd" />
									| ${article.readcount}
								</p>
							</div>
						</c:forEach>

					</c:if>

					<c:if test="${count ne 0 and dateList ne null}">
						<div class="w3-row-padding w3-margin-bottom w3-center">
						<p class="w3-center">${startDate} ~ ${endDate}<span class="w3-text-blue"><br>${count}건</span>${str_upcomingO}</p>
						</div>
						<c:forEach var="datelist" items="${dateList}">
							<c:if test='${fn:contains(datelist.driver, "@")}'>
								<c:set var="url" value="myBusUpcomingRead.do?drvier="></c:set>
							</c:if>
							<c:if test='${not fn:contains(datelist.driver, "@")}'>
								<c:set var="url" value="crewBusUpcomingRead.do?drvier="></c:set>
							</c:if>
							<div class="w3-col m4 l3" onclick="location='${url}${datelist.driver}&num=${datelist.num}'">
								<c:if test="${datelist.imglocation eq null }">
									<img src="${project}/view/img/poster1.jpg" alt="poster" style="width: 100%">
								</c:if>
								<c:if test="${datelist.imglocation ne null }">
									<img src="${project}/hipbusSave/${datelist.imglocation}" alt="poster" style="width: 100%">
								</c:if>
								<c:if test="${fn:length(datelist.subject) gt 7 }">
									<p class="w3-large w3-slim">${fn:substring(datelist.subject, 0, 7)}...</p>
								</c:if>
								<c:if test="${ fn:length(datelist.subject) le 7 }">
									<p class="w3-large w3-slim">${datelist.subject}</p>
								</c:if>

								<span><fmt:formatDate value="${datelist.perf_date}" type="both" pattern="M월 d일 공연 예정" /></span>
								<p class="w3-tiny">
									${datelist.nick} |
									<fmt:formatDate value="${datelist.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									| ${datelist.readcount}
								</p>
							</div>
						</c:forEach>

					</c:if>
				</div>
			</div>

			<div class="w3-third">
				<!-- 상업광고 -->
				<c:import url="../commercialAds.do"></c:import>
			</div>
		</div>

		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
				<ul class="w3-pagination">
					<c:if test="${startPage gt pageBlock}">
						<li><a href="garageUpcoming.do" class="w3-hover-opacity">«</a></li>
						<li><a href="garageUpcoming.do?pageNum=${startPage-pageBlock}" class="w3-hover-opacity">«</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i eq currentPage}">
							<li><a class="w3-theme-d1">${i}</a></li>
						</c:if>
						<c:if test="${i ne currentPage}">
							<li><a href="garageUpcoming.do?pageNum=${i}" class="w3-hover-opacity">${i}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pageCount gt endPage}">
						<li><a href="garageUpcoming.do?pageNum=${startPage+pageBlock}" class="w3-hover-opacity">»</a></li>
						<li><a href="garageUpcoming.do?pageNum=${pageCount}" class="w3-hover-opacity">»</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
