<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공연일정게시판 수정 오류 시 경고창 띄우는 곳 -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
	//<!--
		alert("공연광고 수정을 실패했습니다.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBusUpcomingRead.do?driver=${driver}&num=${num}">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="crewBusUpcomingRead.do?driver=${driver}&num=${num}"/>	
</c:if>	