<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<!-- SETTING 끝 -->

<!-- Icon Bar (Sidenav - hidden on small screens) -->
<nav class="w3-sidenav w3-center w3-small w3-hide-small">
	<!-- Avatar image in top left corner -->
	<img src="${project}/view/img/HipBusLogo_colored.png" onclick="location='${project}/main.do'" style="width: 100%" class="w3-padding-large w3-padding-32">
	<div class="w3-accordion">
		<a onclick="myAccordion('letsdrive')" class="w3-padding-large w3-hover-black">
			<p>
				Let's Drive! &nbsp;<i class="fa fa-caret-down"></i>
			</p>
		</a>
		<div id="letsdrive" class="w3-accordion-content w3-animate-left w3-padding w3-left-align">

			<c:if test="${sessionScope.memEmail ne null }">
				<!-- 로그인 된 상태에서 보임 -->
				<a href="myBus.do?driver=${sessionScope.memEmail}">
					<i class="fa fa-bus"></i> ${str_myBus}
				</a>

				<c:if test="${myCrews ne null and myCrews.size() ne 0}">
					<!-- 소속된 크루가 있을 때만 보임 -->
					<c:forEach var="myCrew" begin="0" end="${fn:length(myCrews)}" step="1" items="${myCrews}">
					
						<a href="crewBus.do?driver=${myCrew.crewid}">
							<i class="fa fa-fort-awesome"></i> ${myCrew.crewname}
						</a>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.memEmail eq null }">
				<!-- 로그인 안 된 상태에서 보임 -->
				<a onclick="document.getElementById('login').style.display='block'">${str_signIn}</a>
			</c:if>
			<!-- 로그인 여부 관계없이 항상 보임 -->
			<a href="station.do">${str_mainStation}</a>
			<a href="garage.do">${str_publicGarage}</a>
			<c:if test="${sessionScope.memEmail ne null }">
				<c:if test="${member.mem_level eq 3}">
					<!-- 관리자에게만 보임 -->
					<a href="admin.do">${str_management}</a>
				</c:if>
			</c:if>
		</div>
	</div>
	<a class="w3-padding-large w3-hover-black" href="#">
		<i class="fa fa-bus w3-xxlarge"></i>
		<p>${str_topTitle}</p>
	</a>
	<a class="w3-padding-large w3-hover-black" href="#news">
		<i class="fa fa-bullhorn w3-xxlarge"></i>
		<p>${str_news}</p>
	</a>
	<a class="w3-padding-large w3-hover-black" href="#onair">
		<i class="fa fa-youtube-play w3-xxlarge"></i>
		<p>${str_onAir}</p>
	</a>
	<a class="w3-padding-large w3-hover-black" href="#topdrivers">
		<i class="fa fa-thumbs-up w3-xxlarge"></i>
		<p>${str_topDrivers}</p>
	</a>
	<a class="w3-padding-large w3-hover-black" href="#upcoming">
		<i class="fa fa-calendar w3-xxlarge"></i>
		<p>${str_upcoming}</p>
	</a>
	</a>
	<a class="w3-padding-large w3-hover-black" href="#contact">
		<i class="fa fa-paper-plane w3-xxlarge"></i>
		<p>${str_contact}</p>
	</a>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
	<ul class="w3-navbar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
		<li class="w3-left" style="width: 25% !important"><a href="#">${str_topTitle}</a></li>
		<li class="w3-left" style="width: 25% !important"><a href="#news">${str_news}</a></li>
		<li class="w3-left" style="width: 25% !important"><a href="#onair">${str_onAir}</a></li>
		<li class="w3-left" style="width: 25% !important"><a href="#topdrivers">${str_topDrivers}</a></li>
		<li class="w3-left" style="width: 25% !important"><a href="#upcoming">${str_upcoming}</a></li>
		<li class="w3-left" style="width: 25% !important"><a href="#contact">${str_contact}</a></li>
	</ul>
</div>