<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>


<title>HipBus - Crew Bus</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="navbar_top.jsp"/>


	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
				<div class="w3-card-2 w3-round w3-white">
					<div class="w3-container">
						<h4 class="w3-center">Crew Profile</h4>
						<p class="w3-center">
							<img src="${project}/view/img/HipBusLogo_bw.png" class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i>
							The One
						</p>
						<p>
							<i
								class="fa fa-facebook-square fa-fw w3-margin-right w3-text-theme"></i>
							email@address.com
						</p>
						<p onclick="myFunction('crew')">
							<i class="fa fa-users fa-fw w3-margin-right w3-text-theme"></i>
							크루 구성원 (2명)
						</p>
						<div id="crew" class="w3-accordion-content w3-container">
							<p>
							<ul>
								<li><a href="">Gahyeon Nam</a>
								<li><a href="">Victory Lee</a>
								<li><a href="">Jeehun Kim</a>
							</ul>
							</p>
						</div>
						<hr>
						<a href="#"><i class="fa fa-pencil"></i> edit profile</a>
						<hr>
					</div>
				</div>
				<br>

				<!-- Accordion -->
				<div class="w3-card-2 w3-round">
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

						<button onclick="myFunction('Demo3')"
							class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa fa-video-camera fa-fw w3-margin-right"></i> 지난 라이브
							영상
						</button>
						<div id="Demo3" class="w3-accordion-content w3-container">
							<div class="w3-row-padding">
								<br>
								<div class="w3-half">
									<img src="/w3images/lights.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/nature.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/mountains.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/forest.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/nature.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/fjords.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
							</div>
						</div>

						<button onclick="myFunction('Demo2')"
							class="w3-btn-block w3-theme-l1 w3-left-align">
							<i class="fa	fa fa-align-left fa-fw w3-margin-right"></i> The One
							크루의 게시글 모아보기
						</button>
						<div id="Demo2" class="w3-accordion-content w3-container">
							<p>
							<ul>
								<li>[잡담] 요즘 힙합이...<br>
								<li>[믹스테잎] my way<br>
							</ul>
							</p>
						</div>
					</div>
				</div>
				<br>

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

				<!-- Alert Box -->
				<div
					class="w3-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
					<span onclick="this.parentElement.style.display='none'"
						class="w3-hover-text-grey w3-closebtn"> <i
						class="fa fa-remove"></i>
					</span>
					<p>
						<strong>잠깐!</strong>
					</p>
					<p>다른 Driver의 버스에 탑승하면 다양한 정보를 받아보실 수 있습니다.</p>
				</div>

				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">

				<div class="w3-container w3-card-2 w3-theme-l1 w3-round w3-margin">
					<br>
					<button
						class="w3-btn w3-btn-block w3-center w3-theme-l1 w3-padding-large">
						<br>
						<br> <i class="fa fa-video-camera w3-xxlarge"></i>
						<p>Start Live Drive!</p>
						<br>
						<br>
					</button>
				</div>

				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h6 class="w3-opacity">이곳에 메시지를 남기세요.</h6>
								<p contenteditable="true" class="w3-border w3-padding">좋은
									음악이에요!</p>
								<button type="button" class="w3-btn w3-theme">
									<i class="fa fa-pencil"></i>  Post
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 60px">
					<span class="w3-right w3-opacity">16 min</span>
					<h4>Jueun Jeong</h4>
					<br>
					<hr class="w3-clear">
					<p>안녕하세요!!!!</p>
					<!-- 	
        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      -->
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 60px">
					<span class="w3-right w3-opacity">32 min</span>
					<h4>Victory Lee</h4>
					<br>
					<hr class="w3-clear">
					<p>다음 라이브 언제에요???</p>
					<!-- 
			        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			         -->
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar"
						class="w3-left w3-circle w3-margin-right" style="width: 60px">
					<span class="w3-right w3-opacity">1 min</span>
					<h4>JD Yoo</h4>
					<br>
					<hr class="w3-clear">
					<p>공연하신다면서요? 꼭 갈게요!</p>
					<!--    
			        <div class="w3-row-padding" style="margin:0 -16px">
				            <div class="w3-half">
				              <img src="${project}/view/img/notice3.png" style="width:100%" alt="some photos" class="w3-margin-bottom">
				            </div>
				            <div class="w3-half">
				              <img src="${project}/view/img/notice2.png" style="width:100%" alt="some photos" class="w3-margin-bottom">
				        	</div>
			     	</div>
			    	-->
					<!--    
			        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			      	-->
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
							<button type="button" class="w3-btn w3-themel4">
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
							<button type="button" class="w3-btn w3-themel4">
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
				<br>

				<div class="w3-card-2 w3-round w3-white w3-center">
					<div class="w3-container">
						<p>Crew 가입 요청</p>
						<img src="${project}/view/img/HipBusLogo_bw.png" alt="Avatar" style="width: 50%"><br>
						<span>JH Jeong</span>
						<div class="w3-row w3-opacity">
							<div class="w3-half">
								<button class="w3-btn w3-green w3-btn-block w3-section"
									title="Accept">
									<i class="fa fa-check"></i>
								</button>
							</div>
							<div class="w3-half">
								<button class="w3-btn w3-red w3-btn-block w3-section"
									title="Decline">
									<i class="fa fa-remove"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<br>


				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<c:import url="footer.jsp"/>

</body>
