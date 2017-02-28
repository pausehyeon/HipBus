<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>

<c:if test="${leaderChange ne 0}">
	<script type="text/javascript">
		alert("크루장 위임에 성공하셨습니다.");
	</script>
	<meta http-equiv="refresh" content="0;url=crewBusEdit.do?driver=${driver}">
</c:if>
<c:if test="${leaderChange eq 0}">
	<script type="text/javascript">
		alert("크루장 위임에 실패하셨습니다./n잠시후 다시 시도해주세요.");
	</script>
	<meta http-equiv="refresh" content="0;url=crewBusEdit.do?driver=${driver}">
</c:if>