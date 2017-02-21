<%@page import="handler.admin.AdminEditPro" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>


<c:if test="${result != 0}">
	<c:redirect url="admin.do#modify"/>
</c:if>
<!-- 	<script type="text/javascript">
		alert("성공");
	</script> -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("관리자 정보수정 실패");
	</script>
	<meta http-equiv="refresh" content="5; url=admin.do">
</c:if>