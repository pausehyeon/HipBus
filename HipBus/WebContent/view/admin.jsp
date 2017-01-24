<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>

<title>HipBus</title>
<body>

	<!-- Navbar -->
	<c:import url="navbar_top.jsp"/>

	<!-- Sidenav/menu -->
	<nav
		class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-right w3-padding-xlarge"
		style="z-index: 3; right: 0; width: 20%; margin-top: 0px;"
		id="mySidenav">
		<br>
		<div class="w3-container w3-row">
			<div class="w3-col s8 w3-center">
				<span><strong>관리자A님</strong> 반갑습니다.</span><br>
					<a href="#" class="w3-hover-none w3-hover-text-red w3-show-inline-block"> <i class="fa fa-envelope"></i> </a>
					<a href="#" class="w3-hover-none w3-hover-text-green w3-show-inline-block"> <i class="fa fa-user"></i> </a>
					<a href="#" class="w3-hover-none w3-hover-text-blue w3-show-inline-block"> <i class="fa fa-cog"></i> </a>
			</div>
		</div>
		<hr>
		<div class="w3-container">
			<h5>관리자 메뉴</h5>
		</div>
		<a href="#"
			class="w3-padding-16 w3-hide-large w3-dark-grey w3-hover-opacity"
			onclick="w3_close()" title="close menu">
			<i class="fa fa-remove fa-fw"></i> Close Menu</a>
			<a href="#" class="w3-padding"><i class="fa fa-eye fa-fw"></i> &nbsp;HipBus 이용현황 </a>
			<a href="#manageMembers" class="w3-padding"><i class="fa fa-users fa-fw"></i> &nbsp;회원 관리 </a>
			<a href="#addad" class="w3-padding"><i class="fa fa-file-image-o fa-fw"></i> &nbsp;광고 삽입 </a>
			<a href="#sendInvitation" class="w3-padding"><i class="fa fa-id-card-o fa-fw"></i> &nbsp;관리자 초대메일 보내기 </a>
			<a href="#modify" class="w3-padding"><i class="fa fa-user fa-fw"></i> &nbsp;관리자 정보 관리 </a>
			<a href="#withdrawal" class="w3-padding"><i class="fa fa-sign-out fa-fw"></i> &nbsp;사이트 탈퇴 </a>
			<br><br>
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
				<b><i class="fa fa-dashboard"></i> HipBus 이용현황 </b>
			</h5>
	
			<div class="w3-row-padding w3-margin-bottom ">
				<div class="w3-quarter">
					<div class="w3-container w3-red w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-comment w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3>52</h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Posted</h4>
					</div>
				</div>
				<div class="w3-quarter">
					<div class="w3-container w3-blue w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-eye w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3>99</h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Views</h4>
					</div>
				</div>
				<div class="w3-quarter">
					<div class="w3-container w3-teal w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-share-alt w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3>23</h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Shares</h4>
					</div>
				</div>
				<div class="w3-quarter">
					<div class="w3-container w3-orange w3-text-white w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-users w3-xxxlarge"></i>
						</div>
						<div class="w3-right">
							<h3>50</h3>
						</div>
						<div class="w3-clear"></div>
						<h4>Users</h4>
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
							<i class="fa fa-users"></i><b> 회원 관리 </b>
						</h5>
					</div>
	
					<div>
						<table class="w3-table w3-striped w3-white">
							<tr class="w3-black">
								<th><a href="#" style="text-decoration: none">등급↓</a></th>
								<th><a href="#" style="text-decoration: none">아이디↓</a></th>
								<th width="80px"><a href="#" style="text-decoration: none">닉네임↓</a></th>
								<th><a></a></th>
							</tr>
	
							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<td>1등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<td>1등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle-o w3-padding-tiny"></i></td>
								<td>1등급 회원 아이디</td>
								<td>1등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
							<tr>
								<td><i class="fa fa-user-circle w3-padding-tiny"></i></td>
								<td>2등급 회원 아이디</td>
								<td>2등급 회원 닉네임</td>
								<td style="text-align: right;"><a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> Go to <i class="fa fa-bus"></i>
								</a> <a class="w3-hover-black w3-padding"
									style="text-decoration: none" href="#"> 회원정보수정 </a> <a
									class="w3-hover-black w3-padding" style="text-decoration: none"
									href="#"> 강제탈퇴 </a></td>
							</tr>
						</table>
					</div>
					<div class="w3-row">
						<!-- Pagination -->
						<div class="w3-center w3-padding-32">
							<ul class="w3-pagination">
								<li><a class="w3-black" href="#">1</a></li>
								<li><a class="w3-hover-black" href="#">2</a></li>
								<li><a class="w3-hover-black" href="#">3</a></li>
								<li><a class="w3-hover-black w3-hide-small" href="#">4</a></li>
								<li><a class="w3-hover-black w3-hide-small" href="#">5</a></li>
								<li><a class="w3-hover-black" href="#">»</a></li>
							</ul>
						</div>
						<form class="w3-container" action="form.asp">
							<select class="w3-select w3-border w3-quarter" name="option">
								<option value=" " disabled>검색기준을 선택해주세요</option>
								<option value="id">아이디</option>
								<option value="nickname">닉네임</option>
							</select>
							<input class="w3-input w3-border w3-half" name="first" type="text">
	
								<button class="w3-btn w3-black w3-large">검색</button>
	
						</form>
					</div>
	
				</div>
			</div>
			
		</div>
		
		<hr id="addad">
		
		
		<div class="w3-content w3-padding-128">
			<h5>
				<i class="fa fa-file-image-o"></i><b> 광고 삽입<tt class="w3-small">  *이미지를 업로드하거나 광고용HTML코드를 입력해주세요.</tt></b>
			</h5>
			<br>
			<div class="w3-card-4 w3-margin-left w3-margin-right w3-margin-top">
				<form class="w3-container w3-margin">
					<p>
						<label class="w3-label w3-text-teal"><b>ad *크기 : 350X250</b></label> 
						<div>
						<input class="w3-input" type="text" id="ad" readonly="readonly" value="광고이미지1.jpg">
						<button class="w3-btn w3-teal w3-small">이미지삽입</button>
						</div>
						<div>
						<input class="w3-opacity w3-input" type="text" id="ad-html" value="">
						<button class="w3-btn w3-teal w3-small" style="padding:5 22">코드저장</button>
						</div>
					</p>
					<hr>
					<p>
						<label class="w3-label w3-text-teal"><b>aad *크기 : 350X250</b></label> 
						<div>
						<input class="w3-input" type="text" id="aad" readonly="readonly" value="">
						<button class="w3-btn w3-teal w3-small">이미지삽입</button>
						</div>
						<div>
						<input class="w3-opacity w3-input" type="text" id="aad-html" value="<html코오오오오오오오오오오오오오오오오오오오오오오오오오드/ >">
						<button class="w3-btn w3-teal w3-small" style="padding:5 22">코드저장</button>
						</div>
					</p>
					<hr>
					<p>
						<label class="w3-label w3-text-teal"><b>aaad *크기 : 350X250</b></label> 
						<div>
						<input class="w3-input" type="text" id="aaad" readonly="readonly" value="광고이미지3.png">
						<button class="w3-btn w3-teal w3-small">이미지삽입</button>
						</div>
						<div>
						<input class="w3-opacity w3-input" type="text" id="aaad-html" value="">
						<button class="w3-btn w3-teal w3-small" style="padding:5 22">코드저장</button>
						</div>
					</p>
					<hr>
					<p>
						<button class="w3-btn w3-black w3-hover-teal">add AD</button>
					</p>
				</form>
			</div>
		</div>
		
		
		<hr id="sendInvitation">

		<div class="w3-content w3-padding-128">
			<h5>
				<i class="fa fa-id-card-o"></i><b> 관리자 초대메일보내기</b>
			</h5>
			<br>
			<div class="w3-card-4 w3-margin-left w3-margin-right w3-margin-top">
				<form class="w3-container w3-margin">
					<p>
						<label class="w3-label w3-text-teal"><b>Email</b></label> 
						<input class="w3-input w3-border" name="first" type="text">
					</p>
					<p>
						<label class="w3-label w3-text-teal"><b>Content</b></label> 
						<input class="w3-input w3-border" name="last" type="text">
					</p>
					<p>
						<button class="w3-btn w3-black w3-hover-teal">Send email</button>
					</p>
				</form>
			</div>
		</div>
		
		<hr id="modify">

		<div class="w3-content w3-padding-128">
			<h5>
				<i class="fa fa-user"></i><b> 관리자 정보 관리</b>
			</h5>
			
			<form id="inputform" class="w3-container">
				<p>
					<label>Profile Picture</label>
					<div class="w3-row">
						<div class="w3-quarter w3-center">
						<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle"
							style="height: 106px; width: 106px" alt="Avatar">
						</div>
						<div class="w3-rest">
							<a class="w3-input w3-right-align">HipBusLogo_colored_sq.png(기존 파일명) &nbsp;&nbsp;<i class="fa fa-download"></i></a>
							<input class="w3-input" type="file">
						</div>
					</div>
				<div class="w3-text-red w3-xsmall w3-right">*파일 형식에 맞지 않습니다.</div>
				</p>
				<br> <br>
	
				<p>
					<label>Nick Name</label> <input class="w3-input" type="text">
				<div class="w3-text-red w3-xsmall w3-right">*이미 존재하는 닉네임입니다.</div>
				</p>
				<br> <br>
				<p>
					<label>Password</label> <input class="w3-input" type="text">
				<div class="w3-text-blue w3-xsmall w3-right">*비밀번호는 숫자와 알파벳
					5~10자리로 입력해주세요.</div>
				</p>
				<br>
				<p>
					<label>Password 확인</label> <input class="w3-input" type="text">
				<div class="w3-text-blue w3-xsmall w3-right">*확인을 위해 다시 한번
					입력해주세요.</div>
				</p>
				<br> <br>
				</p>
				<br> <br>
				<div class="w3-center w3-row">
					<input type="submit" value="수정 완료"
						class="w3-btn w3-hover-teal">
				</div>
			</form>
		</div>	
		
		<hr id="withdrawal">

		<div class="w3-content w3-padding-128">
			<h5>
				<i class="fa fa-sign-out"></i><b> 사이트 탈퇴</b>
			</h5>
			
			<pre class="w3-responsive">
			<i class="fa fa-check"></i> 사용하고 계신 계정(관리자A)은 탈퇴할 경우 재사용 및 복구가 불가능합니다.
			&nbsp;&nbsp;&nbsp;&nbsp; 탈퇴 후 사이트에 게시한 내용을 수정/삭제 할 수 없습니다.
			</pre>
			<input class="w3-check" type="checkbox">
			<label class="w3-validate">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
			<p class="w3-center"><button class="w3-btn w3-hover-teal">탈퇴</button></p>
		</div>		

		<!-- 여기까지 -->

		<!-- End page content -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"/>


</body>
</html>