<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<title>${str_mybusTitle}</title>
	<c:if test="${sessionScope.memEmail eq null}">
		<c:redirect url="main.do"/>
	</c:if>
	<c:if test="${sessionScope.memEmail ne null}">
		<body onload="editpasswdfocus()" class="w3-theme-l5">
		<script src="/HipBus/scripts/ajax.js"></script>
		<script type="text/javascript">
			function editpasswdfocus() {
				inputform.passwd.focus();
			}
		</script>
		
			<!-- Navbar -->
			<c:import url="../top.do"/>
		
		
			<!-- Page Container -->
			<div class="w3-container w3-content" style="max-width: 1400px;">
				<!-- The Grid -->
				<div class="w3-row w3-container" style="margin-top: 80px">
					<!-- 여백 -->
				</div>
		
				<div class="w3-row">
					<!-- Left Column -->
					<c:import url="../crewBusLeft.do?driver=${driver}"></c:import>
					<!-- End Left Column -->
		
					<!-- Middle Column -->
					<!-- 여기서부터 -->
					<div class="w3-col m7">
						<div
							class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
							<div class="w3-container w3-center w3-theme-l1">
								<h2>
									<i class="fa fa-pencil"></i>&nbsp; ${str_editProfile}
								</h2>
							</div>
							<div class="w3-content w3-padding-64">
								<h5>
									<b>${str_passwdHelp}</b>
								</h5>
		
							<form id="inputform" class="w3-container" action="crewBusBeforeEditPro.do?driver=${driver}" method="post">
									<p>
										<label>${str_email}</label> <input class="w3-input" type="text" value="${sessionScope.memEmail}" disabled="disabled">
									</p>
									<br> <br>
									<p>
										<label>${str_passwd}</label> <input class="w3-input" type="password" name="passwd">
									</p>
									<br>
									<div class="w3-center">
										<input type="submit" value="${str_confilm}"	class="w3-btn w3-padding w3-black w3-margin">
									</div>
								</form>
							</div>
						</div>
						<!-- 여기까지 -->
						<!-- End Middle Column -->
		
					</div>
		
					<!--  Right Column -->
					<c:import url="../crewBusRight.do?driver=${driver}"></c:import>
					<!-- End Right Column -->
		
					<!-- End Grid -->
				</div>
		
				<!-- End Page Container -->
			</div>
		
			<!-- Footer -->
			<c:import url="../bottom.do"/>
		
		</body>
	</c:if>
</html>
