<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result != 1 && result != 0 }">
	<result>
		<code>deleted</code>
		<data>${replynum}</data>
		<deldata>${ref_num}</deldata>
	</result>
</c:if>
<c:if test="${result == 1}">
	<result>
		<code>deleted</code>
		<data>${replynum}</data>
		<deldata>${ref_num}</deldata>
	</result>
</c:if>
<c:if test="${result == 0}">
	<result>
		<code>failed</code>
		<message>댓글 삭제에 실패하였습니다.</message>
	</result>
</c:if>