<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 크루생성 -->

<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/busScript.js"></script>
<!-- SETTING 끝 -->

<c:if test="${result == 0}">
	<script type="text/javascript">
		//<!--		
		alert( "크루생성에 실패했습니다. \n잠시 후 다시 시도하세요." );
		location.href="myBus.do?driver=" + '${driver}';		
		//-->
	</script>
</c:if>
<c:if test="${result == 1}">
	<script type="text/javascript">
		//<!--
		alert("크루생성에 성공하였습니다.");		
		location.href="myBus.do?driver=" + '${driver}';
		//-->
	</script>	
</c:if>