<!-- 주석 지현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/busScript.js"></script>
<!-- SETTING 끝 -->

<c:if test="${signOutResult == 0 }">
	<script type="text/javascript">
		//<!--		
		alert( signouterror );
		location.href="mainSignUp.do";
		//-->
	</script>
</c:if>
<c:if test="${signOutResult == 1 }">
	<script type="text/javascript">
		//<!--
		alert( signoutok );		
		location.href="main.do";
		//-->
	</script>	
</c:if>
<c:if test="${signOutResult == -1 }">
	<script type="text/javascript">
		//<!--		
		alert( signoutpasswderror );
		location.href="myBusEdit.do?driver=" + '${sessionScope.memEmail}';		
		//-->
	</script>
</c:if>
<%-- <c:redirect url="main.do"/> 리다이렉트를 쓰면 얼럿이 안먹음!--%>



    
<!-- alert로 회원과입 결과 알리고 로그인창 띄우기 -->

