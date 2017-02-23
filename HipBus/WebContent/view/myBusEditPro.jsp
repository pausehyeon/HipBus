<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/main_setting.jsp"%>
<script type="text/javascript" src="/HipBus/scripts/busScript.js"></script>
<!-- SETTING 끝 -->
<!-- 데이터가 아무것도 없을때 수정이 안되고 다시 되돌리는 것. -->
<!-- 수정 성공/실패부분. -->
<c:if test="${ ( result eq 0 ) or (profileResult ne 1) or (channelResult eq 0)}">
	<script type="text/javascript">
		//<!--		
		alert('result: '+'${result}'+' profile~:' +'${profileResult}' +' channelResult: ' +'${channelResult}');
		alert( "회원정보 수정에 실패하였습니다. \n잠시 후 다시 시도하세요." );
		location.href="myBusEdit.do?driver=" + '${driver}';		
		//-->
	</script>
</c:if>
<c:if test="${ (result eq null or result eq 1) and (profileResult eq 1) and (channelResult eq null or channelResult eq 1)}">
	<script type="text/javascript">
		//<!--
		alert("회원정보 수정에 성공하였습니다.");	
		location.href="myBus.do?driver=" + '${driver}';
		//-->
	</script>	
</c:if>
