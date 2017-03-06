<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<!DOCTYPE html>
<html>
<title>${str_titleAdmin}</title>
<body>
	<c:if test="${sessionScope.memEmail eq null}">
		<c:redirect url="main.do"/>
	</c:if>
	<c:if test="${sessionScope.memEmail ne null}">
		<!-- Navbar -->
		<c:import url="../top.do" />
		
		<script type="text/javascript">
		var str_amModifyMsg ="*경고 : 수정하실 정보를 정확하게 입력해주세요.";
		var str_sendEamilError ="*관리자로 초대하실 사용자의 이메일을 작성해주세요.";
		var str_emailError = "*유효하지 않은 이메일입니다.\n 이메일을 확인해주세요.";
		var str_checkedBoxError = "**경고 : 회원탈퇴 안내사항에 동의하시고 진행해주세요.";
		
		verifyNick=function(){
			var params = "nick=" + $('input[name="nick"]').val() + "&ex_nick=" + $('input[name="ex_nick"]').val();
			var request = new Request(function() {
				if(request.httpRequest.readyState == 4){
					if(request.httpRequest.status == 200){
						if(request.httpRequest.responseText.trim() == "true"){
							$('#nickresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_nickOk}");	
						}else{
							$('#nickresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_nickNo}");	
						}
					}else{
						$('#nickresult').text('오류');
					}
				}else{
					console.log( "통신중..." );
				}	
			}, "verifyNickResult.do", "POST", params);
			request.sendRequest();
		}
		$(document).ready(function(){
		//비밀번호-숫자, 알파벳조합 길이가 5~10글자 이하
		$('input[name="passwd"]').keyup(function(){
			if( isNaN( Number( $(this).val() ) ) ){
			//숫자가 아닌 경우
				var containsNumber = false;
				for(var i=0; i<10; i++){
					if( $(this).val().indexOf(i) != -1)	containsNumber = true;
				}
				if(containsNumber == false){
					$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwdError1}");
				}else if( $(this).val().length<5 ){
					//길이 짧음
					var minlength = 5; 
					$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwdError3}"+minlength+"${str_passwdError2}");
				}else if( $(this).val().length>10 ){
					//길이가 김
					var maxlength = 10;
					$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwdError3}"+maxlength+"${str_passwdError4}");
					$(this).val( $(this).val().substring(0, maxlength) );
				}else{
					$('#passwdresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_passwdOk}");					
				}
			}else{
			//숫자인 경우
				$('#passwdresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwdError1}");
			}
		});
		//비밀번호 확인
		$('input[name="passwdcheck"]').keyup(function(){
			if( $(this).val() == inputform.passwd.value){
				$('#passwdcheckresult').removeClass('w3-text-red').addClass('w3-text-blue').text("${str_passwdCheckOk}");
			}else{
				$('#passwdcheckresult').removeClass('w3-text-blue').addClass('w3-text-red').text("${str_passwdCheckNo}");
			}			
		});
		
		});
			
			keywordCheck=function(){
				if(! search.keyword.value){
					alert("${str_memSearchMsg}");
					search.keyword.focus();
					return false;
				}
			}
			
			adCheck=function(){
				var ad_num = document.getElementById("selectBox").value;
				var params = "ad_num=" + ad_num;
				var request = new Request(function() {
					if(request.httpRequest.readyState == 4){
						if(request.httpRequest.status == 200){
							if(request.httpRequest.responseText.trim() != ''){
								$("#ad_location").removeClass('w3-text-red').addClass('w3-text-blue').html("&nbsp;&nbsp;&nbsp;&nbsp;"+request.httpRequest.responseText);
							}else{
								$("#ad_location").addClass('w3-text-red').html("&nbsp;&nbsp;&nbsp;&nbsp;${str_adNoMsg}");
							}
						}else{
							$('#ad_location').text('오류');
						}
					}else{
						console.log( "통신중..." );
					}	
				}, "adminADResult.do", "POST", params);
				request.sendRequest();
			
		}	
				
			modifyCheck=function(){
				if(inputform.nick.value == "" || inputform.passwd.value == "" || inputform.passwdcheck.value == ""){
					alert(str_amModifyMsg);
					return false;
				}
			}
			
			addReq=function(){
				$('input[name="upload"]').attr("required", false);
			}
			
			sendEmail= function(){
				if(sendform.email.value == ""){
					alert(str_sendEamilError);
					sendform.email.focus();
					return false;
				}
				if(sendform.email.value.indexOf('@') == -1){
					alert(str_emailError);
					sendform.email.value = "";
					sendform.email.focus();
					return false;
				}
			}
	
			checkedBox=function(){
				if($('input[name="assent"]').is(':checked') == false){
					alert(str_checkedBoxError);
					return false;
				}
			}
			</script>
	
		<!-- Sidenav/menu -->
		<nav class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-right w3-padding-xlarge" style="z-index: 3; right: 0; width: 20%; margin-top: 50px;" id="mySidenav">
			<br>
			
			<div class="w3-container w3-row">
				<div class="w3-col s8 w3-center">
					<span><strong> ${member.nick}</strong>&nbsp;${str_idMsg}</span><br>
				</div>
			</div>
			
			
			<hr>
			<div class="w3-container">
				<h5>${str_adminMenu}</h5>
			</div>
			<a href="#" class="w3-padding"><i class="fa fa-dashboard"></i> &nbsp;${str_report}</a> <a href="#manageMembers" class="w3-padding"><i class="fa fa-users fa-fw"></i> &nbsp;${str_memberModify}</a> <a
				href="#addad" class="w3-padding"
			><i class="fa fa-file-image-o fa-fw"></i> &nbsp;${str_adminAd}</a> <a href="#sendInvitation" class="w3-padding"><i class="fa fa-id-card-o fa-fw"></i> &nbsp;${str_adminEmail}</a> <a href="#modify"
				class="w3-padding"
			><i class="fa fa-cog"></i> &nbsp;${str_adminModify}</a> <a href="#withdrawal" class="w3-padding"><i class="fa fa-sign-out fa-fw"></i> &nbsp;${str_adminSignOut}</a> <br>
			<br>
		</nav>
	
		<!-- !PAGE CONTENT! -->
		<div class="w3-main w3-margin-bottom" style="margin-right: 20%; margin-left: 20%">
			<!-- 
			<div class="w3-row w3-container" style="margin-top: 64px">
				여백
			</div>
			 -->
			<!-- 여기서부터 -->
			
			<div class="w3-content w3-padding-128">
				<h5>
					<b><i class="fa fa-dashboard"></i>&nbsp;${str_report} </b>
				</h5>
	
				<div class="w3-row-padding w3-margin-bottom ">
					<div class="w3-third">
						<div class="w3-container w3-red w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-group w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>${numberOfMember}</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>${str_memberReport}</h4>
						</div>
					</div>
					<div class="w3-third">
						<div class="w3-container w3-blue w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-fort-awesome w3-xxxlarge"></i>
							</div>
							<div class="w3-right">
								<h3>${numberOfCrew}</h3>
							</div>
							<div class="w3-clear"></div>
							<h4>${str_crewReport}</h4>
						</div>
					</div>
					<div class="w3-third">
						<div class="w3-container w3-teal w3-padding-16">
							<div class="w3-left">
								<i class="fa fa-eye w3-xxxlarge "></i>
							</div>
							<div class="w3-right">
								<h3>${numberOfPost}</h3>
								<!-- 값 받아와요 -->
							</div>
							<div class="w3-clear"></div>
							<h4>${str_postReport}</h4>
						</div>
					</div>
				</div>
				<br>
			</div>
			<hr id="manageMembers">
			<div class="w3-content w3-padding-128">
				<div class="w3-container w3-section">
					<div class="w3-row-padding" style="margin: 0 -16px">
						<div class="w3-third">
							<h5>
								<i class="fa fa-users"></i><b>&nbsp;${str_memberModify}</b>
							</h5>
						</div>
	
						<div>
							<table class="w3-table w3-striped w3-white">
								<tr class="w3-black">
									<th >${str_memGrade}</th>
									<th><a href="#" style="text-decoration: none">&nbsp;&nbsp;${str_memEmail}</a></th>
									<th width="80px">&nbsp;&nbsp;${str_memNick}</th>
									<th colspan="4" style="text-align: certer"><a href="#" style="text-decoration: none;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${str_memAuthority}</a></th>
								</tr>
							<c:if test="${count eq 0}">
								<tr>
									<td colspan="7" style="text-align : center">
										${str_listMsg}
									</td>
								</tr>
							</c:if>
							<c:if test="${count ne 0}">
								<c:if test="${slist eq null}">
									<c:forEach var="getMember" items="${list}" varStatus="status">
										<tr>
											<td>${getMember.mem_level}&nbsp;${str_memGrade}</td>
											<!-- 등급 -->
											<td>${getMember.email}</td>
											<!-- 불러오는 아이디 -->
											<td>${getMember.nick}</td>
											<!-- 불러온 닉네임 -->
											<td style="text-align: left;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="myBus.do?driver=${getMember.email}">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a>
											<!-- 마이버스로 가기 -->
											<td>
											<span id="${status.count}" onclick="myFunction('crew${status.count}')" >
												${str_crewList} <i class="fa fa-caret-down"></i>
											</span>												
												<div id="crew${status.count}" class="w3-accordion-content w3-container">
													<ul>
													 	<c:forEach var="cl" items="${clist}" varStatus="status">
															<c:if test="${cl.email eq getMember.email}">
																<li><a href="crewBus.do?driver=${cl.crewid}">${cl.crewname}</a>
															</c:if>
														</c:forEach>
													</ul>
												</div>
												<!-- 크루버스 -->
											</td>
											<td>
											<c:if test="${getMember.mem_level eq 1}">
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=2&email=${getMember.email}">${str_memModify}</a>
											</c:if>
											<c:if test="${getMember.mem_level eq 2}">
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=1&email=${getMember.email}">${str_memModify}</a>
											</c:if>
											</td>
											<td>
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberEjectPro.do?email=${getMember.email}">${str_memLeave}</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${slist ne null}">
									<c:forEach var="getSearch" items="${slist}" varStatus="cstatus">
										<tr>
											<td>${getSearch.mem_level}&nbsp;${str_memGrade}</td>
											<td>${getSearch.email}</td>
											<!-- 불러오는 아이디 -->
											<td>${getSearch.nick}</td>
											<!-- 불러온 닉네임 -->
											<td style="text-align: left;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="myBus.do?driver=${getSearch.email}">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a>
											<span id="${status.count}" onclick="myFunction('searchCrew${cstatus.count}')">
												${str_crewList} <i class="fa fa-caret-down"></i>
											</span>												
												<div id="searchCrew${cstatus.count}" class="w3-accordion-content w3-container">
													<ul>
													 	<c:forEach var="c" items="${clist}">
															<c:if test="${c.email eq getSearch.email}">
																<li><a href="crewBus.do?driver=${c.crewid}">${c.crewname}</a>
															</c:if>
														</c:forEach>
													</ul>
												</div>
												<!-- 크루버스 -->										
											<c:if test="${getSearch.mem_level eq 1}">
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=2&email=${getSearch.email}">${str_memModify}</a>
											</c:if>
											<c:if test="${getSearch.mem_level eq 2}">
												<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=1&email=${getSearch.email}">${str_memModify}</a>
											</c:if>
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberEjectPro.do?email=${getSearch.email}">${str_memLeave}</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:if>
						</table>
						</div>
				
						<div class="w3-row">
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
		
							<form class="w3-container" name="search" action="admin.do#manageMembers" onsubmit="return keywordCheck()">
								<select class="w3-select w3-border w3-quarter" name="category">
									<option value="${str_memSearchOption}">${str_memSearchOption}</option>
									<option value="email">${str_memEmail}</option>
									<option value="nick">${str_memNick }</option>
									<option value="mem_level">${str_memGrade}</option>
								</select>
								<input class="w3-input w3-border w3-half" name="keyword" type="text">
								<button class="w3-btn w3-black w3-hover-teal" type="submit">${str_memSearchBtn}</button>
								<c:if test="${slist ne null}">
									<a href="admin.do#manageMembers" class="w3-btn w3-black w3-hover-teal" style="text-decoration: none">${str_memListBtn}</a> 
								</c:if>
							</form>
						</div>
	
					</div>
				</div>
	
			</div>
			
			</div>
	
			<hr id="addad">
			<div class="w3-content w3-padding-128">
				<h5>
					<i class="fa fa-file-image-o"></i><b>&nbsp;${str_adminAd}</b>
					<tt class="w3-small">&nbsp;${str_adMsg}</tt>
				</h5>
				<br>
				<div class="w3-card-4 w3-margin-left w3-margin-right w3-margin-top">
					<form name="adform" class="w3-container w3-margin"  method="post" enctype="multipart/form-data"
						action="adminADPro.do"><!-- onclick="return ad()" adminADPro.do -->
						
						<p>
							<label class="w3-label w3-text-teal"><b>${str_adSize}</b></label>
						<div>
						<select class="w3-select w3-border w3-quarter" name="ad_num"  id="selectBox" style="width: 150px" onchange="adCheck()">
							<option value="0">${str_adNumMsg}</option>
							<option id="1" value="1" >AD1</option>
							<option id="2" value="2">AD2</option>
							<option id="3" value="3">AD3</option>
						</select> 
					
						<!-- <input type="text" id="ad_location" class="w3-opacity w3-input" style="width: 250px" maxlength="1" value="없음"> -->
						<div class="w3-xsmall w3-right" id="ad_location"></div>
						</div>
						<br><br>
						<div>
							<input name="upload" type="file" accept="image/*" required>
								<!-- 불러들인 이미지의 주소 -->
						</div>
						<div>
							<input class="w3-opacity w3-input" type="text" name="htmlCode" placeholder="${str_adCodeMsg}" onclick="addReq()">
								<!-- htmlcode메시지삽입부 -->
						</div>
						<br>
						<button type="submit" name="adbtn" class="w3-btn w3-black w3-hover-teal">${str_adAddBtn}</button>
						<!-- 기본적 세팅값을 가져오면 거기서 수정이 이루어진뒤 버튼으로 update하는 것으로  -->
						<button type="reset" class="w3-btn w3-black w3-hover-teal">${str_adDeleteBtn}</button>
						<!-- 광고의 삭제후에 default값으로 이용될 이미지나 코드를 넣도록 만들어야 할듯 -->
						</p>
					</form>
				</div>
			</div>
	
	
			<hr id="sendInvitation">
	
			<div class="w3-content w3-padding-128">
				<h5>
					<i class="fa fa-id-card-o"></i><b>&nbsp;${str_adminEmail}</b>
				</h5>
				<br>
				<div class="w3-card-4 w3-margin-left w3-margin-right w3-margin-top">
					<form name="sendform" class="w3-container w3-margin" method="post" action="adminInvitePro.do" onsubmit="return sendEmail()">
						<p>
							<label class="w3-label w3-text-teal"><b>${str_emEmail}</b></label>
							<input class="w3-input w3-border" name="email" type="text">
						</p>
							<div class="w3-text-blue w3-xsmall w3-right" id="sendCheck">${str_sendOk}</div>
						<p>
							<button type="submit" class="w3-btn w3-black w3-hover-teal" >${str_emSendEmail}</button>
						</p>
					</form>
				</div>
			</div>
	
			<hr id="modify">
			<div class="w3-content w3-padding-128">
				<h5>
					<i class="fa fa-user"></i><b>&nbsp;${str_adminModify}</b>
					<!-- 해당관리자 정보를 불러옴 -->
				</h5>
	
				<form id="inputform" class="w3-container" method="post" action="adminEditPro.do" onsubmit="return modifyCheck()">
					<p>
						<label>${str_amNick}</label>
						<input name="nick" class="w3-input" type="text" value="${member.nick}" onkeyup="verifyNick()">
						<input name="ex_nick" value="${member.nick}" type="hidden">
						<div class="w3-text-blue w3-xsmall w3-right" id="nickresult">${str_modifyNick}</div>
					</p>
					<br> <br>
					<p>
						<label>${str_amPasswd}</label>
						<input name="passwd" class="w3-input" type="password">
						<div class="w3-text-blue w3-xsmall w3-right" id="passwdresult">${str_modifyPasswd}</div>
					</p>
					<br>
					<p>
						<label>${str_amPasswdCheck}</label>
						<input class="w3-input" type="password" name="passwdcheck">
						<div class="w3-text-blue w3-xsmall w3-right" id="passwdcheckresult">${str_passwdCheck}</div>
					</p>
					<br> <br>
					
					<br> <br>
					<div class="w3-center w3-row">
						<button class="w3-btn w3-hover-teal" type="submit">${str_amModifyBtn}</button>
					</div>
				</form>
			</div>
	
			<hr id="withdrawal">
	
			<div class="w3-content w3-padding-128">
				<form name="adminDelete" method="post" action="adminSignOutPro.do" onsubmit=" return checkedBox()">
				<h5>
					<i class="fa fa-sign-out"></i><b>&nbsp;${str_adminSignOut}</b>
				</h5>
	
				<p class="w3-responsive">
					<i class="fa fa-check"></i>${str_amLeaveMsg}
				</p>
					<input class="w3-check" type="checkbox" name="assent">
					<label class="w3-validate">&nbsp;&nbsp;${str_amLeaveCheck}</label>
				<p class="w3-center">
					<button class="w3-btn w3-hover-teal" type="submit">${str_adminDeleteBtn}</button>
					<%-- <a class="w3-btn w3-hover-teal" style="text-decoration: none" href="adminSignOutPro.do">${str_adminDeleteBtn}</a> --%>
				</p>
				</form>
			</div>
	</c:if>
			<!-- 여기까지 -->
	
			<!-- End page content -->
	
	
		<!-- Footer -->
		<c:import url="../bottom.do" />
	
	
	</body>
</html>