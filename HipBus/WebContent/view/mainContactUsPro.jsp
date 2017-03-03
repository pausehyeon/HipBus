<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<!-- SETTING 끝 -->
<title>${str_welcome}</title>
<script type="text/javascript">
//<!--
	alert("${str_mailingSuccess}");
	location.href = "main.do";
//-->
</script>
</html>