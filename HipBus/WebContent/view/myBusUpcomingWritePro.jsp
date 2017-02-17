<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

<c:if test="${result==0}">
	<script type="text/javascript">
	//<!--
		alert("공연광고 작성을 실패했습니다.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=myBus.do?driver=${driver}">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="myBus.do?driver=${driver}"/>	
</c:if>	