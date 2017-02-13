<!-- 주석 지현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript" src="/HipBus/scripts/mainScript.js"></script>
<!-- SETTING 끝 -->

<h2> ㅇㅇ </h2>

<c:if test="${result == 0 }">
	<script type="text/javascript">
		//<!--
		alert("test");
		erroralert( signuperror );
		location.href="mainSignUp.do";
		//-->
	</script>
</c:if>
<c:if test="${result != 0 }">
	<script type="text/javascript">
		alert( signupok );
		alert("test2");
		location.href="mainSignIn.do";
	</script>	
	<%-- <c:redirect url="main.do"/> 리다이렉트를 쓰면 얼럿이 안먹음!--%>
</c:if>


    
<!-- alert로 회원과입 결과 알리고 로그인창 띄우기 -->

