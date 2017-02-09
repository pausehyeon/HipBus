<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

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
						<h3>2017년 새해 이벤트 공지</h3>
						<p class="w3-right">작성자:관리자 | 작성일:2016-12-19 | 조회수:0</p>
					</header>

					<div class="w3-container w3-padding-128 w3-padding-jumbo">
	
					</div>

					<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
						<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-thumbs-up w3-margin-right"></i>${str_Recommend}</a> <a href="#"
							class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-arrow-up w3-margin-right"></i>${str_Top}</a>
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