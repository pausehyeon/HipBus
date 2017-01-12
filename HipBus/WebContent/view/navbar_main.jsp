<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>

<!-- Icon Bar (Sidenav - hidden on small screens) -->
<nav class="w3-sidenav w3-center w3-small w3-hide-small">
	<!-- Avatar image in top left corner -->
	<img class="w3-padding-large w3-padding-32"
		src="${project}/view/img/HipBusLogo_colored.png" style="width: 100%">
	<div class="w3-accordion">
		<a onclick="myAccordion('letsdrive')"
			class="w3-padding-large w3-hover-black">
			<p>
				Let's Drive! &nbsp;<i class="fa fa-caret-down"></i>
			</p>
		</a>
		<div id="letsdrive" class="w3-accordion-content w3-animate-left w3-padding">
			
			<!-- 로그인 된 상태에서 보임
			<a href="myBus.do">My Bus</a>
			<a href="crewBus.do">Crew's Bus</a>
			-->
			<!-- 로그인 안 된 상태에서 보임 -->
			<a onclick="document.getElementById('login').style.display='block'">Log in</a>
			
			<!-- 로그인 여부 관계없이 항상 보임 -->
			<a href="station.do">Main Station</a>
			<a href="garage.do">Public Garage</a>
			<a href="admin.do">Management(관리자에게만 보임)</a>
		</div>
	</div>
	<a class="w3-padding-large w3-hover-black" href="#"> <i
		class="fa fa-bus w3-xxlarge"></i>
		<p>What's HipBus</p>
	</a> <a class="w3-padding-large w3-hover-black" href="#news"> <i
		class="fa fa-bullhorn w3-xxlarge"></i>
		<p>News</p>
	</a> <a class="w3-padding-large w3-hover-black" href="#onair"> <i
		class="fa fa-youtube-play w3-xxlarge"></i>
		<p>On Air</p>
	</a> <a class="w3-padding-large w3-hover-black" href="#topdrivers"> <i
		class="fa fa-thumbs-up w3-xxlarge"></i>
		<p>Top Drivers</p>
	</a> <a class="w3-padding-large w3-hover-black" href="#upcoming"> <i
		class="fa fa-calendar w3-xxlarge"></i>
		<p>Upcoming</p>
	</a> </a> <a class="w3-padding-large w3-hover-black" href="#contact"> <i
		class="fa fa-paper-plane w3-xxlarge"></i>
		<p>Contact</p>
	</a>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
	<ul
		class="w3-navbar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
		<li class="w3-left" style="width: 25% !important"><a href="#">What's
				HipBus</a></li>
		<li class="w3-left" style="width: 25% !important"><a
			href="#news">News</a></li>
		<li class="w3-left" style="width: 25% !important"><a
			href="#onair">On Air</a></li>
		<li class="w3-left" style="width: 25% !important"><a
			href="#topdrivers">Top Drivers</a></li>
		<li class="w3-left" style="width: 25% !important"><a
			href="#upcoming">Upcoming</a></li>
		<li class="w3-left" style="width: 25% !important"><a
			href="#contact">CONTACT</a></li>
	</ul>
</div>