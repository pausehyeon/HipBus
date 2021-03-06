<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>


<title>${str_Title}</title>
<body>

	<c:import url="../top.do" />
	<c:if test="${sessionScope.memEmail eq null}">
		<meta http-equiv="refresh" content="0;url=garageNews.do">
	</c:if>

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

					<form name="writeform" method="post" onsubmit="return newsModifyCheck(this);" action="garageNewsModifyPro.do?num=${article.num}" enctype="multipart/form-data">

						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<input name="subject" type="text" required class="w3-input" value="${article.subject}"> <label class="w3-label w3-validate">${str_Subject}</label>
						</header>

						<div class="w3-row">
							<textarea name="content" id="editor" class="w3-input">${article.content}</textarea>
							<script type="text/javascript" src="${project}/scripts/ckeditor/insertCkeditor.js"></script>
							<!-- ^ ckeditor 연결 모듈 -->
						</div>

						<div class="w3-row-padding w3-padding-32">
							<div class="w3-col s2 m2">
								<img src="${project}/hipbusSave/${article.imglocation}" alt="poster" width="100%" class="w3-opacity-min">
							</div>
							<div class="w3-col s10 m10">
								<br><br>
								<span class="w3-text-teal"><i class="fa fa-image"></i> &nbsp;${str_insertThumbnail} </span>
								<input name="upload" type="file" accept="image/*">
							</div>
						</div>
						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit" class="w3-btn w3-padding w3-theme-d1 w3-margin-left" value="&#xf00c; ${btn_mod}">
							<!-- &#xf00c;는 fontawesome의 fa-check 아이콘. submit 버튼 안에 <i></i>태그를 넣을 수 없어서. -->
							<a href="garageNews.do" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-mail-reply"></i>&nbsp;${btn_mod_cancel}
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
