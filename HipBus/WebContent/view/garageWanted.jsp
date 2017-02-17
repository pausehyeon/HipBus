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
			<h3>${str_Wanted}</h3>
			<p>${str_WantedTitle}</p>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<!-- 글이 없는 경우 -->
				<c:if test="${count == 0}">

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<h5>${msg_list_x}</h5>
						</div>
					</div>
				</c:if>

				<!-- 글이있는경우 -->

				<c:if test="${count != 0}">
					<c:forEach var="article" items="${WantedList}">
						<hr>

						<div class="w3-row w3-margin-bottom">
							<div class="w3-col m4 l3">
								<a href="myBusWantedRead.do?num=${article.num}"> ${article.subject}</a>
							</div>

							<p class="w3-right w3-tiny">${article.nick}|
								<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
								| ${article.readcount}
							</p>
						</div>


					</c:forEach>
				</c:if>

			</div>


			<div class="w3-third">
				<div class="w3-container">
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
				</div>
			</div>

			<div class="w3-row">
				<div class="w3-col m12">
					<form name="searchform" method="get" action="garageWantedSearch.do" onsubmit="return search()">
						<div class="w3-padding-64 w3-left">
							<select name="searchType">
								<option value="nick">${str_Writer}</option>
								<option value="subject">${str_Subject}</option>
								<option value="content">${str_Content}</option>
							</select> <input type="text" name="keyword" placeholder="${str_Search}">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="w3-row">
				<!-- Pagination -->
				<div class="w3-center w3-padding-64">
					<ul class="w3-pagination">

						<c:if test="${startPage > pageBlock}">
							<li><a href="garageWanted.do">[◀◀]</a></li>
							<li><a href="garageWanted.do?pageNum=${startPage-pageBlock}">[◀]</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><a class="w3-theme-d1">${i}</a></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="garageWanted.do?pageNum=${i}">[${i}]</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="garageWanted.do?pageNum=${startPage+pageBlock}">[▶]</a></li>
							<li><a href="garageWanted.do?pageNum=${pageCount}">[▶▶]</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- END MAIN -->
		</div>

	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
