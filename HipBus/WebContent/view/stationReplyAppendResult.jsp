<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result != 0}">
	<result>
		<code>inserted</code>
		<data>
			{
				replynum : '${dto.getReplynum()}',
				num : ${dto.getNum()},
				email : '${dto.getEmail()}',
				content : '${dto.getContent()}',
				ref_num : '${dto.getRef_num()}',
				re_step : '${dto.getRe_step()}',
				re_level : '${dto.getRe_level()}',
				reg_date : '${dto.getReg_date()}',
				status : '${dto.getStatus()}'
			}
		</data>
	</result>
</c:if>
<c:if test="${result == 0}">
	<result>
		<code>failed</code>
		<message>댓글이 정상적으로 입력되지 않았습니다.</message>
	</result>
</c:if>