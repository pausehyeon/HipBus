<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<!-- 크루 탈퇴 결과 alert -->
<c:if test="${result eq 1}">
	<!-- 크루 탈퇴 성공 -->
	<script type="text/javascript">
	//<--
		alert("${str_crewDeleteSuccess}");
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=main.do">
</c:if>
<c:if test="${result ne 1}">
	<!-- 크루 탈퇴 실패 -->
	<script type="text/javascript">
	//<--
		alert("${str_crewDeleteFail}");
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=crewBus.do?driver=${crewid}">
</c:if>