<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<!DOCTYPE html>
<html>
<title>${str_title}</title>
<script type="text/javascript">
		
		keywordcheck=function(){
			if(! search.keyword.value){
				alert("${str_memSearchMsg}");
				search.keyword.focus();
				return false;
			}
		}		
		adNum=function(){
			adform.ad_num.value = "";
		}
		addReq=function(){
			$('input[name="upload"]').attr("required", false);
		}
		/* ad=function(){
			//alert(adform.upload.value == "");
			if(adform.upload.value == "" || adform.htmlCode.value == null )
			
			alert("아니야");
			return false;
			//location.href="AdminADPro.do?ad_num="+adform.ad_num.value;
		} */
		</script>
<body>

	<!-- Navbar -->
	<c:import url="../top.do" />

	<!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-right w3-padding-xlarge" style="z-index: 3; right: 0; width: 20%; margin-top: 50px;" id="mySidenav">
		<br>
		<c:if test="${sessionScope.memEmail != null}">
		<div class="w3-container w3-row">
			<div class="w3-col s8 w3-center">
				<span><strong> ${member.nick}</strong>&nbsp;${str_idMsg}</span><br>
			</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.memEmail == null}">
			<c:redirect url="main.do"/>
		</c:if>
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
				<div class="w3-quarter">
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
				<div class="w3-quarter">
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
				<div class="w3-quarter">
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
								<th ><a href="#" style="text-decoration: none">${str_memGrade}</a></th>
								<th><a href="#" style="text-decoration: none">&nbsp;&nbsp;${str_memEmail}</a></th>
								<th width="80px"><a href="#" style="text-decoration: none">&nbsp;&nbsp;${str_memNick}</a></th>
								<th style="text-align: certer"><a href="#" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${str_memAuthority}</a></th>
							</tr>
						<c:if test="${count == 0}">
							<tr>
								<td colspan="4" style="text-align : center">
									${str_listMsg}
								</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:if test="${slist == null}">
								<c:forEach var="getMember" items="${list}" varStatus="status">
									<tr>
										<td>${getMember.mem_level}&nbsp;${str_memGrade}</td>
										<td>
										${getMember.email}
										</td>
										<!-- 불러오는 아이디 -->
										<td>${getMember.nick}</td>
										<!-- 불러온 닉네임 -->
										<td style="text-align: left;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="myBus.do?driver=${getMember.email}">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a>
										
										<form action="admin.do" name="butto">
										<button id="1" type="submit" onclick="hid(${getMember.email})">
											크루목록 보기
										</button>
										
										<a id="2"  href="#manageMembers" onclick="myFunction('crew')">
											크루
										</a>
										<c:if test="${clist ==null}">
											크루에 가입되어 잇지 않습니다
										</c:if>
										<c:if test="${clist != null}">
										<c:forEach var="cl" items="${clist}">
										<div id="crew" class="w3-accordion-content w3-container">
											<ul>
											
												<li><a href="#">${cl}</a>
											
											</ul>
										</div>
										</c:forEach>
										</c:if>
										</form>
										<c:if test="${getMember.mem_level == 1}">
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=2&email=${getMember.email}">${str_memModify}</a>
										</c:if>

										<c:if test="${getMember.mem_level == 2}">
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=1&email=${getMember.email}">${str_memModify}</a>
										</c:if>
										<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberEjectPro.do?email=${getMember.email}">${str_memLeave}</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${slist != null}">
								<c:forEach var="getSearch" items="${slist}">
									<tr>
										<td>${getSearch.mem_level}&nbsp;${str_memGrade}</td>
										<td>${getSearch.email}</td>
										<!-- 불러오는 아이디 -->
										<td>${getSearch.nick}</td>
										<!-- 불러온 닉네임 -->
										<td style="text-align: left;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="myBus.do?driver=${getSearch.email}">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a>
										<c:if test="${getSearch.crewid != null}">
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="crewBus.do?driver=${getSearch.crewid}">${str_memGo}&nbsp; <i class="fa fa-fort-awesome"></i></a>
										</c:if>
										<c:if test="${getSearch.crewid == null}">
											<i class="fa fa-close">&nbsp;&nbsp;${str_memGo}</i>
										</c:if>
										<c:if test="${getMember.mem_level == 1}">
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=2&email=${getMember.email}">${str_memModify}</a>
										</c:if>
										<c:if test="${getMember.mem_level == 2}">
											<a class="w3-hover-black w3-padding" style="text-decoration: none" href="adminMemberManagePro.do?mem_level=1&email=${getMember.email}">${str_memModify}</a>
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
	
						<form class="w3-container" name="search" action="admin.do#manageMembers" onsubmit="return keywordcheck()">
							<select class="w3-select w3-border w3-quarter" name="category">
								<option value="${str_memSearchOption}">${str_memSearchOption}</option>
								<option value="email">${str_memEmail}</option>
								<option value="nick">${str_memNick }</option>
								<option value="mem_level">${str_memGrade}</option>
							</select>
							<input class="w3-input w3-border w3-half" name="keyword" type="text">
							<button class="w3-btn w3-black w3-large" type="submit">${str_memSearchBtn}</button>
						</form>
					</div>

				</div>
			</div>

		</div>
		
		<div>

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
					<select class="w3-select w3-border w3-quarter" name="ad_num" style="width: 150px">
						<option value="선택" disabled>${str_adNumMsg}</option>
						<option value="1">AD1</option>
						<option value="2">AD2</option>
						<option value="3">AD3</option>
					</select>
					<!-- <input type="text" name="ad_num" class="w3-opacity w3-input" style="width: 250px" maxlength="1"> -->
					</div><br><br>
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
				<form class="w3-container w3-margin">
					<p>
						<label class="w3-label w3-text-teal"><b>${str_emEmail}</b></label>
						<input class="w3-input w3-border" name="first" type="text">
					</p>

					<p>
						<button class="w3-btn w3-black w3-hover-teal" onclick="location=admin.do?#">${str_emSendEmail}</button>
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

			<form id="inputform" class="w3-container">
				<p>
					<label>${str_amNick}</label>
					<input class="w3-input" type="text" id="nick">
				<div class="w3-text-red w3-xsmall w3-right">*이미 존재하는 닉네임입니다.innerHTML</div>
				</p>
				<br> <br>
				<p>
					<label>${str_amPasswd}</label>
					<input class="w3-input" type="text" id="passwd">
				<div class="w3-text-blue w3-xsmall w3-right">*비밀번호는 숫자와 알파벳 5~10자리로 입력해주세요. innerHTML</div>
				</p>
				<br>
				<p>
					<label>${str_amPasswdCheck}</label>
					<input class="w3-input" type="text" id="passwdCheck">
				<div class="w3-text-blue w3-xsmall w3-right">*확인을 위해 다시 한번 입력해주세요. innerHTML</div>
				</p>
				<br> <br>
				</p>
				<br> <br>
				<div class="w3-center w3-row">
					<input class="w3-btn w3-hover-teal" type="submit" value="${str_amModifyBtn}">
				</div>
			</form>
		</div>

		<hr id="withdrawal">

		<div class="w3-content w3-padding-128">
			<h5>
				<i class="fa fa-sign-out"></i><b>&nbsp;${str_adminSignOut}</b>
			</h5>

			<pre class="w3-responsive">
			<i class="fa fa-check"></i>${str_amLeaveMsg}
			</pre>
			<input class="w3-check" type="checkbox">
			<label class="w3-validate"></label>
			<p class="w3-center">
				<button class="w3-btn w3-hover-teal" onclick="location=main.do">${str_adminDeleteBtn}</button>
			</p>
		</div>

		<!-- 여기까지 -->

		<!-- End page content -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>