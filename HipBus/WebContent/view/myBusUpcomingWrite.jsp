<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>

<title>HipBus - Upcoming</title>


<body class="w3-theme-l5">


	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<header
					class="w3-container w3-padding w3-black w3-margin-left w3-margin-right">
					<h3 style="font-family: impact">Upcoming</h3>
				</header>
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">

					<div>
						제목<br>
						<textarea placeholder="제목" rows="1" cols="81"
							style="resize: none; wrap: hard; min-width: 670px; max-width: 670px"></textarea>
					</div>
					<br>

					<div class="w3-padding-16 w3-card w3-light-grey"></div>

					<div class="ckeditor">
						<div>장소</div>
						<br>
						<hr style="border: 1px outset lightgray">
						<br>
						<div>일시</div>
						<br>
						<hr style="border: 1px outset lightgray">
						<br>
						<div>출연진</div>
						<br>
						<hr style="border: 1px outset lightgray">
						<br>
						<div>시간</div>
						<br>
						<hr style="border: 1px outset lightgray">
						<br>

						<textarea class="w3-input" id="editor" cols="1" rows="15"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('editor',
								{
									height : '350px', // 입력창의 높이
									startupFocus : false
								}
							);
						</script>
					</div>
					<footer class="w3-container w3-padding-small w3-white w3-center">
						<p>
							<button class="w3-btn w3-border w3-blue">등록</button>
						</p>
						<i class="glyphicon glyphicon-search"></i>
					</footer>
				</div>
			</div>



			<!-- Right Column -->
			<c:import url="../myBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
