<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${selectResult != null}">
	[
	<c:forEach var="taglist" items="${selectResult}" varStatus="status">
		<c:if test="${status.count!=1}">
				,
		</c:if>
		'${taglist}'
	</c:forEach>
	]	
</c:if>
