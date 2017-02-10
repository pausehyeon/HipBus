<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>

<title>${str_title}</title>

<body>
	<!-- Navbar -->
	<c:import url="../top.do" />

	<!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-right w3-padding-xlarge" style="z-index: 3; right: 0; width: 20%; margin-top: 0px;" id="mySidenav">
		<br>
		<div class="w3-container w3-row">
			<div class="w3-col s8 w3-center">
				<span><strong> 관리자A </strong>${str_idMsg}</span><br>
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
								<th><a href="#" style="text-decoration: none">${str_memGrade}</a></th>
								<th><a href="#" style="text-decoration: none">${str_memId}</a></th>
								<th width="80px"><a href="#" style="text-decoration: none">${str_memNick}</a></th>
								<th><a></a></th>
							</tr>

							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<!-- 불러오는 아이디 -->
								<td>1등급 회원 닉네임</td>
								<!-- 불러온 닉네임 -->
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp; <i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memModify}</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memLeave}</a>
								</td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<td>1등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memModify}</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memLeave}</a>
								</td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memModify} </a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memLeave}</a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<td>1등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memModify}</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memLeave}</a>
								</td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 회원정보수정 </a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 회원정보수정 </a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a class="w3-hover-black w3-padding" style="text-decoration: none" href="#">${str_memGo}&nbsp;<i class="fa fa-bus"></i></a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none" href="#"
								>${str_memGo}&nbsp;<i class="fa fa-fort-awesome"></i>
								</a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 회원정보수정 </a> <a class="w3-hover-black w3-padding" style="text-decoration: none" href="#"> 강제탈퇴 </a></td>
							</tr>
						</table>
					</div>
					<div class="w3-row">
						<!-- Pagination -->
						<div class="w3-center w3-padding-32">
							<ul class="w3-pagination">
								<li>
									<a class="w3-black" href="#">1</a>
								</li>
								<li>
									<a class="w3-hover-black" href="#">2</a>
								</li>
								<li>
									<a class="w3-hover-black" href="#">3</a>
								</li>
								<li>
									<a class="w3-hover-black w3-hide-small" href="#">4</a>
								</li>
								<li>
									<a class="w3-hover-black w3-hide-small" href="#">5</a>
								</li>
								<li>
									<a class="w3-hover-black" href="#">»</a>
								</li>
							</ul>
						</div>
						<form class="w3-container" action="form.asp">
							<select class="w3-select w3-border w3-quarter" name="option">
								<option value=" " disabled>${str_memSearchOption}</option>
								<option value="id">${str_memId}</option>
								<option value="nickname">${str_memNick }</option>
								<option value="nickname">${str_memGrade}</option>
							</select>
							<input class="w3-input w3-border w3-half" name="first" type="text">
							<button class="w3-btn w3-black w3-large">${str_memSearchBtn}</button>
						</form>
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
				<form class="w3-container w3-margin">
					<hr>
					<p>
						<label class="w3-label w3-text-teal"><b>${str_adSize}</b></label>
					<div>
						<input class="w3-input" type="text" id="ad" readonly="readonly" value="readonly 광고의 주소가 삽입됨">
						<!-- 불러들인 이미지의 주소 -->
						<button class="w3-btn w3-teal w3-small">${str_adImgBtn}</button>
						<!-- 이미지탐색버튼 -->
					</div>
					<div>
						<input class="w3-opacity w3-input" type="text" id="ad-html" value="${str_adCodeMsg}">
						<!-- htmlcode메시지삽입부 -->
					</div>
					<br>
					<button class="w3-btn w3-black w3-hover-teal">${str_adAddBtn}</button>
					<!-- 기본적 세팅값을 가져오면 거기서 수정이 이루어진뒤 버튼으로 update하는 것으로  -->
					<button class="w3-btn w3-black w3-hover-teal">${str_adDeleteBtn}</button>
					<!-- 광고의 삭제후에 default값으로 이용될 이미지나 코드를 넣도록 만들어야 할듯 -->
					</p>
					<hr>
					<p>
						<label class="w3-label w3-text-teal"><b>${str_adSize}</b></label>
					<div>
						<input class="w3-input" type="text" id="aad" readonly="readonly" value="readonly 광고의 주소가 삽입됨">
						<button class="w3-btn w3-teal w3-small">${str_adImgBtn}</button>
					</div>
					<div>
						<input class="w3-opacity w3-input" type="text" id="aad-html" value="${str_adCodeMsg}">
					</div>
					<br>
					<button class="w3-btn w3-black w3-hover-teal">${str_adAddBtn}</button>
					<button class="w3-btn w3-black w3-hover-teal">${str_adDeleteBtn}</button>
					</p>
					<hr>
					<p>
						<label class="w3-label w3-text-teal"><b>${str_adSize}</b></label>
					<div>
						<input class="w3-input" type="text" id="aaad" readonly="readonly" value="readonly 광고의 주소가 삽입됨">
						<button class="w3-btn w3-teal w3-small">${str_adImgBtn}</button>
					</div>
					<div>
						<input class="w3-opacity w3-input" type="text" id="aaad-html" value="${str_adCodeMsg}">
					</div>
					<br>
					<button class="w3-btn w3-black w3-hover-teal">${str_adAddBtn}</button>
					<button class="w3-btn w3-black w3-hover-teal">${str_adDeleteBtn}</button>
					</p>
					<br>
					<br>
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
						<button class="w3-btn w3-black w3-hover-teal">${str_emSendEmail}</button>
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
					<label>${str_amProfile}</label>
				<div class="w3-row">
					<div class="w3-quarter w3-center">
						<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle" style="height: 106px; width: 106px" alt="Avatar">
					</div>
					<div class="w3-rest">
						<a class="w3-input w3-right-align">HipBusLogo_colored_sq.png(Default file Name) &nbsp;&nbsp; <i class="fa fa-download"></i></a>
						<input class="w3-input" type="file">
					</div>
				</div>
				<div class="w3-text-red w3-xsmall w3-right">*파일 형식에 맞지 않습니다. innerHTML</div>
				</p>
				<br> <br>

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
				<button class="w3-btn w3-hover-teal">${str_adminDeleteBtn}</button>
			</p>
		</div>

		<!-- 여기까지 -->

		<!-- End page content -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>