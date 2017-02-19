<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>

<title>${str_upcomingTitle}</title>


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
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<form name="writeform" action="myBusWantedWritePro.do?driver=${driver}" method="post" enctype="multipart/form-data">
						<div class="w3-container w3-center w3-black">
							<h3>
								<i class="fa fa-calendar"></i>&nbsp; ${str_upcoming}
							</h3>
						</div>
						<div class="w3-row-padding w3-padding-12">
							<!-- 기본값을 오늘로 설정 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
							<input name="duedate" type="date" value="${today}" required="required" class="w3-theme-l3 w3-btn">
							<br>
							<label class="w3-label w3-validate">${str_duedate}</label>
						</div>
						<div class="w3-row-padding w3-padding-12">
							<input name="subject" type="text" required="required" autofocus="autofocus" class="w3-input">
							<label class="w3-label w3-validate">${str_subject}</label>
						</div>
						<div class="w3-row-padding w3-padding-32">
							<textarea name="content" id="editor" required class="w3-input"></textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
						</div>
						<div class="w3-row-padding w3-padding-jumbo w3-theme-l3">
							<span>* <i class="fa fa-image"></i> &nbsp;${str_insertThumbnail}
							</span>
							<input name="upload" type="file" accept="image/*" required>
						</div>
						<div class="w3-row-padding w3-white w3-center">
							<p>
								<button type="submit" class="w3-btn">${str_modBoard}</button>
							</p>
						</div>
					</form>
				</div>
			</div>

			<!-- Right Column -->
			<c:import url="../myBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
