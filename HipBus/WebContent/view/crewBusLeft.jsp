<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>


<!-- Left Column -->
<div class="w3-col m3">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white">
		<div class="w3-container">
			<h4 class="w3-center">${str_crewProfile}</h4>
			<p class="w3-center">
				<img src="${project}/view/img/CrewBusLogo_colored_sq.png" class="w3-circle"
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
				<i class="fa fa-users fa-fw w3-margin-right w3-text-theme"></i> ${str_memberCount} 2 ${str_per}
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
			<a href="#"><i class="fa fa-pencil"></i>${str_editProfile}</a>
			<hr>
		</div>
	</div>
	<br>

	<!-- Accordion -->
	<div class="w3-card-2 w3-round">
		<div class="w3-accordion w3-white">
			<button onclick="myFunction('Demo1')"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa fa-heart fa-fw w3-margin-right"></i> ${str_hopperList}
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
				<i class="fa fa-video-camera fa-fw w3-margin-right"></i> ${str_oldVideos}
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
				${str_seePosts}
			</button>
			<div id="Demo2" class="w3-accordion-content w3-container">
				<p>
				<ul>
					<li><a href="#"> ${str_whole}</a>
					<li><a href="#"> ${str_rap}</a>
					<li><a href="#"> ${str_mixtape}</a>
					<li><a href="#"> ${str_vocal}</a>
					<li><a href="#"> ${str_lirics}</a>
					<li><a href="#"> ${str_freeTalk}</a>
				</ul>
				</p>
			</div>
		</div>
	</div>
	<br>

	<!-- Interests -->
	<div class="w3-card-2 w3-round w3-white w3-hide-small">
		<div class="w3-container">
			<p>${str_tags}</p>
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
			<strong>${str_infoTitle}</strong>
		</p>
		<p>${str_infoMsg}</p>
	</div>

	<!-- End Left Column -->
</div>
