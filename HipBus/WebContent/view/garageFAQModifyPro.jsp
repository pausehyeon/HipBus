<%@page import="model.FAQDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- FAQ 수정 결과 alert -->
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>

<title>${str_Title}</title>

<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			alert( modifyerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0;url=garageFAQ.do">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="garageFAQ.do"/>		
</c:if>