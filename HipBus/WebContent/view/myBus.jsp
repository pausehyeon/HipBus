<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>HipBus - My Bus</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="navbar_top.jsp"/>


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
							<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
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
						<a href="#"><i class="fa fa-pencil"></i> edit profile</a>
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
						<button onclick="location='myBus_vedios.do'" class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa fa-video-camera fa-fw w3-margin-right"></i> 지난 라이브 영상
						</button>
						<div id="Demo3" class="w3-accordion-content w3-container">
							<div class="w3-row-padding">
								<div class="w3-half"></div>
							</div>
						</div>

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
			<div class="w3-col m7">
				<div
					class="w3-container w3-card-2 w3-theme-l1 w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-16">
					<div class="w3-row">
					
					<!-- 1. 채널 연결하지 않은 경우 -->
					<!-- 
					<a href="#" class="w3-center w3-theme-l1 w3-padding-large">
						<p> <i class="fa fa-video-camera w3-xxlarge"></i><br>Start Live Drive! </p>
					</a>
					-->
					<!-- 2. 2등급 회원이며 채널 연결한 경우 -->
						<h4 class="w3-right w3-margin-right">
							<i class="fa fa-video-camera"></i>&nbsp; Live
						</h4>
					</div>
					<div class="w3-row">
						<div class="w3-twothird">
							<iframe style="width: 100%; height: 360px"
								src="http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg"
								frameborder="0" allowfullscreen></iframe>
						</div>
						<div class="w3-third">
							<iframe style="width: 100%; height: 360px"
								src="https://www.youtube.com/live_chat?v=Fdvsv3xisy8&embed_domain=localhost"
								frameborder="0" allowfullscreen></iframe>
						</div>
					 
					<!-- 3. 2등급 회원인데 아직 채널을 연결하지 않은 경우 -->
					<!-- 
					<div class="w3-row w3-center w3-theme-l1 w3-padding-large w3-small">
						<p>
							<i class="fa fa-video-camera w3-xxlarge"></i>
							<br>
							아직 채널 ID를 등록하지 않으셨습니다.<br>
							유투브 채널 ID를 등록하고 방송을 시작해보세요.<br><br>
							<input class="w3-input" type="text" required>
							<br>
							<a href="#">채널 ID를 찾으려면?</a>
						</p>
					</div>
					-->
					<!-- 4. 1등급 회원인 경우 -->
					<!-- 
						<p class="w3-center w3-theme-l1 w3-padding-large w3-tiny">
							<i class="fa fa-video-camera w3-xxlarge"></i>
							<br>
							사이트 규정에 따라 Main Station에10개 이상 글을 게시한 이용자만 라이브 스트리밍을 이용할 수 있습니다.
							<br><br>
							<a href="#" class="w3-small">글 쓰러 가기</a>
						</p>
					 -->
					</div>
				</div>

				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h6 class="w3-opacity">이곳에 메시지를 남기세요.</h6>
								<p contenteditable="true" class="w3-border w3-padding">ex.
									좋은 음악이에요!</p>
								<button type="button" class="w3-btn w3-theme-l1">
									<i class="fa fa-pencil"></i>  Post
								</button>
							</div>
						</div>
					</div>
				</div>

				<div
					class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin">
					<img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 40px">
					<span class="w3-right w3-opacity">16 min &nbsp;<a href="#"><i
							class="fa fa-close w3-right"></i></a></span>

					<h4>Jueun Jeong</h4>
					<hr class="w3-clear">
					<p>안녕하세요!!!!</p>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-comment"></i>  댓글달기
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  수정하기
					</button>
					<!-- ^ 글 쓴 본인에게만 보임 -->
				</div>
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin">
					<img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 40px">
					<span class="w3-right w3-opacity">16 min &nbsp;<a href="#"><i
							class="fa fa-close w3-right"></i></a></span>

					<h4>Jueun Jeong</h4>
					<hr class="w3-clear">
					<p>안녕하세요!!!!</p>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-comment"></i>  댓글달기
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  수정하기
					</button>
					<!-- ^ 글 쓴 본인에게만 보임 -->
				</div>
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin">
					<img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 40px">
					<span class="w3-right w3-opacity">16 min &nbsp;<a href="#"><i
							class="fa fa-close w3-right"></i></a></span>

					<h4>Jueun Jeong</h4>
					<hr class="w3-clear">
					<p>안녕하세요!!!!</p>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-comment"></i>  댓글달기
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  수정하기
					</button>
					<!-- ^ 글 쓴 본인에게만 보임 -->
				</div>

				<div class="w3-row-padding">
					<div class="w3-col m12 w3-center">
						<a href="#">More...</a>
					</div>
				</div>
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
						<img src="${project}/view/img/notice1.png" alt="some image" style="width: 100%;">
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
	<c:import url="footer.jsp"/>

</body>
</html>
