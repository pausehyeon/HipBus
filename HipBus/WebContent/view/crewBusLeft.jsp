<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>


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
				<i class="fa fa-facebook-square fa-fw w3-margin-right w3-text-theme"></i>
				email@address.com
			</p>
			<p onclick="myFunction('crew')">
				<i class="fa fa-users fa-fw w3-margin-right w3-text-theme"></i> 크루
				구성원 (2명)
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
				<i class="fa fa-video-camera fa-fw w3-margin-right"></i> 지난 라이브 영상
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
