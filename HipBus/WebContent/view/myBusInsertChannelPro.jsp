<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
	//<!--
		alert("채널아이디등록 실패");
	//-->
	</script>
	<meta http-equiv="refresh" content="0;url=myBus.do?driver=${driver}">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="myBus.do?driver=${driver}"/>	
</c:if>	    
