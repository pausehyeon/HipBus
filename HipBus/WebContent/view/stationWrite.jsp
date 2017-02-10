<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

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
				<form name="writeform" method="post">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<select class="w3-left" name="category" style="margin: 2px">
								<option value="1">${str_allView}</option>
								<option value="2">${str_beat}</option>
								<option value="3">${str_rab}</option>
								<option value="4">${str_mixTape}</option>
								<option value="5">${str_vocal}</option>
								<option value="6">${str_gasa}</option>
								<option value="7">${str_free}</option>
							</select>
							<input class="w3-input" type="text" required>
							<label class="w3-label w3-validate">${str_writeName}</label><br>
							<br>
							<input type="file" name="filename1" size=40>
							<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i class="fa fa-image "></i>${str_img}</a>
						</header>
						</form>
						
						<div>
							<textarea class="w3-input" id="holder"></textarea>
							<script type="text/javascript">
								CKEDITOR
										.replace(
												'holder',
												{
													enterMode : "2",
													height : '350px', // 입력창의 높이
													filebrowserImageUploadUrl : "imageUpload.do" //이미지 업로드를 위해 핸들러 연결해줘야 함. 나중에 수정할게요.
												//http://localhost:8080/HipBus/imageUpload.do?CKEditor=editor&CKEditorFuncNum=1&langCode=ko처럼 넘어 감.
												});
							</script>
						</div>

						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" value="${btn_complete}">
							<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i class="fa fa-mail-reply w3-margin-right"></i>${btn_cancel}</a>
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
