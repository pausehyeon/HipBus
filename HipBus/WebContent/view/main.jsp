<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<!-- SETTING 끝 -->

<title>${str_welcome}</title>
<body onload="showDivs(1)">

	<c:import url="navbar_main.jsp" />

	<!-- Content -->
	<div class="w3-content" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
		<div class="w3-row w3-container w3-padding-64">
			<!-- 여백 -->
		</div>
		<!-- Join in -->
		<div class="w3-container w3-red w3-center w3-padding-128" style="max-width: 1100px; margin-top: 0px; margin-bottom: 80px">
			<h1 class="w3-margin w3-jumbo">${str_topTitle}</h1>
			<p class="w3-xlarge">
				${str_topContent1}<br>
			</p>
			<c:if test="${sessionScope.memEmail eq null}">
				<button class="w3-btn w3-padding-16 w3-large w3-margin-top" onclick="location='mainSignUp.do'">
					<i class="fa fa-address-card w3-xxsmall"></i> ${str_topContent2}
				</button>
				<p class="w3-xsmall">
					<a href="mainSignIn.do">${str_topContentsignIn}</a>
				</p>
			</c:if>
			<c:if test="${sessionScope.memEmail ne null}">
				<p class="w3-xsmall">
					<span>(불러온닉네임)</span>${str_welcomeMain}
				</p>
				<form name="signOutForm" method="post" action="signOutPro.do">
					<input type="submit" value="&#xf08b;${str_signOut}" class="w3-btn w3-padding-16 w3-large w3-margin-top">
					<!-- ^ &#xf08b;는 fontawesome의 fa-sign-out 아이콘. <i></i>를 넣을 수 없어서 css의 font-family를 FontAwesome으로 바꿈. http://fontawesome.io/cheatsheet/ 참조 -->
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
			</c:if>

		</div>

		<div class="w3-center w3-padding-64" id="news">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_mainNews}</span>
		</div>
		<!-- Slideshow -->

		<div class="w3-container">
			<div class="w3-display-container mySlides">
				<img src="${project}/view/img/notice1.png" style="width: 100%">
				<div class="w3-display-topleft w3-container w3-padding-32">
					<span class="w3-white w3-padding-large w3-animate-bottom">${str_slideShow1}</span>
				</div>
			</div>
			<div class="w3-display-container mySlides">
				<img src="${project}/view/img/notice2.png" style="width: 100%">
				<div class="w3-display-middle w3-container w3-padding-32">
					<span class="w3-white w3-padding-large w3-animate-bottom">${str_slideShow2}</span>
				</div>
			</div>
			<div class="w3-display-container mySlides">
				<img src="${project}/view/img/notice3.png" style="width: 100%">
				<div class="w3-display-topright w3-container w3-padding-32">
					<span class="w3-white w3-padding-large w3-animate-bottom">${str_slideShow3}</span>
				</div>
			</div>

			<!-- Slideshow next/previous buttons -->

			<div class="w3-container w3-dark-grey w3-padding-8 w3o-xlarge">
				<div class="w3-left" onclick="plusDivs(-1)">
					<i class="fa fa-arrow-circle-left w3-hover-text-teal"></i>
				</div>
				<div class="w3-right" onclick="plusDivs(1)" id="nextslide">
					<i class="fa fa-arrow-circle-right w3-hover-text-teal"></i>
				</div>

				<div class="w3-center">
					<span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span> <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
					<span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
				</div>
			</div>
		</div>

		<!-- On air Section -->
		<div class="w3-center w3-padding-64" id="onair">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">str_mainOnAir</span>
		</div>

		<div class="w3-row-padding">
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">AAA의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 100%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">BBB의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 100%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">CCC의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 100%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">DDD의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 100%">
				</div>
			</div>
		</div>

		<div class="w3-row-padding">
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">EEE의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 99%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">FFF의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 99%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">GGG의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 99%">
				</div>
			</div>
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">HHH의 방송</div>
					<img src="${project}/view/img/player.png" alt="House" style="width: 99%">
				</div>
			</div>
		</div>

		<!-- Grid -->
		<div class="w3-row-padding" id="topdrivers">
			<div class="w3-center w3-padding-64">
				<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_top3}</span>
			</div>

			<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4">
					<img src="${project}/view/img/topdriver1.png" alt="John" style="width: 100%">
					<div class="w3-container">
						<h3>aaa</h3>
						<p class="w3-opacity">AAA</p>
						<p>
							그룹 AAA입니다.<br> 다음 주 공연 많이 찾아주세요!
						</p>
						<p>
							<button class="w3-btn-block">${str_hopOn}</button>
						</p>
					</div>
				</div>
			</div>

			<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4">
					<img src="${project}/view/img/topdriver2.png" alt="Mike" style="width: 100%">
					<div class="w3-container">
						<h3>bbb</h3>
						<p class="w3-opacity">BBB</p>
						<p>
							BBB입니다.<br> 안녕하세요.
						</p>
						<p>
							<button class="w3-btn-block">${str_hopOn}</button>
						</p>
					</div>
				</div>
			</div>

			<div class="w3-third w3-margin-bottom">
				<div class="w3-card-4">
					<img src="${project}/view/img/topdriver3.png" alt="Jane" style="width: 100%">
					<div class="w3-container">
						<h3>ccc</h3>
						<p class="w3-opacity">CCC</p>
						<p>
							반갑습니다.<br>안녕하세ㅛㅇ...
						</p>
						<p>
							<button class="w3-btn-block">${str_hopOn}</button>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Grid -->
		<div class="w3-center w3-padding-64" id="upcoming">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_upcoming}</span>
		</div>
		<div class="w3-row-padding">
			<div class="w3-third w3-margin-bottom">
				<ul class="w3-ul w3-border w3-center w3-hover-shadow">
					<li class="w3-black w3-xlarge w3-padding-32">Seoul Festa</li>
					<li class="w3-padding-16">
						<b>장소</b> 홍대 놀이터
					</li>
					<li class="w3-padding-16">
						<b>일시</b> 2월 1일
					</li>
					<li class="w3-padding-16">
						<b>출연진</b> Some one
					</li>
					<li class="w3-padding-16">
						<b>시간</b> 1h 30mins
					</li>
					<li class="w3-padding-16">
						<h2 class="w3-wide">15,000</h2>
						<span class="w3-opacity">원 (1 Free Drink 포함)</span>
					</li>
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-btn w3-green w3-padding-large">${str_detail}</button>
					</li>
				</ul>
			</div>

			<div class="w3-third w3-margin-bottom">
				<ul class="w3-ul w3-border w3-center w3-hover-shadow">
					<li class="w3-dark-grey w3-xlarge w3-padding-32">Fiesta de alguien</li>
					<li class="w3-padding-16">
						<b>장소</b> 신촌 플레이버스
					</li>
					<li class="w3-padding-16">
						<b>일시</b> 2월 1일
					</li>
					<li class="w3-padding-16">
						<b>출연진</b> Some one
					</li>
					<li class="w3-padding-16">
						<b>시간</b> 1h 30mins
					</li>
					<li class="w3-padding-16">
						<h2 class="w3-wide">15,000</h2>
						<span class="w3-opacity">원 (1 Free Drink 포함)</span>
					</li>
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-btn w3-green w3-padding-large">${str_detail}</button>
					</li>
				</ul>
			</div>

			<div class="w3-third w3-margin-bottom">
				<ul class="w3-ul w3-border w3-center w3-hover-shadow">
					<li class="w3-black w3-xlarge w3-padding-32">Holiday Busking</li>
					<li class="w3-padding-16">
						<b>장소</b> 가로수길
					</li>
					<li class="w3-padding-16">
						<b>일시</b> 2월 1일
					</li>
					<li class="w3-padding-16">
						<b>출연진</b> Some one
					</li>
					<li class="w3-padding-16">
						<b>시간</b> 1h 30mins
					</li>
					<li class="w3-padding-16">
						<h2 class="w3-wide">15,000</h2>
						<span class="w3-opacity">원 (1 Free Drink 포함)</span>
					</li>
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-btn w3-green w3-padding-large">${str_detail}</button>
					</li>
				</ul>
			</div>
		</div>

		<!-- Contact -->
		<div class="w3-center w3-padding-64" id="contact">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_contactUs}</span>
		</div>

		<div class="w3-row-padding w3-padding-64">
			<form class="w3-container" action="form.asp" target="_blank">
				<div class="w3-group">
					<label>Name</label>
					<input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" type="text" name="Name" required>
				</div>
				<div class="w3-group">
					<label>Email</label>
					<input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" type="text" name="Email" required>
				</div>
				<div class="w3-group">
					<label>Subject</label>
					<input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" name="Subject" required>
				</div>
				<div class="w3-group">
					<label>Message</label>
					<input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" name="Message" required>
				</div>
				<button type="submit" class="w3-btn w3-btn-block w3-padding-12">${str_mainSend}</button>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="../bottom.do" />
</body>


<!-- login 모달 창 (위치 상관 없음) -->
<c:import url="modal_signIn.jsp" />

</html>
