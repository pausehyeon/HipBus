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
			<c:if test="${memDto.getImglocation()!=null}">
				<img alt="img" src="${project}/hipbusSave/${memDto.getImglocation()}"
					class="w3-circle" style="width:50%" onclick="location='myBus.do?driver=${driver}'">
			</c:if>
			<c:if test="${memDto.getImglocation()==null}">
				<img src="${project}/view/img/HipBusLogo_colored_sq.png"
					class="w3-circle" style="width:50%" alt="Avatar"  onclick="location='myBus.do?driver=${driver}'">
			</c:if>
			</p>
			<hr>
			<p>
				<i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i>
				${memDto.getNick()}
			</p>
			<p>
				<i class="fa fa-at fa-fw w3-margin-right w3-text-theme"></i>
				${memDto.getEmail()}
			</p>
		<c:if test="${memDto.getMem_level() == 2}">
			<p>
				<i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i>
				Best Driver
			</p>
		</c:if>
		<c:if test="${email!=null and email != driver and mem_level!=3}">
			<button name="hop" onclick="location='myBusHopOnPro.do?driver=${driver}&email=${email}&hopORnot=${hopORnot}'">
				${str_hop} &nbsp; ${hopORnot}
			</button>
		</c:if>
	<c:if test="${myCrews[0] != null}">
		<c:forEach var="crew" items="${myCrews}">
			
			<p onclick="myFunction('${crew.crewid}')">
				<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i>
				${str_crew} ${crew.crewname}
			</p>
			<div id="${crew.crewid}" class="w3-accordion-content w3-container">
				<p>
					<a href="crewBus.do?driver=${crew.crewid}">${crew.crewname}
					<i class="fa fa-mail-forward fa-fw w3-margin-right w3-text-theme"></i></a>
			
				<ul>
					<c:if test="${myMembers[crew.crewid]!=null and myMembers[crew.crewid].size()!=0}">
					<c:forEach begin="0" end="${myMembers[crew.crewid].size()-1}" varStatus="status">
   						<li><a href="myBus.do?driver=${myMembers[crew.crewid].get(status.count-1).getEmail()}">${myMembers[crew.crewid].get(status.count-1).getNick()}</a>
 					</c:forEach>
					</c:if>
				</ul>
			
				</p>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${driver==email}">
			<hr>
			<a href="myBusBeforeEdit.do?driver=${driver}"><i class="fa fa-pencil"></i>${str_editProfile}</a>
	</c:if>
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
			<div id="Demo1" class="w3-accordion-content w3-container w3-padding-2">
				<p>
				<ul class="w3-ul">
			<c:if test="${passengers==null}">
				<li>아직 탑승자가 없습니다.</li>
			</c:if>
			<c:if test="${passengers!=null}">
				<c:forEach var="passenger" items="${passengers}" varStatus="status">
					<li class="w3-padding-10">
						<c:if test="${passenger.getImglocation()!=null}">
							<img alt="img" src="${project}/hipbusSave/${passenger.getImglocation()}"
								class="w3-left w3-circle w3-margin-right" style="width:11%">
						</c:if>
						<c:if test="${passenger.getImglocation()==null}">
							<img src="${project}/view/img/HipBusLogo_colored_sq.png"
								class="w3-left w3-circle w3-margin-right" style="width:11%" alt="Avatar">
						</c:if>
						<a href="myBus.do?driver=${passenger.getEmail()}" class="w3-middle">${passenger.getNick()}</a>
					</li>
				</c:forEach>
			</c:if>
				</ul>
				</p>
			</div>
			<c:if test="${channelid!=null}">
			<button onclick="location='myBusVideos.do?driver=${driver}'"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-video-camera fa-fw w3-margin-right"></i> ${str_oldVideos}
			</button>
			</c:if>
			<button onclick="location='myBusMyArticles.do?driver=${driver}'" class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa fa-align-left fa-fw w3-margin-right"></i> ${memDto.getNick()} ${str_seePosts}
			</button>
			<button onclick="location='myBusUpcoming.do?driver=${driver}'"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-calendar fa-fw w3-margin-right"></i> ${str_upcoming}
			</button>
			<button onclick="location='myBusWanted.do?driver=${driver}'"
				class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-bullhorn fa-fw w3-margin-right"></i> ${str_wanted}
			</button>
<%-- 			<div id="Demo2" class="w3-accordion-content w3-container">
				<p>
				<ul>
					<li><a href="myBusMyArticles.do?driver=${driver}"> ${str_whole}</a>
				</ul>
				</p>
			</div> --%>
		</div>
	</div>

	<!-- Interests -->
	<div class="w3-card-2 w3-round w3-white w3-hide-small">
		<div class="w3-container">
			<p>${str_tags}</p>
			<p>
		<c:forEach var="tag" items="${tags}">
				<span class="w3-tag w3-small w3-theme-d3">${tag}</span>
		</c:forEach>
			</p>
			<!-- <p>
				<span class="w3-tag w3-small w3-theme-d5">랩</span> 
				<span class="w3-tag w3-small w3-theme-d4">믹스테잎</span> 
				<span class="w3-tag w3-small w3-theme-d3">가사</span> 
				<span class="w3-tag w3-small w3-theme-d2">Games</span> 
				<span class="w3-tag w3-small w3-theme-d1">Friends</span> 
				<span class="w3-tag w3-small w3-theme">쇼미더머니</span> 
				<span class="w3-tag w3-small w3-theme-l1">언프리티랩스타</span> 
				<span class="w3-tag w3-small w3-theme-l2">Food</span> 
				<span class="w3-tag w3-small w3-theme-l3">빈지노</span> 
				<span class="w3-tag w3-small w3-theme-l4">Art</span> 
				<span class="w3-tag w3-small w3-theme-l5">Photos</span>
			</p> -->
		</div>
	</div>
	<br>
</div>
<!-- End Left Column -->
</html>
