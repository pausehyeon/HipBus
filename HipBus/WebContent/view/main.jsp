<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>

<!-- SETTING 끝 -->

<title>${str_welcome}</title>
<c:if test="${ newsArticles eq null or newsArticles.size() eq 0 }">
	<body>
</c:if>
<c:if test="${newsArticles ne null and newsArticles.size() ne 0}">
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
				<input type="submit" value="${str_signOut}" class="w3-btn w3-padding-16 w3-large w3-margin-top">
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
		<c:if test="${newsArticles eq null or newsArticles.size() eq 0}">
			<p class="w3-center">${str_noNewsArticles}</p>
		</c:if>
		<c:if test="${newsArticles ne null and newsArticles.size() ne 0}">
			<c:forEach var="newsArticle" begin="0" end="${fn:length(newsArticles)}" step="1" items="${newsArticles}">
				<div class="w3-display-container mySlides">
					<c:if test="${newsArticle.imglocation eq null}">
						<img src="${project}/view/img/notice2.png" alt="news thumbnail" onclick="location='garageNewsRead.do?num=${newsArticle.num}'" style="width: 100%">
					</c:if>
					<c:if test="${newsArticle.imglocation ne null}">
						<img src="${project}/hipbusSave/${newsArticle.imglocation}" alt="news thumbnail" onclick="location='garageNewsRead.do?num=${newsArticle.num}'" style="width: 100%">
					</c:if>
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
		</c:if>
	</div>

	<!-- On air Section -->
	<div class="w3-center w3-padding-64" id="onair">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_mainOnAir}</span>
	</div>

	<div class="w3-row-padding" id="onairsection"></div>
	<div class="w3-row-padding w3-center" id="onairloadingsection"></div>
	<script type="text/javascript">
		
	//<!--
		$(document).ready(function() {
			//OnAir 목록 받아오기
			getonairlist( eval("${channelsJson}"), "${googleApiKey}" );
		});
	
	//-->
	</script>

	<!-- Grid -->
	<div class="w3-row-padding" id="topdrivers">
		<div class="w3-center w3-padding-64">
			<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">${str_top3}</span>
		</div>
		<c:if test="${topdrivers eq null or topdrivers.size() eq 0}">
			<p class="w3-center">${str_noTopDriver}</p>
		</c:if>
		<c:if test="${topdrivers ne null and topdrivers.size() ne 0}">
			<c:forEach var="topdriver" begin="0" end="${fn:length(topdrivers)}" step="1" varStatus="status" items="${topdrivers}">
				<div class="w3-third w3-margin-bottom">
					<div class="w3-card-4">
						<c:if test="${topdriver.imglocation eq null}">
							<img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="top driver's profile" style="width: 100%">
						</c:if>
						<c:if test="${topdriver.imglocation ne null}">
							<img src="${project}/hipbusSave/${topdriver.imglocation}" alt="top driver's profile" style="width: 100%">
						</c:if>
						<div class="w3-container">
							<h5>
								<span class="w3-text-right w3-text-khaki"><i class="fa fa-diamond"></i> ${topdriver.driverRanking}${str_rank}</span> ${topdriver.nick}
							</h5>
							<p class="w3-opacity">
								<span>${topdriver.passengersCount}</span>${str_passengerCount}</p>
							<p>
								<c:if test="${fn:contains( topdriver.driver,'@') }">
									<!-- 개인인 경우 -->
									<a href="myBus.do?driver=${topdriver.driver}" class="w3-btn-block">${str_hopOn}</a>
								</c:if>
								<c:if test="${ not fn:contains( topdriver.driver,'@') }">
									<!-- 크루인 경우 -->
									<a href="crewBus.do?driver=${topdriver.driver}" class="w3-btn-block">${str_hopOn}</a>
								</c:if>
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
		<c:if test="${upcomings eq null or upcomings.size() eq 0}">
			<div class="w3-container w3-center">${str_noUpcomings}</div>
		</c:if>
		<c:if test="${upcomings ne null and upcomings.size() ne 0}">
			<c:forEach var="upcoming" begin="0" end="${fn:length(upcomings)}" items="${upcomings}">
				<div class="w3-third w3-margin-bottom">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<c:if test="${fn:length(upcoming.subject) gt 10}">
							<li class="w3-black w3-xlarge w3-padding-16">${fn:substring(upcoming.subject, 0, 10)}...</li>
						</c:if>
						<c:if test="${fn:length(upcoming.subject) le 10}">
							<li class="w3-black w3-xlarge w3-padding-16">${upcoming.subject}</li>
						</c:if>
						<li class="w3-center w3-padding-8 w3-padding-small"><img src="${project}/hipbusSave/${upcoming.imglocation}" alt="${str_upcoming}" style="width: 100%"></li>
						<li class="w3-padding-8"><b>${str_perf_place}</b> ${upcoming.perf_place}</li>
						<li class="w3-padding-8"><b>${str_perf_date}</b> <fmt:formatDate value="${upcoming.perf_date}" type="both" pattern="yy.MM.dd  a HH:mm" /></li>
						<li class="w3-padding-8"><b>${str_perf_cast}</b> ${upcoming.perf_cast}</li>
						<li class="w3-padding-8"><b>${str_perf_runningtime}</b> ${upcoming.perf_runningtime}${str_minute}</li>
						<li class="w3-light-grey w3-padding-24"><c:if test="${fn:contains(upcoming.driver, '@') }">
								<!-- 개인인 경우 -->
								<a href="myBusUpcomingRead.do?num=${upcoming.num}" class="w3-btn w3-green w3-padding-large">${str_detail}</a>
							</c:if> <c:if test="${not fn:contains(upcoming.driver, '@') }">
								<!-- 크루인경우 -->
								<a href="crewBusUpcomingRead.do?num=${upcoming.num}" class="w3-btn w3-green w3-padding-large">${str_detail}</a>
							</c:if></li>
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
