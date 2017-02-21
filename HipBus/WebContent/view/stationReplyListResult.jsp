<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${dto != null}">
	<result>
		<code>selected</code>
		<data>[
			<c:forEach var="article" items="${dto}" varStatus="vs">
				<c:if test="${vs.count!=1}">
				,
				</c:if>
				{
					email : '${article.email}',
					content : '${article.content}',
					reg_date : '${article.reg_date}',
					replynum : '${article.replynum}',
					ref_num :  ${article.ref_num},
					re_step :  ${article.re_step}
				}
			</c:forEach>
		]</data>
	</result>
</c:if>
<c:if test="${dto == null}">
	<result>
		<code>empty</code>
		<message>댓글을 불러오지 못했습니다.</message>
	</result>
</c:if>
