<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/stationScript.js"></script>


<h2> ${str_write} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( modifyerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">	
	<c:redirect url="station.do?pageNum=${pageNum}"/>	
</c:if>	