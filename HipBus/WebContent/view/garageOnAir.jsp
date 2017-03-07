<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<title>${str_Title}</title>
<body onload="boardSet()">

	<c:import url="../top.do" />

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<h3>${str_OnAir}</h3>
			<p>${str_OnAirTitle}</p>
			<hr>
			<a href="#">
				<i class="fa fa-question-circle"></i> ${str_howTo}
			</a>
		</div>
		<div class="w3-row">
			<div class="w3-twothird">
				<div class="w3-row-padding w3-padding-16 w3-center" id="onairsection">
					<!-- 
					<div class="w3-col m4 l5  w3-padding-32 w3-theme-l5 w3-margin">
						<iframe src='http://www.youtube.com/embed/live_stream?channel=UCZQ5jz44ynb4AB8dCWWqbSg' width='100%' frameborder='0' allowfullscreen></iframe>
						<p class="w3-center w3-tiny">작성자:관리자 | 작성일:2016-12-19 | 조회수: 0</p>
						<h5>정지현님의 라이브</h5>
					</div>
					-->
				</div>
				<div class="w3-row-padding w3-padding-16 w3-center" id="onairloadingsection">
				</div>
				<script type="text/javascript">
				//<!--
					$(document).ready( function(){
						getonairlist(eval("${channelsJson}"), "${googleApiKey}");
					});
				//-->
				</script>

			</div>

			<div class="w3-third">
				<!-- 상업광고 -->
				<c:import url="../commercialAds.do"></c:import>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
