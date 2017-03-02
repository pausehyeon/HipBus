<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script src="/HipBus/scripts/ajax.js"></script>

<title>${str_crewbusTitle}</title>

<c:if test="${sessionScope.memEmail eq null}">
	<c:redirect url="main.do" />
</c:if>
<c:if test="${sessionScope.memEmail ne null}">
	<body class="w3-theme-l5" onload="taglist(); signoutformvalidate(); crewprofileformvalidate()">

		<!-- Navbar -->
		<c:import url="../top.do" />
		<!-- jQuery Validation Plugin -->
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
		<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>
		<!-- 태그 Ajax -->
		<script type="text/javascript">
			function taglist() {
				var params = "driver=" + "${driver}" + "&type=list";
				var tagname = document.getElementById("tagname");
				var tagrequest = new Request(
						function() {
							if (tagrequest.httpRequest.readyState == 4) {
								if (tagrequest.httpRequest.status == 200) {
									var listResult = eval("("
											+ tagrequest.httpRequest.responseText
											+ ")");
									var msg = "";
									var cnt = 0;
									var cssCnt = 0;
									for (var i = 0; i < listResult.length; i++) {
										cssCnt++;
										msg += '<span id="tag_' + cnt + '" class="w3-theme-l'+cssCnt+' w3-padding w3-round w3-tag w3-margin-top w3-margin-right">'
												+ listResult[i]
												+ '<i class="fa fa-close w3-right w3-margin-left" onclick="tagdelete(\'tag_'
												+ cnt++ + '\')"></i></span>';
										if(cssCnt==4) cssCnt=0;
									}
									tagname.innerHTML = msg;
								} else {
									tagname.innerHTML = tagrequest.httpRequest.status
											+ "오류";
								}
							} else {
								tagname.innerHTML = "<img src='${project}/view/img/loading.gif' width='100px' class='w3-center'>";
							}
						}, "myBusEditTagsResult.do", "POST", params);
				tagrequest.sendRequest();
			}

			function taginsert() {
				var tagerror = document.getElementById("tagerror");
				var taginput = document.getElementById("taginput");

				if (taginput.value == '') {
					tagerror.innerHTML = '<p class="w3-small w3-text-red">* 태그를 입력해주세요.</p>';
				} else {
					tagerror.innerHTML = '';
					var params = "driver=" + "${driver}" + "&type=insert&tag="
							+ taginput.value;
					var tagrequest = new Request(
							function() {
								if (tagrequest.httpRequest.readyState == 4) {
									if (tagrequest.httpRequest.status == 200) {
										tagerror.innerHTML = "";
										var insertResult = eval("("
												+ tagrequest.httpRequest.responseText
												+ ")");
										if (insertResult == 0) {
											tagerror.innerHTML = "<p>태그 추가에 실패하였습니다.<br>잠시 후 다시 시도해 주세요.</p>";
										} else if (insertResult == 1) {
											taglist();
										}
									} else {
										tagerror.innerHTML = tagrequest.httpRequest.status
												+ "오류";
									}
								} else {
									tagerror.innerHTML = "<img src='${project}/view/img/loading.gif' width='100px' class='w3-center'>";
								}
							}, "myBusEditTagsResult.do", "POST", params);
					tagrequest.sendRequest();
				}
			}
			function tagdelete(tag_num) {
				var tagerror = document.getElementById("tagerror");
				var params = "driver=" + "${driver}" + "&type=delete&tag="
						+ $('#' + tag_num).text();
				var tagrequest = new Request(
						function() {
							if (tagrequest.httpRequest.readyState == 4) {
								if (tagrequest.httpRequest.status == 200) {
									tagerror.innerHTML = "";
									var deleteResult = eval("("
											+ tagrequest.httpRequest.responseText
											+ ")");
									if (deleteResult == 0) {
										tagerror.innerHTML = "<P>태그 삭제에 실패하였습니다.<br>잠시 후 다시 시도해 주세요</p>";
									} else if (deleteResult > 0) {
										taglist();
									}
								} else {
									tagerror.innerHTML = tagrequest.httpRequest.status
											+ "오류";
								}
							} else {
								tagerror.innerHTML = "<img src='${project}/view/img/loading.gif' width='100px' class='w3-center'>";
							}
						}, "myBusEditTagsResult.do", "POST", params);
				tagrequest.sendRequest();
			}
		</script>


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
						<div class="w3-container w3-center w3-black">
							<h2>
								<i class="fa fa-pencil"></i>&nbsp; ${str_editProfile}
							</h2>
						</div>
						<div class="w3-content w3-padding-64">
							<h5>
								<i class="fa fa-pencil"></i><b> ${str_editProfile} </b>
							</h5>

							<div class="w3-row-padding">
								<form name="crewprofileform" enctype="multipart/form-data" action="crewBusEditPro.do?driver=${driver}" method="post" class="w3-container">
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										<div class="w3-row-padding">
											<c:if test="${crew.imglocation eq null}">
												<div class="w3-col m4 w3-center">
													<img src="${project}/view/img/CrewBusLogo_pale_sq.png" class="w3-circle" width="100%" alt="profile">
												</div>
											</c:if>
											<c:if test="${crew.imglocation ne null}">
												<div class="w3-col m4 w3-center">
													<img src="${project}/hipbusSave/${crew.imglocation}" class="w3-circle" width="100%" alt="profile">
												</div>
											</c:if>
											<div class="w3-col m8">
												<input name="upload" class="w3-input" type="file">
												<label for="upload" class="w3-validate w3-label">Profile Picture</label>
											</div>
										</div>
										<div class="w3-text-red w3-small w3-right"></div>
									</div>
									<div class="w3-col m12 w3-margin-top">
										<input name="ex_crewname" type="hidden" value="${crew.crewname}">
										<input name="crewname" type="text" value="${crew.crewname}" class="w3-input">
										<label class="w3-validate w3-label">${str_crewname}</label>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										<a class="w3-right w3-small" href="https://www.youtube.com/account_advanced"> <i class="fa fa-question-circle"></i> ${str_howToFindChannelid}
										</a>
										<input name="channel_id" value="${channel_id}" class="w3-input" type="text">
										<label class="w3-validate w3-label">${str_channel_id}</label>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom w3-center">
										<input type="submit" value="${str_editModifyBtn}" class="w3-btn w3-padding w3-black w3-margin">
									</div>
								</form>
							</div>
						</div>
						<!-- 회원관리 -->
						<c:if test="${leader eq 2}">
							<hr>
							<!-- 이부분은 크루장일 경우에만 보여야 한다 -->
							<div class="w3-content w3-padding-64">
								<div class="w3-row">
									<h5>
										<i class="fa fa-group"></i><b> Member Management </b>
									</h5>
								</div>
								<form name="crewinputform" action="crewBusEditPro.do" method="post">
									<table class="w3-table w3-striped w3-white">
										<tr class="w3-black">
											<th>${str_crewMemEmail}</th>
											<th>${str_crewMemNick}</th>
											<th colspan="2">${str_crewMemManage}</th>
										</tr>

										<c:if test="${crewMember.size() ne 0}">
											<c:forEach var="crew" items="${crewMember}">
												<c:if test="${crew.email ne sessionScope.memEmail}">
													<tr>
														<td>${crew.email}</td>
														<td>${crew.nick}</td>
														<td><a class="w3-hover-black w3-padding" style="text-decoration: none" href="crewBusSignOverPro.do?email=${crew.email}&driver=${driver}">${str_crewMasterBtn}</a></td>
														<td><a class="w3-hover-black w3-padding" style="text-decoration: none" href="crewBusEjectPro.do?email=${crew.email}&driver=${driver}&hidden=1">${str_crewMemEjectBtn}</a></td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${crewMember.size() eq 0}">
											<tr>
												<th colspan="3">${str_crewMemNoneMsg}</th>
											</tr>
										</c:if>

									</table>
								</form>
							</div>
						</c:if>
						<hr>
						<div class="w3-content w3-padding-64">
							<div class="w3-row">
								<h5>
									<i class="fa fa-hashtag"></i><b> ${str_editTag} </b>
								</h5>
							</div>
							<div class="w3-row-padding w3-margin-bottom">
								<div class="w3-col s3 m3">
									<input id="taginput" type="text" class="w3-input">
								</div>
								<div class="w3-col s1 m1">
									<i class="fa fa-plus w3-xlarge" onclick="taginsert()"></i>
								</div>
							</div>
							<div class="w3-content w3-margin-top">
								<div id="tagerror"></div>
								<div id="tagname"></div>
							</div>
						</div>
						<!-- 크루탈퇴 -->
						<hr>
						<div class="w3-content w3-padding-64">
							<h5>
								<i class="fa fa-sign-out"></i><b> ${str_crewSignOut}</b>
							</h5>

							<p class="w3-responsive">
								<i class="fa fa-check"></i>
								<c:if test="${leader ne 2}">
									<!-- 크루장이 아닌 경우 : 기본 탈퇴 메시지 -->
									${str_crewSignOutmsg1}
								</c:if>
								<c:if test="${leader eq 2 and crewMember.size() gt 1}">
									<!-- 크루장이고 멤버가 남아있는 경우 : 권한 인계 메시지, submit 불가능하게 -->
									${str_crewSignOutmsg2}
									<script type="text/javascript">
									$(document).ready(function(){
										document.getElementById('signoutformSubmit').disabled = true;
										document.getElementById('signoutcheck').disabled = true;
									});	
									</script>
								</c:if>
								<c:if test="${leader eq 2 and crewMember.size() le 1}">
									<!-- 크루장이고 멤버가 크루장만 남은 경우 : 크루 삭제 경고 메시지 -->
									${str_crewSignOutmsg3}
								</c:if>
							</p>
							<form id="signoutform" class="w3-container" action="crewBusDeletePro.do" method="post">
								<input name="signoutcheck" id="signoutcheck" class="w3-check" type="checkbox">
								<input type="hidden" name="crewid" value="${driver}">
								<label class="w3-validate">${str_agreeSignOut}</label>
								<p id="signOutCheckError"></p>
								<p class="w3-center">
									<input type="submit" id="signoutformSubmit" value="${str_signOutbtn}" class="w3-btn w3-center">
								</p>
							</form>
						</div>
					</div>
					<!-- 여기까지 -->
					<!-- End Middle Column -->

				</div>

				<!--  Right Column -->
				<c:import url="../crewBusRight.do?driver=${driver}"></c:import>
				<!-- End Right Column -->

				<!-- End Grid -->
			</div>

			<!-- End Page Container -->
		</div>

		<!-- Footer -->
		<c:import url="../bottom.do" />

	</body>
</c:if>
</html>
