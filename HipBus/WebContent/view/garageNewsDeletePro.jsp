<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>

<title>${str_Title}</title>

<c:if test="${result == 0}">		
		<script type="text/javascript">
		//<!--
		alert( deleteerror );
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=garageNews.do">
</c:if>
	
<c:if test="${result == 1}">
		<c:redirect url="garageNews.do"/>
</c:if>	

