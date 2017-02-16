<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>


<title>${str_Title}</title>
<body>

	<c:import url="../top.do" />

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_Upcoming}</h3>
			<p>${str_UpcomingTitle}</p>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<div class="w3-row-padding w3-padding-16 w3-center">
					<c:if test="${count eq 0}">
						<p class="w3-center">${str_noUpcoming}</p>
					</c:if>
					<c:if test="${count ne 0 and articles ne null}">
						<c:forEach var="article" items="${articles}">
							<c:if test='${fn:contains(article.driver, "@")}'>
								<c:set var="url" value="myBusUpcomingRead.do?num="></c:set>
							</c:if>
							<c:if test='${not fn:contains(article.driver, "@")}'>
								<c:set var="url" value="crewBusUpcomingRead.do?num="></c:set>
							</c:if>
							<div class="w3-col m4 l3"  onclick="location='${url}${article.driver}'">
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
									<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									| ${article.readcount}
								</p>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="w3-third">
				<div class="w3-container">
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
				</div>
			</div>
		</div>

		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
				<ul class="w3-pagination">
					<c:if test="${startPage gt pageBlock}">
						<li>
							<a href="garageUpcoming.do" class="w3-hover-opacity">«</a>
						</li>
						<li>
							<a href="garageUpcoming.do?pageNum=${startPage-pageBlock}" class="w3-hover-opacity">«</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i eq currentPage}">
							<li>
								<a class="w3-theme-d1">${i}</a>
							</li>
						</c:if>
						<c:if test="${i ne currentPage}">
							<li>
								<a href="garageUpcoming.do?pageNum=${i}" class="w3-hover-opacity">${i}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${pageCount gt endPage}">
						<li>
							<a href="garageUpcoming.do?pageNum=${startPage+pageBlock}" class="w3-hover-opacity">»</a>
						</li>
						<li>
							<a href="garageUpcoming.do?pageNum=${pageCount}" class="w3-hover-opacity">»</a>
						</li>
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
