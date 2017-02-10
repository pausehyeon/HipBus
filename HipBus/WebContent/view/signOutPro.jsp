<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SETTING -->
<%@include file="/view/setting/setting.jsp"%>

<!-- 로그아웃 결과 원래있던 페이지로 redirect-->
<c:redirect url="${urlToGoBack}" />
<!-- ^ 이전에 저장해뒀던 url로 돌아감 -->
