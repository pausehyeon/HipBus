<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원정보 수정 위해 비밀번호 확인 결과 -->

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>



<c:if test="${result == 0 }">
	<script type="text/javascript">
		//<!--		
		alert( "회원수정에 실패했습니다. \n잠시 후 다시 시도하세요." );
		location.href="myBusBeforeEdit.do.do?driver=" + '${sessionScope.memEmail}';		
		//-->
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		//<!--
		alert( "수정 페이지로 이동합니다." );		
		location.href="myBusEdit.do?driver=" + '${sessionScope.memEmail}';
		//-->
	</script>	
</c:if>
<c:if test="${signOutResult == -1 }">
	<script type="text/javascript">
		//<!--		
		alert( "비밀번호가 일치하지 않습니다. 다시 확인 해 주세요." );
		location.href="myBusBeforeEdit.do.do?driver=" + '${sessionScope.memEmail}';		
		//-->
	</script>
</c:if>
<%-- <c:redirect url="main.do"/> 리다이렉트를 쓰면 얼럿이 안먹음!--%>


<%-- <c:if test="${code eq 111}"></c:if> --%>