<%@page import="handler.admin.AdminADPro" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>
<!-- 광고 등록 결과창 -->
<c:if test="${result == 0}">
	alert("실패");
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="admin.do#addad"/>
</c:if>

