<%@page import="handler.admin.AdminSignOutPro" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>
<!-- 관리자 탈퇴 결과창 -->

<c:if test="${result ne 0}">
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${result eq 0}">
	<script type="text/javascript">
	//<!--
	alert("관리자 탈퇴에 실패하셨습니다. 잠시후 다시 시도해주세요.");
	location.href = "admin.do#withdrawal";
	//-->
	</script>
</c:if>
