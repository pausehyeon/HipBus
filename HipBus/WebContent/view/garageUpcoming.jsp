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
			<p>각 Bus의 공연일정 게시글을 모아서 보여줍니다.</p>
			<hr>
			<!-- 이 버튼은 관리자에게만 보임 -->
			<a href="#"
				class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right"><i
				class="fa fa-pencil-square-o w3-margin-right"></i>관리하기</a>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<!-- 여기서부터 -->
				<div class="w3-row-padding w3-padding-16 w3-center">
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster1.jpg" alt="poster"
							style="width: 100%">
						<h4>The Perfect Sandwich, A Real NYC Classic</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster6.jpg" alt="poster"
							style="width: 100%">
						<h4>Let Me Tell You About This Steak</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster2.jpg" alt="poster"
							style="width: 100%">
						<h4>Cherries, interrupted</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster3.jpg" alt="poster"
							style="width: 100%">
						<h4>Once Again, Robust Wine and Vegetable Pasta</h4>
					</div>

					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster4.jpg" alt="poster"
							style="width: 100%">
						<h4>All I Need Is a Popsicle</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster5.jpg" alt="poster"
							style="width: 100%">
						<h4>Salmon For Your Skin</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster6.jpg" alt="poster"
							style="width: 100%">
						<h4>The Perfect Sandwich, A Real Classic</h4>
					</div>
					<div class="w3-col m4 l3">
						<img src="${project}/view/img/poster6.jpg" alt="poster"
							style="width: 100%">
						<p class="w3-center w3-tiny">
							작성자:Jihyeon<br> 작성일:2016-12-19 | 조회수: 0
						</p>
						<h4>Le French</h4>
					</div>
				</div>

				<!-- 여기까지만 -->
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
					<li><a class="w3-theme-d1" href="#">1</a></li>
					<li><a class="w3-hover-opacity" href="#">2</a></li>
					<li><a class="w3-hover-opacity" href="#">3</a></li>
					<li><a class="w3-hover-opacity w3-hide-small" href="#">4</a></li>
					<li><a class="w3-hover-opacity w3-hide-small" href="#">5</a></li>
					<li><a class="w3-hover-opacity" href="#">»</a></li>
				</ul>
			</div>
		</div>
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"/>


</body>
</html>
