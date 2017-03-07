<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${hid eq 2}">
	<c:if test="${result eq 1 }">
	false
	</c:if>
	<c:if test="${result eq 0 }">
	true
	</c:if>
</c:if>
<c:if test="${hid eq 1}">
	<c:if test="${result eq 1 }">
	true
	</c:if>
	<c:if test="${result eq 0 }">
	false
	</c:if>
</c:if>