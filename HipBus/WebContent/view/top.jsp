<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/navbar_top_setting.jsp"%>
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
				<i class="fa fa-bus w3-margin-right"></i>${str_name}
			</a>
		</li>
		<li class="w3-hide-small w3-dropdown-hover">
			<a href="#" class="w3-padding-large w3-hover-white" title="go">
				<i class="fa fa-chevron-down"></i>
			</a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<a href="station.do">${str_station}</a>
				<a href="garage.do">${str_garage}</a>
			</div>
		</li>

		<c:if test="${sessionScope.memEmail eq null}">
			<!-- ^ 로그인 되어 있지 않은 경우에 로그인 요청 메시지 -->
			<li>
				<a onclick="document.getElementById('login').style.display='block'">로그인 해주세요.</a>
			</li>
		</c:if>
		<c:if test="${sessionScope.memEmail ne null}">
			<!-- ^ 로그인 된 경우 친구목록과 검색기능 -->
			<li class="w3-hid	e-small w3-dropdown-hover">
				<a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers">
					<i class="fa fa-users"></i>
				</a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="myBus.do">JD Yoo의 버스</a>
					<a href="#">Jueun Jeong의 버스</a>
					<a href="#">JD Yoo의 버스</a>
					<a href="#">Jueun Jeong의 버스</a>
					<a href="#">JD Yoo의 버스</a>
					<a class="w3-center w3-small" onclick="document.getElementById('hoppedOnList').style.display='block'">
						<span>${str_more}</span>
					</a>
				</div>
			</li>
			<li class="w3-hide-small w3-dropdown-hover">
				<a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers">
					<i class="fa fa-search"></i>
				</a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<div class="w3-row w3-container w3-padding-16">
						<div class="w3-threequarter">
							<input type="text" class="w3-input" placeholder="${str_search}">
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
					<a class="w3-center w3-small" onclick="document.getElementById('driverSearch').style.display='block'">
						<span>${str_more}</span>
					</a>
				</div>
			</li>
		</c:if>
		<c:if test="${sessionScope.memEmail ne null}">
			<!-- 로그인된 경우 로그아웃 버튼, my bus로 가기, crewbus로 가기 버튼 보이게 -->

			<li class="w3-hide-small w3-right">
				<!-- 로그아웃 -->
				<form name="signOutForm" method="post" action="signOutPro.do">
					<input type="submit" value="${str_signOut}" class="w3-btn w3-theme-d2 w3-padding-large w3-hover-white">
					<input name="urlToGoBack" type="hidden">
					<!-- ^ 로그아웃 후 돌아올 현재 페이지 url을 기억.-->
					<script type="text/javascript">
						//<!--
						$(document).ready(
							function() {
								//여기서 hidden값을 현재 페이지 url로 바꿔줌.
								signOutForm.urlToGoBack.value = location.href;
							}
						);
					//-->
					</script>
				</form>
			</li>

			<li class="w3-hide-small w3-right">
				<a href="myBus.do?driver=${sessionScope.memEmail}" class="w3-padding-large w3-hover-white" title="${str_myBus}">
					<c:if test="${member.imglocation eq null}">
						<img src="${project}/view/img/HipBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
					</c:if>
					<c:if test="${member.imglocation ne null}">
						<img src="${project}/hipbusSave/${member.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
					</c:if>
				</a>
			</li>

			<c:if test="${myCrews ne null}">
				<!-- 가입한 크루가 있으면 -->
				<c:forEach var="myCrew" items="${myCrews}" begin="0" end="${fn:length(myCrews)}">
					<li class="w3-hide-small w3-right">
						<a href="crewBus.do?driver=${myCrew.crewid}" class="w3-padding-large w3-hover-white" title="${str_crewBus}">
							<c:if test="${myCrew.imglocation eq null}">
								<img src="${project}/view/img/CrewBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
							</c:if>
							<c:if test="${myCrew.imglocation ne null}">
								<img src="${project}/hipbusSave/${myCrew.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
							</c:if>
						</a>
					</li>
				</c:forEach>
			</c:if>


		</c:if>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 51px">
	<ul class="w3-navbar w3-left-align w3-large w3-theme">
		<li>
			<a class="w3-padding-large" href="#">${str_other}</a>
		</li>
		<li>
			<a class="w3-padding-large" href="#">${str_station}</a>
		</li>
		<li>
			<a class="w3-padding-large" href="#">${str_garage}</a>
		</li>
	</ul>
</div>

<!-- member 검색결과창 -->
<c:import url="modal_hoppedOnList.jsp" />

<!-- member 검색결과창 -->
<c:import url="modal_driverSearch.jsp" />

<!-- login 모달 창 -->
<c:import url="modal_signIn.jsp" />