<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result != 0}">
	<result>
		<code>inserted</code>
		<data>
			{
				driver : '${dto.getDriver()}',
				num : ${dto.getNum()},
				email : '${dto.getEmail()}',
				nick : '${dto.getNick()}',
				content : '${dto.getContent()}',
				reg_date : '${dto.getReg_date()}',
				imglocation : '${dto.getImglocation()}'
			}
		</data>
	</result>
</c:if>
<c:if test="${result == 0}">
	<result>
		<code>failed</code>
		<message>방명록이 정상적으로 입력되지 않았습니다.</message>
	</result>
</c:if>
