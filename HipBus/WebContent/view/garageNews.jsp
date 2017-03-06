<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>

<title>${str_Title}</title>
<body onload="boardSet()">

	<c:import url="../top.do" />
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main w3-margin-bottom" style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<h3>${str_News}</h3>
			<p class="w3-small">${str_NewsTitle}</p>
			<br>
			<!-- 이 버튼은 관리자에게만 보임 -->
			<c:if test="${dto.mem_level == 3 }">
				<div class="w3-row-padding w3-center">
					<a href="garageNewsWrite.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right">
						<i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Write}</a>
				</div>
			</c:if>
			<hr>
		</div>
		<div class="w3-row-padding">
			<div class="w3-twothird">
				<!-- 글이없는경우 -->
				<c:if test="${(count eq 0) or (NewsList eq null)}">
					<div class="w3-row w3-margin-bottom">
						<div class="w3-col m12 w3-container">
							<p class="w3-center w3-cell-middle" style="font-weight: bold;">${msg_list_x}</p>
						</div>
					</div>
				</c:if>
				<!-- 글이있는경우 -->
				<c:if test="${(count ne 0) and (NewsList ne null)}">
					<c:forEach var="article" items="${NewsList}">
						<div class="w3-row w3-margin-bottom">
							<div class="w3-col m4 l3">
								<a href="garageNewsRead.do?num=${article.num}&pageNum=${pageNum}">${article.subject}</a>
							</div>
							<p class="w3-right w3-tiny">${article.nick}|
								<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
								|${article.readcount}
							</p>
						</div>
						<hr>
					</c:forEach>
				</c:if>
			</div>
			<div class="w3-third">
				<!-- 상업광고 -->
				<c:import url="../commercialAds.do"></c:import>
			</div>
		</div>
		<div class="w3-row">
			<!-- 글이있는경우에만 페이지 표시 -->
			<c:if test="${(count ne 0) and (NewsList ne null)}">
				<!-- Pagination -->
				<div class="w3-center w3-margin-bottom">
					<ul class="w3-pagination">
						<c:if test="${startPage gt pageBlock}">
							<li><a href="garageNews.do">[◀◀]</a></li>
							<li><a href="garageNews.do?pageNum=${startPage-pageBlock}">[◀]</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i eq currentPage}">
								<li><a class="w3-theme-d1">${i}</a></li>
							</c:if>
							<c:if test="${i ne currentPage}">
								<li><a href="garageNews.do?pageNum=${i}">[${i}]</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount gt endPage}">
							<li><a href="garageNews.do?pageNum=${startPage+pageBlock}">[▶]</a></li>
							<li><a href="garageNews.do?pageNum=${pageCount}">[▶▶]</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
		</div>
		<!-- END MAIN -->
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
