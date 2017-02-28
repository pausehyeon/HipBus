<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<c:if test="${result==1 && creweject eq 0}">
	<script type="text/javascript">
	//<!--
		alert("성공적으로 거절되었습니다.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBus.do?driver=${driver}">
</c:if>
<c:if test="${result==0 && creweject eq 0}">
	<script type="text/javascript">
	//<!--
		alert("거절에 실패했습니다. \n 잠시 후 다시 시도해주세요.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBus.do?driver=${driver}">
</c:if>	

<c:if test="${creweject eq 1 && result eq 0}">
	<script type="text/javascript">
	alert("선택하신 크루원 강제탈퇴에 성공하였습니다.");
	</script>
	<meta http-equiv="refresh" content="0;url=crewBusEdit.do?driver=${driver}">
</c:if>
<c:if test="${creweject eq 0 && result eq 0}">
	<script type="text/javascript">
	//<!--
		alert("선택한 크루원 강제탈퇴가 실패했습니다. \n 잠시 후 다시 시도해주세요.");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=crewBusEdit.do?driver=${driver}">
</c:if>
