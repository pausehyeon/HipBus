<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript" src="/HipBus/scripts/mainScript.js"></script>
<!-- SETTING 끝 -->
<c:if test="${forgotResult == 0 }">
	<script type="text/javascript">
		//<!--		
		alert("입력하신 이메일이 없습니다.\n이메일을 확인해주세요.");
		location.href="mainForgot.do";
		//-->
	</script>
</c:if>
<c:if test="${forgotResult == 1 }">
	<script type="text/javascript">
		//<!--		
		alert("입력하신 이메일로 임시비밀번호를 전송하였습니다.\n이메일 인증후 임시비밀번호로 로그인 해 주세요.");
		location.href="main.do";
		//-->
	</script>
</c:if>
<c:if test="${forgotPasswdUpdate == 0 }">
	<script type="text/javascript">
		//<!--		
		alert("비밀번호 찾기에 실패했습니다. \n잠시 후 다시 시도해 주세요.");
		location.href="main.do";
		//-->
	</script>
</c:if>
<c:if test="${forgotPasswdUpdate == 1 }">
	<script type="text/javascript">
		//<!--		
		alert("이메일 인증에 성공하였습니다. \n임시 비밀번호로 로그인 후 수정 해 주세요.");
		location.href="mainSignIn.do";
		//-->
	</script>
</c:if>






<!-- 바뀐 비밀번호 이메일로 전송한 결과 alert 띄우고 포워딩 -->