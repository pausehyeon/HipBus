<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<c:if test="${result==1}">
	<script type="text/javascript">
	//<!--
		alert("성공적으로 거절되었습니다.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBus.do?driver=${driver}">
</c:if>
<c:if test="${result==0}">
	<script type="text/javascript">
	//<!--
		alert("거절에 실패했습니다. \n 잠시 후 다시 시도해주세요.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBus.do?driver=${driver}">
</c:if>	