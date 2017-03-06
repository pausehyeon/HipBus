<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>

<title>${str_upcomingTitle}</title>


<body class="w3-theme-l5" onload="withoutuploadvalidate()">

	<!-- Navbar -->
	<c:import url="../top.do" />
	<!-- jQuery Validation Plugin -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
	<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<form name="writeform" action="crewBusWantedModifyPro.do?num=${num}&driver=${driver}" method="post" enctype="multipart/form-data">
						<div class="w3-container w3-center w3-theme-d5">
							<h3>
								<i class="fa fa-bullhorn"></i>&nbsp; ${str_wanted}
							</h3>
						</div>
						<div class="w3-row-padding w3-padding-12">
							<div class="w3-col m4 w3-margin-bottom">
								<fmt:formatDate var="duedate" value="${article.duedate}" pattern="yyyy-MM-dd" />
								<input name="duedate" type="date" value="${duedate}" required="required" class="w3-input">
								<label class="w3-label w3-validate">${str_duedate}</label>
								<br>
							</div>
							<div class="w3-col m12 w3-margin-bottom">
								<input name="subject" type="text" value="${article.subject}" required="required" autofocus="autofocus" class="w3-input">
								<label class="w3-label w3-validate">${str_subject}</label>
							</div>
							<div class="w3-col m12">
								<textarea name="content" id="editor" required class="w3-input">${article.content}</textarea>
								<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							</div>
						</div>
						<div class="w3-row-padding w3-padding-32">
							<c:if test="${(article.imglocation ne null) and (article.imglocation ne '') }">
								<!-- 기존 이미지 파일이 있을 때 -->
								<div class="w3-col m3">
									<img src="${project}/hipbusSave/${article.imglocation}" alt="wanted" width="100%" class="w3-opacity-min w3-circle w3-padding">
								</div>
								<div class="w3-col m9">
									<br><br>
									<span class="w3-text-teal"><i class="fa fa-image"></i> &nbsp;${str_selectPoster} </span>
									<input name="upload" type="file" accept="image/*">
								</div>
							</c:if>
							<c:if test="${(article.imglocation eq null) or (article.imglocation eq '') }">
								<!-- 기존 이미지 파일이 없을 때 -->
								<div class="w3-col m12">
									<span class="w3-text-teal"><i class="fa fa-image"></i> &nbsp;${str_selectPoster} </span>
									<input name="upload" type="file" accept="image/*">
								</div>
							</c:if>

						</div>
						<div class="w3-row-padding w3-center">
							<p>
								<button type="submit" class="w3-btn"><i class="fa fa-check w3-margin-rignt"></i> ${str_modifyWanted}</button>
							</p>
						</div>
					</form>
				</div>
			</div>

			<!-- Right Column -->
			<c:import url="../crewBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
