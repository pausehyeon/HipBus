<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<!-- SETTING 끝 -->

<c:if test="${ ( result eq 0 ) or (profileResult eq 0) or (channelResult eq 0)}">
	<script type="text/javascript">
		//<!--		
		alert( "${str_myBusEditFail}" );
		location.href="myBusEdit.do?driver=" + '${driver}';		
		//-->
	</script>
</c:if>
<c:if test="${ ( result eq -1 or result eq 1 ) and profileResult eq 1 and (channelResult eq -1 or channelResult eq 1)}">
	<script type="text/javascript">
		//<!--
		alert("${str_myBusEditSuccess}");	
		location.href="myBus.do?driver=" + '${driver}';
		//-->
	</script>	
</c:if>