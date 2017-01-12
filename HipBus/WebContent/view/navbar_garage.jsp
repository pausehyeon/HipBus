<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidenav  -->
	<nav
		class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-right w3-padding-xlarge"
		style="z-index: 3; right: 0; width: 20%;"
		id="mySidenav">
		<!-- style="z-index:3;width:250px;margin-top:51px;" -->
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large"
			title="close menu"> <i class="fa fa-remove"></i>
		</a>
		<h4>
			<b>Public Garage</b>
		</h4>
		<a href="garage.do" class="w3-hover-opacity"> News </a>
		<a href="garageOnAir.do" class="w3-hover-opacity"> On Air </a> 
		<a href="garageUpcoming.do" class="w3-hover-opacity"> Upcoming </a>
		<a href="garageWanted.do" class="w3-hover-opacity"> Wanted </a>
		<a href="garageFAQ.do" class="w3-hover-opacity"> FAQ</a>
	</nav>

	<!-- Side Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-bottom w3-hide-large w3-hide-medium" id="myNavbar">
		<ul
			class="w3-navbar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<li class="w3-left" style="width: 25% !important"><a href="#"> News </a></li>
			<li class="w3-left" style="width: 25% !important"><a href="#"> On Air </a></li>
			<li class="w3-left" style="width: 25% !important"><a href="#"> Upcoming </a></li>
			<li class="w3-left" style="width: 25% !important"><a href="#"> Wanted </a></li>
			<li class="w3-left" style="width: 25% !important"><a href="#"> FAQ </a></li>
		</ul>
	</div>