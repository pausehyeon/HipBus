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
			<div class="w3-right" style="width: 10%">
				<select class="w3-select" name="alignment">
					<option value="" disabled selected>${str_order}</option>
					<option value="1">${str_latest}</option>
					<option value="2">${str_morePassengers}</option>
				</select>
			</div>
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
				<div class="w3-container">
					<!-- 광고 있을 때 -->
					<c:if test="${ad1_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
						</div>
					</c:if>
					<c:if test="${ad1_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad1_imglocation}" width="100%" />
						</div>
					</c:if>
					<c:if test="${ad2_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
						</div>
					</c:if>
					<c:if test="${ad2_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad2_imglocation}" width="100%" />
						</div>
					</c:if>
					<c:if test="${ad3_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
						</div>
					</c:if>
					<c:if test="${ad3_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad3_imglocation}" width="100%" />
						</div>
					</c:if>
				</div>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
