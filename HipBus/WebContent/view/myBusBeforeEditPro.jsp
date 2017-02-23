<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원정보 수정 위해 비밀번호 확인 결과 -->

<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>


<c:if test="${result == 0 }">
	<script type="text/javascript">
		//<!--		
		location.href="myBusEdit.do?driver=" + '${driver}';
		//-->
	</script>	
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		//<!--		
		alert( "비밀번호가 일치하지 않습니다. 다시 확인 해 주세요." );
		location.href="myBusBeforeEdit.do?driver=" + '${driver}';		
		//-->
	</script>
</c:if>
<%-- <c:redirect url="main.do"/> 리다이렉트를 쓰면 얼럿이 안먹음!--%>


<%-- <c:if test="${code eq 111}"></c:if> --%>