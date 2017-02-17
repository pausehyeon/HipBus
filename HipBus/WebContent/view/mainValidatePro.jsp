<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript" src="/HipBus/scripts/mainScript.js"></script>
<!-- SETTING 끝 -->
<!-- 사용자가 인증 메일을 통해 여기로 들어오게 됨. 핸들러에서 email과 code 대조 후 인증 성공하면 main으로 redirect -->

<c:if test="${result == 0 }">
	<script type="text/javascript">
		//<!--		
		alert( verificationerror );
		location.href="mainSignUp.do";
		//-->
	</script>
</c:if>
<c:if test="${result != 0 }">
	<script type="text/javascript">
		//<!--
		alert( verificationok );		
		location.href="mainSignIn.do";
		//-->
	</script>	
	<%-- <c:redirect url="main.do"/> 리다이렉트를 쓰면 얼럿이 안먹음!--%>
</c:if>


<%-- <c:if test="${code eq 111}"></c:if> --%>
