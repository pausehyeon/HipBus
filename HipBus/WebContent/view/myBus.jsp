<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>HipBus - My Bus</title>
<body class="w3-theme-l5">

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
			<c:import url="../myBusLeft.do"></c:import>
			<!-- End Left Column -->

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
					<img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 40px"> <span class="w3-right w3-opacity">16
						min &nbsp;<a href="#"><i class="fa fa-close w3-right"></i></a>
					</span>

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
					<img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 40px"> <span class="w3-right w3-opacity">16
						min &nbsp;<a href="#"><i class="fa fa-close w3-right"></i></a>
					</span>

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
					<img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 40px"> <span class="w3-right w3-opacity">16
						min &nbsp;<a href="#"><i class="fa fa-close w3-right"></i></a>
					</span>

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

			<!--  Right Column -->
			<c:import url="../myBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
