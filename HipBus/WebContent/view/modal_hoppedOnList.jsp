<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/navbar_top_setting.jsp"%>
<!-- 홉온한 친구 목록 모달창 -->
<div class="w3-container">
   <!-- driver Hop On 더보기 창 -->
  <div id="myBusSearch" class="w3-modal">
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('myBusSearch').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
      </div>
		<div class="w3-container w3-padding-jumbo">

				<c:if test="${hoppedOnMembers ne null}">
					<h4 class="w3-margin w3-padding" style="font-weight: bold; text-align: center;">hop on</h4>
					<c:forEach var="hoppedOnMember" items="${hoppedOnMembers}">
						<a href="myBus.do?driver=${hoppedOnMember.email}"><i class="fa fa-bus w3-margin-right"></i>${hoppedOnMember.nick}</a>
						<br>
						<br>
					</c:forEach>
				</c:if>
			</div>
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      </div>

    </div>
  </div>
  
  
  <!-- Crew Hop On 더보기 창 -->
   <div id="crewBusSearch" class="w3-modal">
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('crewBusSearch').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
      </div>
		<div class="w3-container w3-padding-jumbo">

				<c:if test="${hoppedOnCrews ne null}">
					<h4 class="w3-margin w3-padding" style="font-weight: bold; text-align: center;">hop on</h4>
					<c:forEach var="hoppedOnCrews" items="${hoppedOnCrews}">
						<a href="myBus.do?driver=${hoppedOnCrews.crewid}"><i class="fa fa-bus w3-margin-right"></i>${hoppedOnCrews.crewname}</a>
						<br>
						<br>
					</c:forEach>
				</c:if>
			</div>
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">      	
      </div>

    </div>
  </div>
 
</div>
<!-- 친구리스트 모달 창 끝 -->