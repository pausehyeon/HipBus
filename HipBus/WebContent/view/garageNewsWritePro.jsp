<%@page import="model.NewsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공지사항 글쓰기 결과 -->
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
	<c:redirect url="garageNews.do"/>
</c:if>	

