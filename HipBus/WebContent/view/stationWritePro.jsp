<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/stationScript.js"></script>


<h2> ${str_write} </h2>
	<c:if test="${resultCount != 0}">
	<script type="text/javascript">
		<!--
		alert("2등급 으로 등업하셨습니다.\nHe has climbed to 2 ranks");
		//-->
	</script>
	</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">
<script type="text/javascript">
		//<!--
		location.href = "station.do";
		//-->
		</script>
	</c:if>	
	