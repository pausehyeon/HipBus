<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>

<script type="text/javascript">
	//Used to toggle the menu on smaller screens when clicking on the menu button
	function openNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
//-->
</script>

<div class="w3-top">
	<ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
		<li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
			<a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
				<i class="fa fa-bars"></i>
			</a>
		</li>
		<li>
			<a href="main.do" class="w3-padding-large w3-theme-d4">
				<i class="fa fa-bus w3-margin-right"></i>HipBus
			</a>
		</li>
		<li class="w3-hide-small w3-dropdown-hover"><a href="#"
			class="w3-padding-large w3-hover-white" title="go"><i
				class="fa fa-chevron-down"></i></a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<a href="station.do">Main Station</a> <a
					href="garage.do">Public Garage</a>
			</div></li>

		<li class="w3-hide-small w3-dropdown-hover">
			<a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers">
				<i class="fa fa-users"></i>
			</a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<a href="myBus.do">JD Yoo의 버스</a>
				<a href="#">Jueun Jeong의 버스</a>
				<a href="#">JD Yoo의 버스</a>
				<a href="#">Jueun Jeong의 버스</a>
				<a href="#">JD Yoo의 버스</a>
				<a class="w3-center w3-small" onclick="document.getElementById('hoppedOnList').style.display='block'"><span>더 보기</span></a>
			</div>
		</li>
		<li class="w3-hide-small w3-dropdown-hover">
			<a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers">
				<i class="fa fa-search"></i>
			</a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<div class="w3-row w3-container w3-padding-16">
					<div class="w3-threequarter">
						<input type="text" class="w3-input" placeholder="Driver/Crew 찾기">
					</div>
					<div class="w3-quarter w3-right-align">
						<i class="fa fa-search"></i>
					</div>
				</div>
				<a href="myBus.do">JD Yoo의 버스</a>
				<a href="#">Jueun Jeong의 버스</a>
				<a href="#">JD Yoo의 버스</a>
				<a href="#">Jueun Jeong의 버스</a>
				<a href="#">JD Yoo의 버스</a>
				<a class="w3-center w3-small" onclick="document.getElementById('driverSearch').style.display='block'"><span>더 보기</span></a>
			</div>	
		</li>
		<li>
			<a onclick="document.getElementById('login').style.display='block'">로그인 해주세요.</a>
		</li>
		
		<li class="w3-hide-small w3-right">
			<a href="myBus.do" class="w3-padding-large w3-hover-white" title="My Bus">
				<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="Avatar">
			</a>
		</li>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top"
	style="margin-top: 51px">
	<ul class="w3-navbar w3-left-align w3-large w3-theme">
		<li><a class="w3-padding-large" href="#">Other Drivers</a></li>
		<li><a class="w3-padding-large" href="#">Main Station</a></li>
		<li><a class="w3-padding-large" href="#">Public Garage</a></li>
	</ul>
</div>

<!-- member 검색결과창 -->
<c:import url="modal_hoppedOnList.jsp"/>

<!-- member 검색결과창 -->
<c:import url="modal_driverSearch.jsp"/>

<!-- login 모달 창 -->
<c:import url="modal_signIn.jsp"/>