<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

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
<!-- jQuery Validation Plugin -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>
<!-- Left Column -->
<div class="w3-col m3">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white w3-margin-bottom">
		<div class="w3-container">
			<h4 class="w3-center">${str_myProfile}</h4>
			<p class="w3-center">
				<c:if test="${memDto.getImglocation()!=null}">
					<img alt="img" src="${project}/hipbusSave/${memDto.getImglocation()}" class="w3-circle" style="width: 50%" id="myBusLeftImg" onclick="location='myBus.do?driver=${driver}'">
				</c:if>
				<c:if test="${memDto.getImglocation()==null}">
					<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle" style="width: 50%" alt="Avatar" id="myBusLeftImg" onclick="location='myBus.do?driver=${driver}'">
				</c:if>
			</p>
			<hr>
			<p>
				<i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i> ${memDto.getNick()}
			</p>
			<p>
				<i class="fa fa-at fa-fw w3-margin-right w3-text-theme"></i> ${memDto.getEmail()}
			</p>
			<c:if test="${memDto.getMem_level() == 2}">
				<p>
					<i class="fa fa-bookmark fa-fw w3-margin-right w3-text-theme"></i> Best Driver
				</p>
			</c:if>

			<c:if test="${myCrews[0] != null}">
				<c:forEach var="crew" items="${myCrews}">

					<p onclick="myFunction('${crew.crewid}')" class="w3-padding-4">
						<i class="fa fa-fort-awesome fa-fw w3-margin-right w3-text-theme"></i> ${crew.crewname}
					</p>
					<div id="${crew.crewid}" class="w3-accordion-content">
						<p>
							<a href="crewBus.do?driver=${crew.crewid}">${crew.crewname} <i class="fa fa-mail-forward fa-fw w3-margin-right w3-text-theme"></i>
							</a>
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
				<c:if test="${mem_level==2}">
					<a onclick="document.getElementById('createCrewBus').style.display='block'"> <i class="fa fa-plus w3-margin-right"></i>새 크루 추가하기
					</a>
				</c:if>
				<hr>
				<a href="myBusBeforeEdit.do?driver=${driver}"> <i class="fa fa-pencil"></i>${str_editProfile}
				</a>
			</c:if>
			<hr>
			<c:if test="${email!=null and email != driver and mem_level!=3}">
				<button name="hop" class="w3-btn-block w3-margin-bottom" onclick="goHop()">
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
			</c:if>
		</div>
	</div>

	<!-- Accordion -->
	<div class="w3-card-2 w3-round w3-margin-bottom">
		<div class="w3-accordion w3-white">
			<button onclick="myFunction('Demo1')" class="w3-btn-block w3-theme-d5 w3-left-align">
				<i class="fa fa fa-heart fa-fw w3-margin-right"></i> ${str_hopperList}
			</button>
			<div id="Demo1" class="w3-accordion-content w3-container w3-padding-2">
				<p>
				<ul class="w3-ul">
					<c:if test="${passengers.isEmpty()}">
						<li>아직 탑승자가 없습니다.</li>
					</c:if>
					<c:if test="${!passengers.isEmpty()}">
						<c:forEach var="passenger" items="${passengers}" varStatus="status">
							<li class="w3-padding-10"><c:if test="${passenger.getImglocation()!=null}">
									<img alt="img" src="${project}/hipbusSave/${passenger.getImglocation()}" class="w3-left w3-circle w3-margin-right" style="width: 11%">
								</c:if> <c:if test="${passenger.getImglocation()==null}">
									<img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-left w3-circle w3-margin-right" style="width: 11%" alt="Avatar">
								</c:if> <a href="myBus.do?driver=${passenger.getEmail()}" class="w3-middle">${passenger.getNick()}</a></li>
						</c:forEach>
					</c:if>
				</ul>
				</p>
			</div>
			<c:if test="${channelid!=null}">
				<button onclick="location='myBusVideos.do?driver=${driver}'" class="w3-btn-block w3-theme-d5 w3-left-align">
					<i class="fa fa-video-camera fa-fw w3-margin-right"></i> ${str_oldVideos}
				</button>
			</c:if>
			<button onclick="location='myBusMyArticles.do?driver=${driver}'" class="w3-btn-block w3-theme-d5 w3-left-align">
				<i class="fa fa fa-align-left fa-fw w3-margin-right"></i> ${memDto.getNick()} ${str_seePosts}
			</button>
			<button onclick="location='myBusUpcoming.do?driver=${driver}'" class="w3-btn-block w3-theme-d5 w3-left-align">
				<i class="fa fa-calendar fa-fw w3-margin-right"></i> ${str_upcoming}
			</button>
			<button onclick="location='myBusWanted.do?driver=${driver}'" class="w3-btn-block w3-theme-d5 w3-left-align">
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
						<c:if test="${cnt==4}">
							<span class="w3-tag w3-small w3-theme-l${cnt=1}">${tag}</span>
						</c:if>
					</c:forEach>
				</p>
			</div>
		</div>
	</c:if>
	<br>
<!-- Alert Box -->
<c:if test="${sessionScope.memEmail ne null}">
	<div class="w3-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small" id="crewInfo">
		<span onclick="closeInfo()" class="w3-hover-text-grey w3-closebtn"> 
			<i class="fa fa-remove"></i>
		</span>
		<p>
			<strong>${str_infoTitle}</strong>
		</p>
		<c:if test="${myCrews==null || mem_level==1}"><!-- 크루가 없으면서 레벨이 1이면 등업-->
			<p>
			${str_infoMsg3}
			<a href="garageFAQ.do" class="w3-medium w3-text-red" style="text-decoration: underline;">FAQ</a>
			${str_infoMsg}
			</p>
		</c:if>
		<c:if test="${myCrews==null || mem_level==2}"><!-- 크루가 없으면서  레벨이 2이면 생성 가입 -->
			<p>
			${str_infoMsg4}
			<a href="garageFAQ.do" class="w3-medium w3-text-red" style="text-decoration: underline;">FAQ</a>
			${str_infoMsg}
			</p>
		</c:if>
	</div>
</c:if>
</div>

<!-- End Left Column -->
<!-- 크루버스 만들기 모달 -->
<div id="createCrewBus" class="w3-modal">
	<div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width: 600px">
		<div class="w3-center">
			<br> <span onclick="document.getElementById('createCrewBus').style.display='none'" class="w3-closebtn w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
		</div>
		<form name="createcrewform" method="post" action="myBusCreatCrewPro.do?driver=${driver}" class="w3-container">
			<div class="w3-section">
				<div class="w3-row-padding">
					<div class="w3-col m12 w3-margin-bottom">
						<label><b>크루 이름</b></label>
					</div>
					<div class="w3-col s10 m9">
						<input name="crewname" type="text" placeholder="새 크루의 이름을 입력하세요." required class="w3-input w3-border">
						<p id="nameresult" class="w3-text-red w3-small w3-right"></p>
					</div>
					<div class="w3-col s10 m3">
						<input type="submit" value="크루 생성" class="w3-btn-block w3-theme-d5 w3-padding">
					</div>
					<div class="w3-col m12 w3-right"></div>
				</div>
			</div>
		</form>
		<script type="text/javascript">
		//<!--
			$(document).ready(function(){
				createcrewformvalidate();
			});
		//-->
		</script>

		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<span class="w3-right w3-padding w3-hide-small w3-tiny">기존 크루에 가입하려면? <a href="garageFAQ.do">자주 묻는 질문으로 가기</a></span>
			<button onclick="document.getElementById('createCrewBus').style.display='none'" type="button" class="w3-btn w3-theme-d5">${str_signInCancel}</button>
		</div>
	</div>
</div>


</html>