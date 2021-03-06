<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<title>${str_Title}</title>
<body>

	<c:import url="../top.do" />

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main  w3-margin-bottom "  style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<h3>${str_Wanted}</h3>
			<p>${str_WantedTitle}</p>
			<hr>
		</div>
		<div class="w3-row-padding">
			<div class="w3-twothird">
				<!-- 글이 없는 경우 -->
				<c:if test="${fn:length(WantedList) eq 0}">
					<div class="w3-row w3-margin-bottom">
						<div class="w3-col m12">
							<p class="w3-left"><span>${msg_search_x}</span></p>
						</div>
					</div>
				</c:if>

				<!-- 글이있는경우 -->
				<c:if test="${fn:length(WantedList) ne 0}">
				<div class="w3-margin-bottom">
					<p class="w3-center"><span class="w3-text-blue">${keyword}</span> 검색 결과 <span class="w3-text-blue">${count}건</span>의 게시글을 찾았습니다.</p>
				</div>
					<c:forEach var="article" items="${SearchList}">
					<div class="w3-row w3-margin-bottom">
							<div class="w3-col m12">
								<!-- D-day 연산을 위해 시스템 날짜를 받아옴 -->
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:parseNumber var="today" value="${(now.time/ (1000*60*60*24))-1}" integerOnly="true" />
								<fmt:parseNumber var="duedate" value="${article.duedate.time/ (1000*60*60*24)}" integerOnly="true" />
								<!-- D-n 초록색, D-3 ~ D-1 빨간 색, D-day, 마감으로 나누어표시 -->
								<c:if test="${(today - duedate) lt (-3)}">
									<span class="w3-badge w3-green">D${today - duedate}</span>
								</c:if>
								<c:if test="${ ((today - duedate) ge (-3) ) and ((today - duedate) lt 0)}">
									<span class="w3-badge w3-red">D${today - duedate}</span>
								</c:if>
								<c:if test="${(today - duedate) eq 0}">
									<span class="w3-badge w3-red">D-Day</span>
								</c:if>
								<c:if test="${(today - duedate) gt 0}">
									<span class="w3-badge">마감</span>
								</c:if>
								<c:if test="${fn:contains( article.driver,'@') }">
									<a href="myBusWantedRead.do?driver=${article.driver}&num=${article.num}"> ${article.subject}</a>
								</c:if>
								<c:if test="${not fn:contains( article.driver,'@') }">
									<a href="crewBusWantedRead.do?driver=${article.driver}&num=${article.num}"> ${article.subject}</a>
								</c:if>
								<p class="w3-right w3-tiny">${article.nick}|
									<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									| ${article.readcount}
								</p>
								<hr>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="w3-third">
				<c:import url="../commercialAds.do"></c:import>
				</div>
			</div>

			<div class="w3-row w3-center w3-margin-bottom">
			<div class="w3-col m7">
				<div class="w3-row-padding">
					<form name="searchform" method="get" action="garageWantedSearch.do" onsubmit="return search()">
						<div class="w3-col m2">
							<select name="searchType" class="w3-padding w3-theme-l4 w3-btn w3-margin-right">
								<option value="nick">${str_Writer}</option>
								<option value="subject">${str_Subject}</option>
								<option value="content">${str_Content}</option>
							</select>
						</div>
						<div class="w3-col m3">
							<input type="text" name="keyword" placeholder="${str_Search}" class="w3-input">
						</div>
						<div class="w3-col m1">
							<button type="submit" class="w3-btn-block w3-theme-d1 w3-padding">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			</div>
			
	<c:if test="${fn:length(WantedList) ne 0}">
			<div class="w3-row-padding w3-margin-top w3-margin-bottom">
				<!-- Pagination -->
				<div class="w3-col m12 w3-center">
					<ul class="w3-pagination">

						<c:if test="${startPage > pageBlock}">
							<li><a href="garageWantedSearch.do&searchType=${searchType}&keyword=${keyword}">[◀◀]</a></li>
							<li><a href="garageWantedSearch.do?pageNum=${startPage-pageBlock}&searchType=${searchType}&keyword=${keyword}">[◀]</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><a class="w3-theme-d1">${i}</a></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="garageWantedSearch.do?pageNum=${i}&searchType=${searchType}&keyword=${keyword}">[${i}]</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="garageWantedSearch.do?pageNum=${startPage+pageBlock}&searchType=${searchType}&keyword=${keyword}">[▶]</a></li>
							<li><a href="garageWantedSearch.do?pageNum=${pageCount}&searchType=${searchType}&keyword=${keyword}">[▶▶]</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
			<!-- END MAIN -->
	

	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>

