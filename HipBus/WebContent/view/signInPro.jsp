<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>

<!-- 로그인 결과창 -->

${rememberMe}
<!-- ^ 로그인 정보 저장 여부. 저장하는 경우 '1'이 넘어옴. TODO script에서 처리할 것 -->
<c:if test="${result eq 2}">
	<script type="text/javascript">
		//<!--
		alert("${str_needVerification}");
		history.back();
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="${urlToGoBack}"/>
	<!-- ^ 이전에 저장해뒀던 url로 돌아감 -->
</c:if>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!--
		alert("${str_wrongIdOrPasswd}");
		history.back();
		//-->
	</script>
</c:if>