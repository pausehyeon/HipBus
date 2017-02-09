<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>

<!-- 로그인 결과창 -->

${rememberMe}
<!-- ^ 로그인 정보 저장 여부. 저장하는 경우 '1'이 넘어옴. script에서 처리할 것 -->

<c:if test="${result eq 1}">
	<script type="text/javascript">
		//<!--
		alert("아이디가 존재");
		//-->
	</script>
</c:if>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!--
		alert("아이디 존재 안함");
		//-->
	</script>
</c:if>