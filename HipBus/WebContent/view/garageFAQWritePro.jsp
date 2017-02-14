<%@page import="model.FAQDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- FAQ 작성 실패시 경고창 -->
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>
<script src="${project}/scripts/garageScript.js"></script>



<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">	
	<c:redirect url="garageFAQ.do"/>
</c:if>	

