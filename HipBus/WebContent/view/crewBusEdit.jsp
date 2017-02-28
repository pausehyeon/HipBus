<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script src="/HipBus/scripts/ajax.js"></script>

<title>${str_crewbusTitle}</title>

<script type="text/javascript">		
	function taglist() {
		var params = "driver=" +"${driver}" + "&type=list";		
		var tagname = document.getElementById("tagname");
		var tagrequest = new Request(function() {
			if (tagrequest.httpRequest.readyState == 4) {
				if (tagrequest.httpRequest.status == 200) {				 					
 					var listResult = eval("("+tagrequest.httpRequest.responseText+")");
 					var msg = "";
 					for( var i=0; i<listResult.length; i++) {
 						msg += '<span class="w3-theme-d5 w3-padding w3-round w3-tag w3-margin-top w3-margin-right">'
 							+ listResult[i]+'</span>'; 							
					}
 					tagname.innerHTML = msg; 					
				} else {
					tagname.innerHTML = tagrequest.httpRequest.status + "오류";
				}
			} else {
				tagname.innerHTML = "통신중...";
			}
		}, "myBusEditTagsResult.do", "POST", params);
		tagrequest.sendRequest();	
	}
	
	function taginsert() {		
		var tagerror = document.getElementById("tagerror");
		var taginput = document.getElementById("taginput");		
		var params = "driver=" + "${driver}" + "&type=insert&tag=" + taginput.value;
		var tagrequest = new Request(function() {
			if (tagrequest.httpRequest.readyState == 4) {
				if (tagrequest.httpRequest.status == 200) {
					tagerror.innerHTML="";					 					
 					var insertResult = eval("("+tagrequest.httpRequest.responseText+")");
 					if ( insertResult == 0 ) {
 						tagerror.innerHTML = "<p>태그 추가에 실패하였습니다.<br>잠시 후 다시 시도해 주세요.</p>";
 					} else if ( insertResult == 1) {
 						taglist();	
 					}					
				} else {
					tagerror.innerHTML = tagrequest.httpRequest.status + "오류";
				} 							
			} else {
				tagerror.innerHTML = "통신중...";
			}
		}, "myBusEditTagsResult.do", "POST", params);
		tagrequest.sendRequest();			
	} 

	/* 닉네임 중복체크 */
	function verifynick() {
		var params = "nick=" + $('input[name="nick"]').val();
		var request = new Request(function() {
			if (request.httpRequest.readyState == 4) {
				if (request.httpRequest.status == 200) {
					if (request.httpRequest.responseText.trim() == "0") {
						$('#nickresult').removeClass('w3-text-red').addClass(
								'w3-text-blue').text("${str_userNameOk}");
					} else {
						$('#nickresult').removeClass('w3-text-blue').addClass(
								'w3-text-red').text("${str_userNameNo}");
					}
				} else {
					$('#nickresult').text('오류');
				}
			} else {
				console.log("통신중...");
			}
		}, "verifyNickResult.do", "POST", params);
		request.sendRequest();
	}
	$(document)
			.ready(
					function() {
						//이메일 길이 제한
						$('input[name="nick"]')
								.keyup(
										function() {
											var maxlength = 10;
											if ($(this).val().length > maxlength) {
												$('#nickresult')
														.addClass('w3-text-red')
														.text(
																maxlength
																		+ "${str_emailLength}");
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				maxlength));
											}
										});

						//비밀번호 제한 : 반드시 숫자와 알파벳을 조합해야하며 길이가 5글자 이상, 10글자 이하여야.
						$('input[name="passwd"]')
								.keyup(
										function() {
											if (isNaN(Number($(this).val()))) {
												//숫자가 아닌 경우
												//숫자가 아니면서 숫자가 하나도 없는 경우
												var containsNumber = false;
												for (var i = 0; i < 10; i++) {
													if ($(this).val()
															.indexOf(i) != -1)
														containsNumber = true;
												}
												if (containsNumber == false) {
													$('#passwdresult')
															.removeClass(
																	'w3-text-blue')
															.addClass(
																	'w3-text-red')
															.text(
																	"${str_passwordError1}");
												} else if ($(this).val().length < 5) {
													//길이가 짧은 경우
													var minlength = 5;
													$('#passwdresult')
															.removeClass(
																	'w3-text-red')
															.addClass(
																	'w3-text-blue')
															.text(
																	'*'
																			+ minlength
																			+ "${str_passswordError2}");
												} else if ($(this).val().length > 10) {
													//길이가 너무 긴 경우
													var maxlength = 10;
													$('#passwdresult')
															.removeClass(
																	'w3-text-red')
															.addClass(
																	'w3-text-blue')
															.text(
																	"${str_passwordError3}"
																			+ maxlength
																			+ "${str_passwordError4}");
													$(this)
															.val(
																	$(this)
																			.val()
																			.substring(
																					0,
																					maxlength));
												} else {
													$('#passwdresult')
															.removeClass(
																	'w3-text-red')
															.addClass(
																	'w3-text-blue')
															.text(
																	"${str_passwordOk}");
												}
											} else {
												//숫자인 경우
												$('#passwdresult')
														.removeClass(
																'w3-text-blue')
														.addClass('w3-text-red')
														.text(
																"${str_passwordError5}");
											}
										});

						//비밀번호 확인
						$('input[name="repasswd"]').keyup(
								function() {
									if ($(this).val() == $(
											'input[name="passwd"]').val()) {
										$('#repasswdresult').removeClass(
												'w3-text-red').addClass(
												'w3-text-blue').text(
												"${str_passwordCheckOk}");
									} else {
										$('#repasswdresult').removeClass(
												'w3-text-blue').addClass(
												'w3-text-red').text(
												"${str_passwordCheckNo}");
									}
								});

					});
//-->
</script>

	<body class="w3-theme-l5" onload="taglist()">

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
				<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
				<!-- End Left Column -->

				<!-- Middle Column -->
				<!-- 여기서부터 -->
				<div class="w3-col m7">
					<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
						<div class="w3-container w3-center w3-theme-l1">
							<h2>
								<i class="fa fa-pencil"></i>&nbsp; ${str_editProfile}
							</h2>
						</div>
						<div class="w3-content w3-padding-64">
							<h5>
								<i class="fa fa-pencil"></i><b> ${str_editProfile} </b>
							</h5>

							<div class="w3-row-padding">
								<form id="inputform" enctype="multipart/form-data" action="crewBusEditPro.do?driver=${driver}" method="post" class="w3-container">
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										
										<div class="w3-row-padding">
											<c:if test="${member.imglocation eq null}">
												<div class="w3-col m4 w3-center">
													<img src="${project}/view/img/HipBusLogo_pale_sq.png" class="w3-circle" width="100%" alt="profile">
												</div>
											</c:if>
											<c:if test="${member.imglocation ne null}">
												<div class="w3-col m4 w3-center">
													<img src="${project}/hipbusSave/${member.imglocation}" class="w3-circle" width="100%" alt="profile">
												</div>
											</c:if>
											<div class="w3-col m8">
												<input name="upload" class="w3-input" type="file">
											</div>
										</div>
										<div class="w3-text-red w3-small w3-right"></div>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										<label>${str_userName}</label>
										<input name="nick" value="${member.nick}" class="w3-input" type="text" onkeyup="verifynick()">
										<div class="w3-text-red w3-small w3-right" id="nickresult">${str_signUpUserName}</div>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										<label>${str_password}</label>
										<input name="passwd" value="${member.passwd}" class="w3-input" type="password">
										<div class="w3-text-blue w3-small w3-right" id="passwdresult">${str_signUpPassword}</div>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom">
										<label>${str_passwordCheck}</label>
										<input name="repasswd" value="${member.passwd}" class="w3-input" type="password">
										<div class="w3-text-blue w3-small w3-right" id="repasswdresult">${str_signUpPasswordCheck}</div>
									</div>
									<div class="w3-col m12 w3-margin-top w3-margin-bottom w3-center">
										<c:if test="${(member.mem_level eq 2) and (result eq 1)}">
											<label>${str_channel_id}</label>
											<a class="w3-right w3-small"> <i class="fa fa-question-circle"></i>&nbsp;${str_editChanal} 
											</a>
											<input name="channel_id" class="w3-input" type="text">
										</c:if>
										<div class="w3-center">
											<input type="submit" value="${str_editModifyBtn}" class="w3-btn w3-padding w3-black w3-margin">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 회원관리 -->
					<c:if test="${leader eq 2}">
						<hr>	<!-- 이부분은 크루장일 경우에만 보여야 한다 -->
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
								
								<c:if test="${crewMember ne null}">
									<c:forEach var="crew" items="${crewMember}">
										<c:if test="${crew.email ne sessionScope.memEmail}">
											<tr>
												<td>${crew.email}</td>
												<td>${crew.nick}</td>
												<td>
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="crewBusSignOverPro.do?email=${crew.email}&driver=${driver}">${str_crewMasterBtn}</a>
												</td>
												<td>
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="crewBusEjectPro.do?email=${crew.email}&driver=${driver}&hidden=1">${str_crewMemEjectBtn}</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${crewMember eq null}">
								<tr>
									<th>${str_crewMemNoneMsg}</th>
								</tr>
								</c:if>
								
							</table>
							</form>
							<%-- 페이지 구현부 실행안됨 임시로 넣어둠 --%>
							<%-- <div class="w3-row">  
							<!-- Pagination -->
							<div class="w3-center w3-padding-32">
								<ul class="w3-pagination">
								<c:if test="${count > 0}">
									<c:if test="${startPage > pageBlock}">
										<li><a href="admin.do#manageMembers">◀◀</a></li>
										<li><a href="admin.do?pageNum=${startPage-pageBlock}">◀</a></li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == pageNow}">
											<li><a>${i}</a></li>
										</c:if>
										<c:if test="${i != pageNow}">
											<li><a href="admin.do?pageNum=${i}#manageMembers">${i}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="admin.do?pageNum=${startPage+pageBlock}">▶</a></li>
										<li><a href="admin.do?pageNum=${pageCount}#manageMembers">▶▶</a><li>
									</c:if>
								</c:if>
								</ul>
							</div>
						</div> --%>
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
									<i class="fa fa-plus-square w3-xxlarge" onclick="taginsert()"></i>									
								</div>								
							</div>																			
							<div class="w3-content w3-margin-top">
							<div id="tagerror">									
							</div>
								<div id="tagname"></div>														
							</div>
						</div>
						<!-- 회원탈퇴 -->
						<hr>
						<div class="w3-content w3-padding-64">
							<h5>
								<i class="fa fa-sign-out"></i><b> ${str_goSignOut}</b>
							</h5>

							<p class="w3-responsive">
								<i class="fa fa-check"></i> ${str_signOutmsg1}<br> ${str_signOutmsg2}
							</p>
							<form id="signoutform" class="w3-container" action="myBusDeletePro.do" method="post">
								<p>
									<label>${str_password}</label>
									<input name="passwd" class="w3-input" type="password">
								</p>
								<br> <br>
								<input class="w3-check" type="checkbox">
								<label class="w3-validate">${str_agreeSignOut}</label>
								<p class="w3-center">
									<button type="submit" class="w3-btn w3-hover-teal">${str_signOutbtn}</button>
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
</html>
