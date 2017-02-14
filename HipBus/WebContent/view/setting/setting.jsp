<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 반응형 웹디자인 위한 content 너비 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트연결 -->
<link rel="stylesheet" href="/HipBus/stylesheets/w3style.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery연결 -->
<script type="text/javascript" src="/HipBus/scripts/jquery-3.1.1.js"></script>
<!-- ckeditor연결 -->
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>


<c:set var="project" value="/HipBus"/>

<!-- 기본 -->
<c:set var="str_mainStation" value="Main Station"/>
<c:set var="str_publicGarage" value="Public Garage"/>
<c:set var="str_management" value="Management"/>
<c:set var="str_news" value="News"/>
<c:set var="str_onAir" value="On Air"/>
<c:set var="str_upcoming" value="Upcoming"/>
<c:set var="str_contact" value="Contact"/>
<c:set var="str_myBus" value="My Bus"/>
<c:set var="str_crewBus" value="Crew Bus"/>
<c:set var="str_signOut" value="Sign Out"/>

<!-- mainSignIn.jsp, modal_signIn.jsp -->
<c:set var="str_signIn" value="Sign in"/>
<c:set var="str_signInUserName" value="Username"/>
<c:set var="str_signInPassword" value="Password"/>
<c:set var="str_signInRememberMe" value=" Remember me"/>
<c:set var="str_signInNotMember" value="아직 회원이 아니라면? "/>
<c:set var="str_signInBecomeMember" value="Become a HipDriver"/>
<c:set var="str_signInCancel" value="Cancel"/>
<c:set var="str_signInPasswordSearchMent" value="비밀번호가 기억이 안나세요? "/>
<c:set var="str_wrongIdOrPasswd" value="이메일 주소 혹은 비밀번호가 맞지 않습니다."/>



