<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<title>HipBus</title>
<body>
	
	<c:import url="navbar_top.jsp"/>
	<c:import url="navbar_garage.jsp"/>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>Upcoming</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<div class="w3-card-4">
					<header class="w3-container w3-padding w3-theme-l3">
						<h5>ddddd 공연일정</h5>
					</header>
					<p class="w3-right">작성자:관리자 | 작성일:2016-12-19 | 조회수:0</p>	
					<div class="w3-container w3-padding-128 w3-padding-jumbo">
						<pre>
						
						
					</pre>
					</div>

					<footer class="w3-container w3-padding-small w3-theme-l3 w3-center">
					<!-- <a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
						<i class="fa fa-arrow-up w3-margin-right"></i>위로</a> -->
					<p align="left"> <button class="w3-btn w3-light-grey">목록</button> </p>
					<p><button class="w3-btn w3-light-grey">삭제</button>
					<button class="w3-btn w3-light-grey">수정</button></p>
					
					</footer>
				</div>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"/>


</body>
</html>
