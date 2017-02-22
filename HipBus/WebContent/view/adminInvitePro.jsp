<%@page import="handler.admin.AdminInvitePro" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/admin_setting.jsp"%>
<!-- 관리자인증 코드전송후 관리자의 이동 -->
<c:if test="${sendEmail ne 0 && resultGrade eq 0}">
	<c:redirect url="admin.do#sendInvitation"/>
</c:if>
<!-- 	<script type="text/javascript">
		alert("성공");
	</script> -->
<c:if test="${sendEmail eq 0 }">
	<script type="text/javascript">
		alert("관리자인증메일 전송실패입니다. 이메일 확인 후 재전송해주세요.");
	</script>
	<meta http-equiv="refresh" content="2; url=admin.do">
</c:if>

<%-- <!-- 코드전송후 등업후보자의 이동 -->
<c:if test="${result ne 0 || result ne null}">
	<c:redirect url="main.do"/>
</c:if>
<!-- 	<script type="text/javascript">
		alert("성공");
	</script> -->
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert("인증 실패입니다. 관리자에게 문의해주세요.");
	</script>
	<meta http-equiv="refresh" content="2; url=main.do">
</c:if> --%>

<!-- 관리자인증 성공후 -->
<c:if test="${resultGrade ne 0}">
	<c:redirect url="main.do"/>
</c:if>
<!-- 	<script type="text/javascript">
		alert("성공");
	</script> -->
<c:if test="${resultGrade == 0}">
	<script type="text/javascript">
		alert("관리자인증 실패입니다. 재요청해주세요.");
	</script>
	<meta http-equiv="refresh" content="2; url=main.do">
</c:if>
