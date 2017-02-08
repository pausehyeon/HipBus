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
			<a href="station_write.do"
				class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right"><i
				class="fa fa-pencil-square-o w3-margin-right"></i>${str_write}</a>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<!-- 인기글 -->
				<div>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>인기글1</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수:0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>인기글2</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:누구 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>인기글3</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무개 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>
				</div>


				<!-- 일반글 -->
				<div>
					<hr>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[비트] 비트</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무나 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>2016 서울 힙합 페스티벌 관련 공지</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수:0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[잡담] Fiesta de Alguien
									예매합시다</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:누구 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="mainstation_readstation_read.do"><h5>[가사] 가사 평
									좀</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무개 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[비트] 비트</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무나 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>2016 서울 힙합 페스티벌 관련 공지</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수:0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[잡담] Fiesta de Alguien
									예매합시다</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:누구 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[가사] 가사 평 좀</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무개 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>

					<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
							<a href="station_read.do"><h5>[비트] 비트</h5></a>
						</div>
						<div class="w3-third w3-container">
							<p class="w3-right w3-tiny">작성자:아무나 | 작성일:2016-12-19 | 조회수: 0</p>
						</div>
					</div>
				</div>
			</div>

			<div class="w3-third">
				<div class="w3-container">
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
					<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
				</div>
			</div>
		</div>

		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
				<ul class="w3-pagination">
					<li><a class="w3-black" href="#">1</a></li>
					<li><a class="w3-hover-black" href="#">2</a></li>
					<li><a class="w3-hover-black" href="#">3</a></li>
					<li><a class="w3-hover-black w3-hide-small" href="#">4</a></li>
					<li><a class="w3-hover-black w3-hide-small" href="#">5</a></li>
					<li><a class="w3-hover-black" href="#">»</a></li>
				</ul>
			</div>
		</div>
		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
