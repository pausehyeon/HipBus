<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>HipBus - My Bus</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="navbar_top.jsp" />


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
				<div class="w3-card-2 w3-round w3-white w3-margin-bottom">
					<div class="w3-container">
						<h4 class="w3-center">My Profile</h4>
						<p class="w3-center">
							<img src="${project}/view/img/HipBusLogo_colored_sq.png"
								class="w3-circle" style="height: 106px; width: 106px"
								alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>
							Gahyeon Nam
						</p>
						<p>
							<i
								class="fa fa-facebook-square fa-fw w3-margin-right w3-text-theme"></i>
							email@address.com
						</p>
						<p>
							<i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i>
							Best Driver
						</p>
						<p onclick="myFunction('crew')">
							<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i>
							소속 크루 : The One
						</p>
						<div id="crew" class="w3-accordion-content w3-container">
							<p>
								<a href="crewBus.do">The One <i
									class="fa fa-mail-forward fa-fw w3-margin-right w3-text-theme"></i></a>
							<ul>
								<li><a href="#">Victory Lee</a>
								<li><a href="#">Jeehun Kim</a>
							</ul>
							</p>
						</div>
						<hr>
						<a href="#"><i class="fa fa-pencil"></i> Edit Profile </a>
						<hr>
					</div>
				</div>

				<!-- Accordion -->
				<div class="w3-card-2 w3-round w3-margin-bottom">
					<div class="w3-accordion w3-white">
						<button onclick="myFunction('Demo1')"
							class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa fa fa-heart fa-fw w3-margin-right"></i> 탑승자 명단
						</button>
						<div id="Demo1" class="w3-accordion-content w3-container">
							<p>
							<ul>
								<li>Jueun Jeong<br>
								<li>JD Yoo<br>
							</ul>
							</p>
						</div>
						<button onclick="location='myBus_vedios.do'"
							class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa fa-video-camera fa-fw w3-margin-right"></i> 지난 라이브
							영상
						</button>

						<button onclick="myFunction('Demo2')"
							class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa	fa fa-align-left fa-fw w3-margin-right"></i>
							Gahyeon의 게시글 모아보기
						</button>
						<div id="Demo2" class="w3-accordion-content w3-container">
							<p>
							<ul>
								<li><a href="#"> 전체</a>
								<li><a href="#"> 랩</a>
								<li><a href="#"> 믹스테잎</a>
								<li><a href="#"> 보컬</a>
								<li><a href="#"> 가사</a>
								<li><a href="#"> 잡담</a>
							</ul>
							</p>
						</div>
					</div>
				</div>

				<!-- Interests -->
				<div class="w3-card-2 w3-round w3-white w3-hide-small">
					<div class="w3-container">
						<p>관심사</p>
						<p>
							<span class="w3-tag w3-small w3-theme-d5">랩</span> <span
								class="w3-tag w3-small w3-theme-d4">믹스테잎</span> <span
								class="w3-tag w3-small w3-theme-d3">가사</span> <span
								class="w3-tag w3-small w3-theme-d2">Games</span> <span
								class="w3-tag w3-small w3-theme-d1">Friends</span> <span
								class="w3-tag w3-small w3-theme">쇼미더머니</span> <span
								class="w3-tag w3-small w3-theme-l1">언프리티랩스타</span> <span
								class="w3-tag w3-small w3-theme-l2">Food</span> <span
								class="w3-tag w3-small w3-theme-l3">빈지노</span> <span
								class="w3-tag w3-small w3-theme-l4">Art</span> <span
								class="w3-tag w3-small w3-theme-l5">Photos</span>
						</p>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h2>
							<i class="fa fa-pencil"></i>&nbsp; 회원 정보 수정
						</h2>
					</div>

					<form id="inputform" class="w3-container">
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
						<p>
							<label>Tags</label>
						<div class="w3-row">
							<div class="w3-threequarter">
								<input id="tag" type="text" class="w3-input">
							</div>
							<div class="w3-rest">
								<span class="w3-badge w3-margin-left w3-large"> + </span>
							</div>
						</div>
						<p>
							<span class="w3-tag w3-margin-top w3-padding w3-theme-l5">#빈지노<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme-l4">#언프리티_랩_스타<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme-l3">#믹스테잎<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme-l2">#랩<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme-l1">#빈지노<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme">#언프리티_랩_스타<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span> <span
								class="w3-tag w3-margin-top w3-padding w3-theme-l5">#믹스테잎<a
								class="w3-closebtn w3-tiny w3-margin-left">X</a></span>
						</p>
						</p>
						<br> <br>
						<div class="w3-center">
							<input type="submit" value="수정 완료"
								class="w3-btn w3-padding w3-black w3-margin">
						</div>


					</form>

				</div>
				<!-- 회원탈퇴 -->
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-red">
						<h2>
							<i class="fa fa-close"></i>&nbsp; 회원 탈퇴
						</h2>
					</div>

					<form id="signoutform" class="w3-container">
						<p>
							<label>Password</label> <input class="w3-input" type="text">

							<div class="w3-text-red w3-xsmall w3-right">*탈퇴 시 모든 정보가
								삭제되며 복구할 수 없습니다. 신중히 결정해주세요</div>
							</p>
							<br>
							<br>
							<div class="w3-center">
								<input type="submit" value="탈퇴하기"
								class="w3-btn w3-padding w3-black w3-margin">
							</div>


						</form>
					</div>
			<!-- 여기까지 -->
							<!-- End Middle Column -->
			
						</div>

			<!-- Right Column -->
			<div class="w3-col m2">
				<div class="w3-card-2 w3-round w3-white w3-center">
					<div class="w3-container">
						<div class="w3-right w3-padding-16">
							<button type="button" class="w3-btn w3-theme-l1">
								<i class="fa fa-pencil"></i>&nbsp; Edit
							</button>
						</div>
						<img src="${project}/view/img/notice1.png" alt="some image"
							style="width: 100%;">
						<p>
							<strong>Seoul soul Festival 2016</strong>
						</p>
						<p>토요일 15:00</p>
						<p>
							<button class="w3-btn w3-btn-block w3-theme-l1">자세히</button>
						</p>
					</div>
				</div>
				<br>

				<div class="w3-card-2 w3-round w3-white w3-padding-16 w3-center">
					<div class="w3-container">
						<div class="w3-right w3-padding-16">
							<button type="button" class="w3-btn w3-theme-l1">
								<i class="fa fa-pencil"></i>&nbsp; Edit
							</button>
						</div>
						<img src="${project}/view/img/topdriver1.png" alt="some image"
							style="width: 100%;">
						<p>
							<strong>구인</strong>
						</p>
						<p>듀오로 활동하실 멤버를 구합니다.</p>
						<p>
							<button class="w3-btn w3-btn-block w3-theme-l1">자세히</button>
						</p>
					</div>
				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />

</body>
</html>
