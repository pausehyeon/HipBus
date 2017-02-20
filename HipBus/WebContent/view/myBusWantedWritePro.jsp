<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>

<title>${str_upcomingTitle}</title>
<body>

	<c:if test="${result eq 1}">
		<!-- 입력 성공 -->
		<script type="text/javascript">
		//<--
			alert(str_insertSuccess);
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=myBusWanted.do?driver=${sessionScope.memEmail}">
	</c:if>
	<c:if test="${result eq 0}">
		<!-- 입력 실패 -->
		<script type="text/javascript">
		//<--
			alert(str_insertFail);
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=myBusWanted.do?driver=${sessionScope.memEmail}">
	</c:if>

</body>
</html>