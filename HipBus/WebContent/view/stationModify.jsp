<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<script src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
<title>${str_title}</title>
<body>

	<c:import url="../top.do" />
	

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
	<%@ include file="navbar_station.jsp"%>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_write}</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<form name="writeform" method="post" action="stationModifyPro.do?num=${article.num}">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<c:choose>
			<c:when test="${article.category == 1}">
			<h3>${str_beat}</h3>
			</c:when>
			<c:when test="${article.category == 2}">
			<h3>${str_rab}</h3>
			</c:when>
			<c:when test="${article.category == 3}">
			<h3>${str_mixTape}</h3>
			</c:when>
			<c:when test="${article.category == 4}">
			<h3>${str_vocal}</h3>
			</c:when>
			<c:when test="${article.category == 5}">
			<h3>${str_gasa}</h3>
			</c:when>
			<c:when test="${article.category == 6}">
			<h3>${str_freeBoard}</h3>
			</c:when>
							</c:choose>
							<input name="subject" class="w3-input" type="text" required value="${article.subject}">
							<label class="w3-label w3-validate" >${str_writeName}</label><br>
							<br>
						</header>
						
						<div class="w3-row">
							<textarea name="content" id="editor" class="w3-input" required>${article.content}</textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							<!-- ^ ckeditor 연결 모듈 -->
						</div>
						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" value="${btn_modifyComplete}">
							<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i class="fa fa-mail-reply w3-margin-right"></i>${btn_modifyCancel}</a>
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
