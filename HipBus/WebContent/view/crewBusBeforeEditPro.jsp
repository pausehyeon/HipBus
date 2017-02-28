<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>


<c:if test="${result == 0 }">
	<script type="text/javascript">
		//<!--		
		location.href="crewBusEdit.do?driver=" + '${driver}';
		//-->
	</script>	
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		//<!--		
		alert( "비밀번호가 일치하지 않습니다. 다시 확인 해 주세요." );
		location.href="crewBusBeforeEdit.do?driver=" + '${driver}';		
		//-->
	</script>
</c:if>