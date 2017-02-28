<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${article != null}">
	<result>
		<code>select</code>
		<count>
		${count}
		</count>
		<data>[
			<c:forEach var="article" items="${article}" varStatus="vs">
				<c:if test="${vs.count!=1}">
				,
				</c:if>
				{
					subject : '${article.subject}',
					category : ${article.category},
					num : ${article.num},
					replynum : ${article.replynum}
				}
			</c:forEach>
		]</data>
	</result>
</c:if>
<c:if test="${article == null}">
	<result>
		<code>empty</code>
		<message>글을 불러오지 못했습니다.</message>
	</result>
</c:if>