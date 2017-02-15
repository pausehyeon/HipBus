<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<!-- SETTING 끝 -->

<title>${str_welcome}</title>
<c:if test="${hasNewsArticle eq 0} }">
	<body>
</c:if>
<c:if test="${hasNewsArticle eq 1} }">
	<body onload="showDivs(1)">
</c:if>
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
				<span>${member.nick}</span>${str_welcomeMain}
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
		<c:if test="${hasNewsArticle eq 0} }">
			<p>${str_noNewsArticles}</p>
		</c:if>

		<c:forEach var="newsArticle" begin="0" end="${fn:length(newsArticles)}" step="1" items="${newsArticles}">
			<div class="w3-display-container mySlides">
				<img src="${project}/${newsArticle.imglocation}" alt="news thumbnail" onclick="location='garageNewsRead.do?num=${newsArticle.num}'" style="width: 100%">
				<div class="w3-display-topleft w3-container w3-padding-32">
					<span class="w3-white w3-padding-large w3-animate-bottom">${newsArticle.subject}</span>
				</div>
			</div>
		</c:forEach>

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
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_mainOnAir}</span>
	</div>
	
	<div class="w3-row-padding" id="onairsection">
	</div>
	
	<div class="w3-row-padding" id="onairloadingsection">
	</div>
	
	<script type="text/javascript">
	//<!--
		//채널 아이디를 주면 라이브 중인 채널의 썸네일을 출력해주는 function
		function checkonair(channelId){
			var googleApiKey = "AIzaSyBkLOF2M3MDF-RiayKdaKrBhPu4faiSWtA";
			var params = "part=snippet&channelId="+channelId+"&type=video&eventType=live&key="+googleApiKey;
			var request;
			request = new Request( function(){
						var onairsection = document.getElementById('onairsection');
						var onairloadingsection = document.getElementById('onairloadingsection');
						if(request.httpRequest.readyState == 4){
							if(request.httpRequest.status == 200){
								var jsonData = eval( "("+request.httpRequest.responseText.trim() +")");
								if(jsonData.pageInfo.totalResults != 0){
									//라이브 방송중인 경우
									//var videoId = jsonData.items[0].id.videoId;
									var title = jsonData.items[0].snippet.title;
									var thumbnail = jsonData.items[0].snippet.thumbnails.high.url;
									
									var msg = "";
									msg += "<div class='w3-col l3 m6 w3-margin-bottom'>";
									msg += "	<div class='w3-display-container'>";
									msg += "		<div class='w3-display-topleft w3-black w3-padding'>"+title+"</div>";
									msg += "		<img src='"+thumbnail+"' alt='thumbnail' style='width: 100%'>";
									msg += "	</div>";
									msg += "</div>";
									
									onairsection.innerHTML += msg;
								}else{
									//라이브 방송 중이 아닌 경우
								}
								onairloadingsection.innerHTML = "";
							}else{
								onairloadingsection.innerHTML = "<p> 오류 발생"+request.status+" </p>";
							}
						}else{
							onairloadingsection.innerHTML = "<img src='${project}/view/img/loading.gif' alt='로딩 중입니다' style='width:100px;'>";
						}
					},
					"https://www.googleapis.com/youtube/v3/search",
					"GET",
					params);
			request.sendRequest();
		}
	
		//채널 목록 받아와서 라이브 중인지 체크하여 출력
		function getonairlist(){
			var channelsJson = eval("${channelsJson}");
			for(var i=0; i<channelsJson.length; i++){
				var channel_id = channelsJson[i].channel_id;
				var driver = channelsJson[i].driver;
				checkonair(channel_id);
			}
		}
		
		//위의 function을 실행
		$(document).ready(function(){
				getonairlist();
			}
		);
	//-->
	</script>

	<!-- Grid -->
	<div class="w3-row-padding" id="topdrivers">
		<div class="w3-center w3-padding-64">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_top3}</span>
		</div>
		<c:if test="${hasTopDriver eq 0}">
			<p class="w3-center">${str_noTopDriver}</p>
		</c:if>
		<c:if test="${hasTopDriver ne 0}">
			<c:forEach var="topdriver" begin="0" end="${fn:length(topdrivers)}" step="1" varStatus="status" items="${topdrivers}">
				<div class="w3-third w3-margin-bottom">
					<div class="w3-card-4">
						<img src="${project}/${topdriver.imglocation}" alt="top driver's profile" style="width: 100%">
						<div class="w3-container">
							<h5>
								<span class="w3-text-right w3-text-khaki"><i class="fa fa-diamond"></i> ${topdriver.driverRanking}${str_rank}</span> ${topdriver.nick}
							</h5>
							<p class="w3-opacity">
								<span>${topdriver.passengersCount}</span>${str_passengerCount}</p>
							<p>
								<a href="${topdriver.url}" class="w3-btn-block">${str_hopOn}</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<!-- Grid -->
	<div class="w3-center w3-padding-64" id="upcoming">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_upcoming}</span>
	</div>
	<div class="w3-row-padding">
		<c:if test="${hasUpcoming eq 0}">
			<div class="w3-container">${str_noUpcomings}</div>
		</c:if>
		<c:if test="${hasUpcoming eq 1}">
			<c:forEach var="upcoming" begin="0" end="${fn:length(upcomings)}" items="${upcomings}">
				<div class="w3-third w3-margin-bottom">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-black w3-xlarge w3-padding-16">${upcoming.subject}</li>
						<li>
							<img src="${project}/hipbusSave/${upcoming.imglocation}" alt="${str_upcoming}" style="width: 100%">
						</li>
						<li class="w3-padding-8">
							<b>${str_perf_place}</b> ${upcoming.perf_place}
						</li>
						<li class="w3-padding-8">
							<b>${str_perf_date}</b>
							<fmt:formatDate value="${upcoming.perf_date}" type="both" pattern="yy.MM.dd  a HH:mm" />
						</li>
						<li class="w3-padding-8">
							<b>${str_perf_cast}</b> ${upcoming.perf_cast}
						</li>
						<li class="w3-padding-8">
							<b>${str_perf_runningtime}</b> ${upcoming.perf_runningtime}${str_minute}
						</li>
						<li class="w3-light-grey w3-padding-24">
							<a href="${upcoming.url}?num=${upcoming.num}" class="w3-btn w3-green w3-padding-large">${str_detail}</a>
						</li>
					</ul>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<!-- Contact -->
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_contactUs}</span>
	</div>

	<div class="w3-row-padding w3-padding-64">
		<form name="contactForm" action="mainContactUsPro.do" method="post" class="w3-container">
			<div class="w3-group">
				<label>Name</label>
				<input type="text" name="name" required class="w3-input w3-border w3-hover-border-black" style="width: 100%;">
			</div>
			<div class="w3-group">
				<label>Email</label>
				<input type="text" name="email" required class="w3-input w3-border w3-hover-border-black" style="width: 100%;">
				<script type="text/javascript">
					$(document).ready(function() {
						/* 로그인된 경우 기본값을 로그인된 이메일로 */
						contactForm.email.value = "${sessionScope.memEmail}"
					});
				//-->
				</script>
			</div>
			<div class="w3-group">
				<label>Subject</label>
				<input name="subject" required class="w3-input w3-border w3-hover-border-black" style="width: 100%;">
			</div>
			<div class="w3-group">
				<label>Message</label>
				<input name="content" required class="w3-input w3-border w3-hover-border-black" style="width: 100%;">
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
