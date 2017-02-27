<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>

<c:if test="${result==0}">
	<script type="text/javascript">
		//<!--
		alert("신청에 실패하였습니다. \n 잠시후 다시 시도해주세요");
		location.href="crewBus.do?driver="+"${driver}";
		//-->
	</script>
</c:if>
<c:if test="${result==1}">
	<script type="text/javascript">
		//<!--
		alert("신청에 성공하였습니다. \n 수락을 기다려주세요");
		location.href="crewBus.do?driver="+"${driver}";
		//-->
	</script>
</c:if>