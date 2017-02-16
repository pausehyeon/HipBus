<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<title>${str_Title}</title>
<body>

	<c:import url="../top.do"/>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp"/>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_Wanted}</h3>
			<p>${str_WantedTitle}</p>
			<hr>
			
			<!-- 
			<div class="w3-row">
			<a href="garageWantedSearch.do"><i class="w3-large fa fa-search" ></i></a>
			<input type="search" placeholder="${str_Search}" style="width:500px; height:30px;">
			</div>
			-->
			
				<div class="w3-row">
				<div class="w3-container">
					<p class="w3-third w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-third w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
					<p class="w3-border w3-third w3-padding-large w3-padding-48 w3-center">AD</p>
				</div>
			</div>
			<div class="w3-padding-tiny w3-margin"></div>
		</div>
		<div class="w3-row">
		
		
			<c:if test="${count == 0}">
			
				<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
						<h5>${msg_list_x}</h5>
						</div>
						</div>	
				</c:if>	
			<!-- 글이있는경우 -->
				
		<c:if test="${count != 0}">	
		<c:forEach var="article" items="${SearchList}">
		
				<div class="w3-row w3-margin-bottom">
					<div class="w3-twothird w3-container">
					<a href="myBusWantedRead.do?num=${article.num}">
						${article.subject}</a>
					</div>
					<div class="w3-third w3-container">
						<p class="w3-right w3-tiny">${str_Writer}:${article.nick}| ${str_Reg_Date}:${article.reg_date} 
						| ${str_ReadCount}:${article.readcount}</p>
					</div>
				</div>
				
		
		</c:forEach>
		</c:if>

		</div>
	<form name="searchform" method="post" action="garageWantedSearch.do" onsubmit="return search()">
		 <div class="w3-padding" align="left">

		
		<select name="select">
			<option value="nick">${str_Writer}</option>
			<option value="subject">${str_Subject}</option>
			<option value="content">${str_Content}</option>
		</select>
		
   		<input type="text" name="write" placeholder="${str_Search}"> <button type="submit"><i class="fa fa-search"></i> </button>
  		</div>
</form>
		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
			

	<c:if test="${startPage > pageBlock}">
		<a href="garageWantedSearch.do">[◀◀]</a>
		<a href="garageWantedSearch.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<span>[${i}]</span>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="garageWantedSearch.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">
		<a href="garageWantedSearch.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="garageWantedSearch.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>			
		<!-- 
				<ul class="w3-pagination">
				
				
				
					<li><a class="w3-theme-d1" href="#">1</a></li>
					<li><a class="w3-hover-opacity" href="#">2</a></li>
					<li><a class="w3-hover-opacity" href="#">3</a></li>
					<li><a class="w3-hover-opacity w3-hide-small" href="#">4</a></li>
					<li><a class="w3-hover-opacity w3-hide-small" href="#">5</a></li>
					<li><a class="w3-hover-opacity" href="#">»</a></li>
				</ul>
				
		-->
			</div>
		</div>
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do"/>


</body>
</html>
