<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>

<title>${str_Title}</title>
<body>

	<c:import url="../top.do" />
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp"/>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_News}</h3>
			<p>${str_NewsTitle}</p>
			<hr>
			<!-- 이 버튼은 관리자에게만 보임 -->
			<c:if test="${dto.mem_level == 3 }">
			<a href="garageNewsWrite.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right">	<i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Write}</a>
			</c:if>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
			<!-- 글이없는경우 -->
				<c:if test="${count == 0}">
			
				<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
						<h5>${msg_list_x}</h5>
						</div>
						</div>	
				</c:if>	
				
				<!-- 글이있는경우 -->
				
				<c:if test="${count != 0}">	
				<c:forEach var="article" items="${NewsList}">
				<div>
					<hr>
				
				<div class="w3-row w3-margin-bottom">
				<c:if test="${sessionScope.memEmail ne null}">
					<div class="w3-twothird w3-container">
						<a href="garageNewsRead.do?num=${article.num}&pageNum=${pageNum}">${article.subject}</a>
					</div>
					<div class="w3-third w3-container">
						<p class="w3-right w3-tiny">${str_Writer}:${article.nick} | 
						${str_Reg_Date}:${article.reg_date} | ${str_ReadCount}:${article.readcount}</p>
						</div>
					</c:if>
				<c:if test="${sessionScope.memEmail eq null}">
					<div class="w3-twothird w3-container">
						<a href="garageNews.do" onclick="msg_login()">${article.subject}</a>
						
					</div>
					<div class="w3-third w3-container">
						<p class="w3-right w3-tiny">${str_Writer}:${article.nick} | 
						${str_Reg_Date}:${article.reg_date} | ${str_ReadCount}:${article.readcount}</p>
						</div>
					</c:if>
					</div>	
				
					</div>
					</c:forEach>
					</c:if>
				
		
					
					</div>
				</div>
				
				


			
			<div class="w3-third">
				<div class="w3-container">
					<p class="w3-border w3-padding-small w3-padding-128 w3-center">AD</p>
					<p class="w3-border w3-padding-small w3-padding-48 w3-center">AD</p>
					<p class="w3-border w3-padding-small w3-padding-128 w3-center">AD</p>
				</div>
			</div>
		</div>

		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
				<ul class="w3-pagination">
				
					
	<c:if test="${startPage > pageBlock}">
		<a href="garageNews.do">[◀◀]</a>
		<a href="garageNews.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<span>[${i}]</span>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="garageNews.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">
		<a href="garageNews.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="garageNews.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>			

				
					<!-- <li>
						<a class="w3-theme-d1" href="#">1</a>
					</li>
					<li>
						<a class="w3-hover-opacity" href="#">2</a>
					</li>
					<li>
						<a class="w3-hover-opacity" href="#">3</a>
					</li>
					<li>
						<a class="w3-hover-opacity w3-hide-small" href="#">4</a>
					</li>
					<li>
						<a class="w3-hover-opacity w3-hide-small" href="#">5</a>
					</li>
					<li>
						<a class="w3-hover-opacity" href="#">»</a>
					</li>-->
					
				</ul>
			</div>
	
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
