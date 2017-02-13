<!-- 유재득 11 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>


<title>${str_title}</title>
<body>

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_station.jsp" />
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_allView}</h3>
			<p>${str_allViewText}</p>
			<hr>
				<div class="w3-row">
				<div class="w3-container">
					<p class="w3-third w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-third w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-border w3-third w3-padding-large w3-padding-48 w3-center">AD</p>
				</div>
			</div>
			<a href="stationWrite.do"
				class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right"><i
				class="fa fa-pencil-square-o w3-margin-right"></i>${btn_write}</a>
		</div>
	
		<form>
		<div class="w3-row">
			<div class="w3-twothird">
				<!-- 글이없는경우 -->
				<c:if test="${count == 0}">	
				<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
						<h5>${msg_station_x}</h5>
						</div>
						</div>	
				</c:if>	
				<!-- 글이있는경우 -->
				<c:if test="${count != 0}">
				<c:forEach var="article" items="${station}">
				<div>
					<hr>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
						<a href="stationRead.do?num=${article.num}&pageNum=${pageNum}"> 
							<h5>[${article.category}] ${article.subject}</h5>
							</a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:${article.nick} | 작성일:<fmt:formatDate value="${article.reg_date}"
						type="both" pattern="yyyy-MM-dd HH:mm"/> | 조회수: ${article.readcount} | 추천수:${article.likenum }</p>
						</div>
					</div>

					</div>
					</c:forEach>
					</c:if>
				</div>
			</div>
</form>
			
		</div>
		
		<div class="w3-center ">
			<!-- Pagination -->
			
			<c:if test="${startPage > pageBlock}">
		<a class="w3-hover-black" href="station.do">◀◀</a>
		<a class="w3-hover-black" href="station.do?pageNum=${startPage-pageBlock}">◀</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<span class="w3-hover-black">${i}</span>
		</c:if>
		<c:if test="${i != currentPage}">
			<a class="w3-hover-black" href="station.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">
		<a class="w3-hover-black" href="station.do?pageNum=${startPage+pageBlock}">▶</a>
		<a class="w3-hover-black" href="station.do?pageNum=${pageCount}">▶▶</a>
	</c:if>
	
		</div>
		
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
