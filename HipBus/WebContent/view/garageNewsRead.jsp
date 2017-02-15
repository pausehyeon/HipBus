<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>

<title>${str_title}</title>
<body>
	
	<c:import url="../top.do"/>

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp"/>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_News}</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<div class="w3-card-4">
					<header class="w3-container w3-padding-jumbo w3-theme-l3">
						<h3>${article.subject}</h3>
						<p class="w3-right">${str_Writer}:${article.nick} | ${str_Reg_Date}:${article.reg_date} | ${str_ReadCount}:${article.readcount}</p>
					</header>

					<div class="w3-container w3-padding-128 w3-padding-jumbo">
					
					<pre>${article.content}</pre>
	
					</div>

					<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
						 <a href="garageNews.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-align-justify w3-margin-right"></i>${btn_list}</a>
						<c:if test="${dto.mem_level == 3 }">
						<a href="garageNewsModify.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
						<i class="fa fa-cog w3-margin-right"></i>${btn_modify}</a>
						<button type="button" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="newsDeleteCheck()">
						<i class="fa fa-cut w3-margin-right"></i>${btn_delete}</button>
						<input type="hidden" value="${article.num}" id="num">
						<!--  <a href="garageNewsDeletePro.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="deleteCheck()">
						<i class="fa fa-cut w3-margin-right"></i>${btn_delete}</a>-->
						</c:if>
					</footer>
				</div>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do"/>


</body>
</html>