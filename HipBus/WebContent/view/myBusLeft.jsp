<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>


<!-- Left Column -->
<div class="w3-col m3">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white w3-margin-bottom">
		<div class="w3-container">
			<h4 class="w3-center">${str_myProfile}</h4>
			<p class="w3-center">
				<img src="${project}/view/img/HipBusLogo_colored_sq.png"
					class="w3-circle" style="height: 106px; width: 106px" alt="Avatar">
			</p>
			<hr>
			<p>
				<i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>
				Gahyeon Nam
			</p>
			<p>
				<i class="fa fa-facebook-square fa-fw w3-margin-right w3-text-theme"></i>
				email@address.com
			</p>
			<p>
				<i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i>
				Best Driver
			</p>
			<button name="hop" onclick="location='myBusHopOnPro.do?driver=${driver}&email=${email}&hopORnot=${hopORnot}'">
				${str_hop} &nbsp; ${hopORnot}
			</button>
			<p onclick="myFunction('crew')">
				<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i>
				${str_crew} The One
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
			<a href="myBusBeforeEdit.do"><i class="fa fa-pencil"></i>${str_editProfile}</a>
			<hr>
		</div>
	</div>

	<!-- Accordion -->
	<div class="w3-card-2 w3-round w3-margin-bottom">
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
			<button onclick="location='myBusVideos.do'"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-video-camera fa-fw w3-margin-right"></i> ${str_oldVideos}
			</button>
			<div id="Demo3" class="w3-accordion-content w3-container">
				<div class="w3-row-padding">
					<div class="w3-half"></div>
				</div>
			</div>

			<button onclick="myFunction('Demo2')"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa	fa fa-align-left fa-fw w3-margin-right"></i> Gahyeon ${str_seePosts}
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
</div>
<!-- End Left Column -->
</html>
