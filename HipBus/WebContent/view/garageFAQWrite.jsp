<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<script type="text/javascript">

</script>
<title>${str_Title}</title>
<body>

	<c:import url="../top.do"/>
	
<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp"/>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>${str_FAQWrite}</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<form name="writeform" method="post" onsubmit="return newsWriteCheck(this);" action="garageFAQWritePro.do">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<input class="w3-input" type="text" required name="subject"> <label
								class="w3-label w3-validate">${str_Subject}</label>
						</header>

						<div class="w3-row">
							<textarea name="content" id="editor" required class="w3-input"></textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							<!-- ^ ckeditor 연결 모듈 -->
						</div>

						<footer
							class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" 
							value="&#xf00c; ${btn_Write}"> <a href="garageFAQ.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
								<i class="fa fa-mail-reply"></i>&nbsp;${btn_Cancel}
							</a>
						</footer>
					</div>
				</form>
			</div>
		</div>

		<!-- END MAIN -->
	</div>


		<!-- Footer -->
	<c:import url="../bottom.do"/>

</body>
</html>