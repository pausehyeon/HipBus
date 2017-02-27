<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

<title>${str_title}</title>
<body onload="writeformvalidate()">
	<c:import url="../top.do" />
	<!-- jQuery Validation Plugin -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
	<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<%@ include file="navbar_station.jsp"%>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_write}</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<form name="writeform" method="post" action="stationWritePro.do?email=${sessionScope.memEmail}">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<select class="w3-left w3-margin-top w3-margin-bottom" name="category">
								<option value="1">${str_beat}</option>
								<option value="2">${str_rab}</option>
								<option value="3">${str_mixTape}</option>
								<option value="4">${str_vocal}</option>
								<option value="5">${str_gasa}</option>
								<option value="6">${str_free}</option>
							</select>
							
							<input name="subject" type="text" placeholder="${str_writeName}" required="required" class="w3-input">
						
						</header>

						<div class="w3-row">
							<textarea name="content" id="editor" class="w3-input" required="required">	
							</textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							<!-- ^ ckeditor 연결 모듈 -->
						</div>
						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" value="${btn_complete}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
							<a href="station.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="return backAlert()">
								<i class="fa fa-mail-reply w3-margin-right"></i>${btn_cancel}</a>
						</footer>
					</div>
				</form>
			</div>

		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
