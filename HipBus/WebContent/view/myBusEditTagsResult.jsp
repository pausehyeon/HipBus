<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<c:if test="${type == 'list'}">
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
</c:if>
<c:if test="${type == 'insert'}">
	<c:if test="${insertResult != null}">
		${insertResult}
	</c:if>
</c:if>
<c:if test="${type == 'delete'}">
	<c:if test="${deleteResult != null}">
		${deleteResult}
	</c:if>
</c:if>




