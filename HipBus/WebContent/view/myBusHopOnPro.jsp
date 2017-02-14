<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>

<h2> ${page_input} </h2>

<c:if test="${(result ne 1) and (hopORnot eq 'on')}">
	<script type="text/javascript">
		<!--
		alert("${str_hopOnError}");
		//-->
	</script>
	<meta http-equiv="refresh" content="0;url=myBus.do?driver=${driver}">
</c:if>
<c:if test="${(result ne 1) and (hopORnot eq 'off')}">
	<script type="text/javascript">
		<!--
		alert("${str_hopOffError}");
		//-->
	</script>
	<meta http-equiv="refresh" content="0;url=myBus.do?driver=${driver}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="myBus.do?driver=${driver}"/>
</c:if>