<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>
<script type="text/javascript">
$(document).ready(
	function(){
		if(localStorage.getItem("isClosed")=="true"){
			$('#crewInfo').hide();
		}
	}
);
function closeInfo() {
	localStorage.setItem("isClosed","true");
	$('#crewInfo').hide();
}
</script>
<!-- Left Column -->
<div class="w3-col m3">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white">
		<div class="w3-container">
			<h4 class="w3-center">${str_crewProfile}</h4>
			<p class="w3-center">
				<c:if test="${crewDto.getImglocation()!=null}">
					<img alt="img" src="${project}/hipbusSave/${crewDto.getImglocation()}" class="w3-circle" style="width: 50%" id="crewBusLeftImg" onclick="location='crewBus.do?driver=${driver}'">
				</c:if>
				<c:if test="${crewDto.getImglocation()==null}">
					<img src="${project}/view/img/CrewBusLogo_colored_sq.png" class="w3-circle" style="width: 50%" alt="Avatar" id="crewBusLeftImg" onclick="location='crewBus.do?driver=${driver}'">
				</c:if>
			</p>
			<hr>			
			<p>
				<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i>${crewDto.getCrewname()}
			</p>
			<p onclick="myFunction('crew')" class="w3-padding-4">
				<i class="fa fa-users fa-fw w3-margin-right w3-text-theme"></i> ${str_memberCount} ${memberList.size()} ${str_per}
			</p>
			<div id="crew" class="w3-accordion-content">
				<p>
					<ul>
						<c:if test="${memberList.size() != 0}">
							<c:forEach begin="0" end="${memberList.size()-1}" varStatus="status">
								<li><a href="myBus.do?driver=${memberList.get(status.count-1).getEmail()}">${memberList.get(status.count-1).getNick()}</a>
							</c:forEach>
						</c:if>
					</ul>
				</p>
			</div>
			<c:if test="${isMember==true}">
				<hr>
				<a href="crewBusBeforeEdit.do?driver=${driver}">
					<i class="fa fa-pencil"></i>${str_editProfile}
				</a>
			</c:if>
			<hr>
			<c:if test="${email != null and isMember==false and mem_level!=3}">
				<button name="hop" class="w3-btn-block w3-theme-l1" onclick="goHop()">
					<c:if test="${hopORnot.trim()=='on'}">
						<i class="fa fa fa-heart w3-margin-right"></i>
					</c:if>
					<c:if test="${hopORnot.trim()=='off'}">
						<i class="fa fa fa-heart-o w3-margin-right"></i>
					</c:if>
					${str_hop}&nbsp;${hopORnot}
				</button>
				<script type="text/javascript">
				//<!--
				function goHop(){
					location.href='myBusHopOnPro.do?driver='+'${driver}'+'&email='+'${email}'+'&hopORnot='+'${hopORnot}'+'&urlToGoBack='+location.href;
				}
				//-->
				</script>
				<c:if test="${isApplied==0 && mem_level==2}">
					<button name="apply" class="w3-btn-block w3-theme-l1 w3-margin-top" onclick="location='crewBusApplyPro.do?driver=${driver}'">
						크루원신청
					</button>
				</c:if>
			</c:if>
			&nbsp;
		</div>
	</div>
	<br>

	<!-- Accordion -->
	<div class="w3-card-2 w3-round w3-margin-bottom">
		<div class="w3-accordion w3-white">
			<button onclick="myFunction('Demo1')" class="w3-btn-block w3-theme-l1 w3-left-align">
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
									<img alt="img" src="${project}/hipbusSave/${passenger.getImglocation()}" class="w3-left w3-circle w3-margin-right" style="width: 11%">
							</c:if>
							<c:if test="${passenger.getImglocation()==null}">
									<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-left w3-circle w3-margin-right" style="width: 11%" alt="Avatar">
							</c:if> <a href="myBus.do?driver=${passenger.getEmail()}" class="w3-middle">${passenger.getNick()}</a></li>
						</c:forEach>
					</c:if>
				</ul>
				</p>
			</div>

			<c:if test="${channelid!=null}">
				<button onclick="location='crewBusVideos.do?driver=${driver}'" class="w3-btn-block w3-theme-l1 w3-left-align">
					<i class="fa fa-video-camera fa-fw w3-margin-right"></i> ${str_oldVideos}
				</button>
			</c:if>
			
			<button onclick="location='crewBusOurArticles.do?driver=${driver}'" class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa fa-align-left fa-fw w3-margin-right"></i> ${crewDto.getCrewname()}${str_seePosts}
			</button>
			<button onclick="location='crewBusUpcoming.do?driver=${driver}'" class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-calendar fa-fw w3-margin-right"></i> ${str_upcoming}
			</button>
			<button onclick="location='crewBusWanted.do?driver=${driver}'" class="w3-btn-block w3-theme-l1 w3-left-align">
				<i class="fa fa-bullhorn fa-fw w3-margin-right"></i> ${str_wanted}
			</button>
		</div>
	</div>
	<br>

	<!-- Interests -->
	<c:if test="${tags[0] != null}">
		<div class="w3-card-2 w3-round w3-white w3-hide-small">
			<div class="w3-container">
				<p>${str_tags}</p>
				<p>
					<c:set var="cnt" value="${0}"/>
					<c:forEach var="tag" items="${tags}">
						<c:if test="${cnt<5}">
							<span class="w3-tag w3-small w3-theme-l${cnt=cnt+1}">${tag}</span>
						</c:if>	
						<c:if test="${cnt==5}">
							<span class="w3-tag w3-small w3-theme-l${cnt=1}">${tag}</span>
						</c:if>
					</c:forEach>
				</p>
			</div>
		</div>
	</c:if>
	<br>
	
		<!-- Alert Box -->
	<c:if test="${sesstionScope.memEmail ne null}">
		<div class="w3-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small" id="crewInfo">
			<span onclick="closeInfo()" class="w3-hover-text-grey w3-closebtn"> 
				<i class="fa fa-remove"></i>
			</span>
			<p>
				<strong>${str_infoTitle}</strong>
			</p>
				<c:if test="${isApplied==0 && mem_level==1}"><!-- 크루원이 아니면서 레벨이 1이면 등업-->
					<p>
					${str_infoMsg1}
					<a href="garageFAQ.do" class="w3-medium w3-text-red" style="text-decoration: underline;">FAQ</a>
					${str_infoMsg}
					</p>
				</c:if>
				<c:if test="${isApplied==0 && mem_level==2}"><!-- 크루원이 아니면서 레벨이 2이면 가입  -->
					<p>
					${str_infoMsg2}
					<a href="garageFAQ.do" class="w3-medium w3-text-red" style="text-decoration: underline;">FAQ</a>
					${str_infoMsg}
					</p>
				</c:if>
		</div>
	</c:if>
	<!-- End Left Column -->
</div>
