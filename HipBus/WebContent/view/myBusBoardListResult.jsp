<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${boardList != null}">
	<result>
		<code>selected</code>
		<data>[
			<c:forEach var="article" items="${boardList}" varStatus="status">
				<c:if test="${status.count!=1}">
				,
				</c:if>
				{
					driver : '${article.driver}',
					num : ${article.num},
					email : '${article.email}',
					nick : '${article.nick}',
					content : '${article.content}',
					reg_date : '${article.reg_date}',
					imglocation : '${article.imglocation}'
				}
			</c:forEach>
		]</data>
	</result>
</c:if>
<c:if test="${boardList == null}">
	<result>
		<code>empty</code>
		<message>방명록을 불러오지 못했습니다.</message>
	</result>
</c:if>
