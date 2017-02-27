<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>


<title>${str_Title}</title>
<body onload="writeformvalidate()">

	<c:import url="../top.do" />
	<!-- jQuery Validation Plugin -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
	<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_News}</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">

				<div class="w3-card-4">

					<form name="writeform" method="post" enctype="multipart/form-data" action="garageNewsWritePro.do">

						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<input name="subject" type="text" required="required" placeholder="${str_Subject}" class="w3-input">
						</header>
						<div class="w3-row">
							<textarea name="content" id="editor" required class="w3-input"></textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							<!-- ^ ckeditor 연결 모듈 -->
						</div>

						<div class="w3-row w3-padding-jumbo w3-theme-l3">
							<span>* <i class="fa fa-image"></i> &nbsp;${str_insertThumbnail}
							</span>
							<input name="upload" type="file" accept="image/*" required>
							<p id="uploadmsg"></p>
						</div>
						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" id="btn" value="&#xf00c; ${btn_Write}">

							<!-- &#xf00c;는 fontawesome의 fa-check 아이콘. submit 버튼 안에 <i></i>태그를 넣을 수 없어서. -->
							<a href="garageNews.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-mail-reply"></i>&nbsp;${btn_Cancel}
							</a>
						</footer>
					</form>
				</div>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
