<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${searchMember != null}">
	<result>
		<code>selected</code>
		<data>[
			<c:forEach var="article" items="${searchMember}" varStatus="status">
				
				<c:if test="${status.count!=1}">
				,
				</c:if>
				{	
					email : '${article.email}',
					nick : '${article.nick}',
					imglocation : '${article.imglocation}',
					mem_level : '${article.mem_level}'
				}
			
			</c:forEach>
		]</data>
		
		<datas>[
			<c:forEach var="searchCrew" items="${searchCrew}" varStatus="status1">
		
				<c:if test="${status1.count!=1}">
				,
				</c:if>
				{	
					crewname : '${searchCrew.crewname}',
					crewid : '${searchCrew.crewid}',
					crewImg : '${searchCrew.imglocation}'
		
				} 
			</c:forEach>
		]</datas>
		
	</result>
</c:if>

<c:if test="${searchMember == null}">
	<result>
		<code>empty</code>
		<message>방명록을 불러오지 못했습니다.</message>
	</result>
</c:if>


