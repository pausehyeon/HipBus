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
			<h3>NEWS</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<form name="writeform" method="post">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<input class="w3-input" type="text" required> <label
								class="w3-label w3-validate">글제목</label> <a href="#"
								class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i
								class="fa fa-image w3-margin-right"></i>이미지 첨부</a>
						</header>

						<div class="w3-container w3-padding-32 w3-padding-jumbo">
							<textarea class="w3-input" rows="15"></textarea>
						</div>

						<footer
							class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit"
								class="w3-btn w3-padding w3-theme-d1 w3-margin-left"
								value="작성완료"> <a href="#"
								class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
								class="fa fa-mail-reply w3-margin-right"></i>작성취소</a>
						</footer>
					</div>
				</form>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"/>


</body>
</html>
