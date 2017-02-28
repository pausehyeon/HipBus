<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<!-- D-day 연산을 위해 시스템 날짜를 받아옴 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber var="today" value="${now.time/ (1000*60*60*24)}" integerOnly="true" />

<!-- Right Column -->
<div class="w3-col m2">
	<div class="w3-card-2 w3-round w3-white w3-center">
		<div class="w3-container">
			<div class="w3-right w3-padding-16">
				<button class="w3-btn w3-theme-d5" onclick="location='crewBusUpcoming.do?driver=${driver}'">
					<i class="fa fa-align-left"></i>&nbsp; ${str_mylist}
				</button>
			</div>
			<c:if test="${upcomingDto.imglocation==null}">
				<img src="${project}/view/img/notice1.png" alt="some image" style="width: 100%;">
				<div class="w3-padding-12">
					<p>
						<strong>예정된 공연이 없습니다.</strong>
					</p>
				</div>
			</c:if>
			<c:if test="${upcomingDto.imglocation!=null}">
				<img src="${project}/hipbusSave/${upcomingDto.imglocation}" alt="some image" style="width: 100%;">
				<fmt:parseNumber var="perf_date" value="${upcomingDto.perf_date.time/ (1000*60*60*24)}" integerOnly="true" />
				<!-- D-n 초록색, D-3 ~ D-1 빨간 색, D-day으로 나누어표시 -->
				<h5 class="w3-padding">
					<c:if test="${(today - perf_date) lt (-3)}">
						<span class="w3-badge w3-green">D${today - perf_date}</span>
					</c:if>
					<c:if test="${( (today - perf_date) ge (-3) ) and ((today - perf_date) lt 0)}">
						<span class="w3-badge w3-red">D${today - perf_date}</span>
					</c:if>
					<c:if test="${(today - perf_date) eq 0}">
						<span class="w3-badge w3-red">D-Day</span>
					</c:if>
					<c:if test="${fn:length(upcomingDto.subject) le 7}">
						${upcomingDto.subject}
					</c:if>
					<c:if test="${fn:length(upcomingDto.subject) gt 7}">
						${fn:substring(upcomingDto.subject, 0, 7)}...
					</c:if>
				</h5>
				<p class="w3-small">
					<fmt:formatDate value="${upcomingDto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
					| ${upcomingDto.readcount}
				</p>
				<p>
					<button class="w3-btn w3-btn-block w3-theme-d5" onclick="location='crewBusUpcomingRead.do?driver=${driver}&num=${upcomingDto.num}'">${str_detail}</button>
				</p>
			</c:if>
		</div>
	</div>
	<br>

	<div class="w3-card-2 w3-round w3-white w3-center">
		<div class="w3-container">
			<div class="w3-right w3-padding-16">
				<button type="button" class="w3-btn w3-theme-d5" onclick="location='crewBusWanted.do?driver=${driver}'">
					<i class="fa fa-align-left"></i>&nbsp; ${str_mylist}
				</button>
			</div>
			<c:if test="${wantedDto==null}">
				<img src="${project}/view/img/topdriver1.png" alt="some image" style="width: 100%;">
				<div class="w3-padding-12">
					<p>
						<strong>구인글이 없습니다.</strong>
					</p>
				</div>
			</c:if>
			<c:if test="${wantedDto!=null}">
				<!-- 대표 이미지가 있는 경우 -->
				<c:if test="${(wantedDto.imglocation ne null) and (wantedDto.imglocation ne '') }">
					<img src="${project}/hipbusSave/${wantedDto.imglocation}" alt="poster" style="width: 100%">
				</c:if>
				<!-- 대표 이미지가 없는 경우 -->
				<c:if test="${(wantedDto.imglocation eq null) or (wantedDto.imglocation eq '') }">
					<img src="${project}/view/img/HipBusLogo_pale_sq.png" alt="poster" style="width: 100%" class="w3-opacity">
				</c:if>

				<fmt:parseNumber var="duedate" value="${wantedDto.duedate.time/ (1000*60*60*24)}" integerOnly="true" />
				<!-- D-n 초록색, D-3 ~ D-1 빨간 색, D-day로 나누어표시 -->
				<h5 class="w3-padding">
					<c:if test="${(today - duedate) lt (-3)}">
						<span class="w3-badge w3-green">D${today - duedate}</span>
					</c:if>
					<c:if test="${( (today - duedate) ge (-3) ) and ((today - duedate) lt 0)}">
						<span class="w3-badge w3-red">D${today - duedate}</span>
					</c:if>
					<c:if test="${(today - duedate) eq 0}">
						<span class="w3-badge w3-red">D-Day</span>
					</c:if>
					<c:if test="${fn:length(wantedDto.subject) le 7}">
						${wantedDto.subject}
					</c:if>
					<c:if test="${fn:length(wantedDto.subject) gt 7}">
						${fn:substring(wantedDto.subject, 0, 7)}...
					</c:if>
				</h5>

				<p class="w3-small">
					<fmt:formatDate value="${wantedDto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
					| ${wantedDto.readcount}
				</p>
				<button class="w3-btn w3-btn-block w3-theme-d5 w3-margin-bottom" onclick="location='crewBusWantedRead.do?driver=${driver}&num=${wantedDto.num}'">${str_detail}</button>
			</c:if>
		</div>
	</div>
	
	<br>
<c:if test="${Applymembers!=null and leader==2}">
	<c:forEach var="ApplyMem" items="${Applymembers}" >
		<div class="w3-card-2 w3-round w3-white w3-center">
			<div class="w3-container">
				<p>${str_crewApply}</p>
				<c:if test="${ApplyMem.getImglocation()!=null}">
					<img alt="img" src="${project}/hipbusSave/${ApplyMem.getImglocation()}" class="w3-circle" style="width: 50%" id="crewBusLeftImg" onclick="location='myBus.do?driver=${ApplyMem.getEmail()}'">
				</c:if>
				<c:if test="${ApplyMem.getImglocation()==null}">
					<img src="${project}/view/img/HipBusLogo_bw.png" class="w3-circle" style="width: 50%" alt="Avatar" id="crewBusLeftImg" onclick="location='myBus.do?driver=${ApplyMem.getEmail()}'">
				</c:if>
				<br>
				<span>${ApplyMem.getNick()}</span>
				<div class="w3-row w3-opacity">
					<div class="w3-half">
						<button class="w3-btn w3-green w3-btn-block w3-section" title="Accept" onclick="location='crewBusAcceptPro.do?driver=${driver}&email=${ApplyMem.getEmail()}'">
							<i class="fa fa-check"></i>
						</button>
					</div>
					<div class="w3-half">
						<button class="w3-btn w3-red w3-btn-block w3-section" title="Decline" onclick="location='crewBusEjectPro.do?driver=${driver}&email=${ApplyMem.getEmail()}&hidden=0'">
							<i class="fa fa-remove"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<br>
	</c:forEach>
</c:if>
	<!-- End Right Column -->
</div>
