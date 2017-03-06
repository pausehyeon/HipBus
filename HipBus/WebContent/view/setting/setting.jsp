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
<!-- jQuery연결 : top.jsp로 옮겼습니다. 170226 지현-->
<!-- ckeditor연결 -->
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>



<c:set var="project" value="/HipBus"/>
<c:set var="googleApiKey" value="AIzaSyAg6U0l2-bbb3gH_VCElJcM9Ry6Uug7jFw"/>

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
<c:set var="str_signOut" value="&#xf08b; Sign Out"/>
	<!-- ^ &#xf08b;는 fontawesome의 fa-sign-out -->

<!-- mainSignIn.jsp, modal_signIn.jsp -->
<c:set var="str_signIn" value="Sign in"/>
<c:set var="str_signInUserName" value="Username"/>
<c:set var="str_signInPassword" value="Password"/>
<c:set var="str_signInRememberMe" value=" Remember me"/>
<c:set var="str_signInNotMember" value="아직 회원이 아니라면? "/>
<c:set var="str_signInBecomeMember" value="Become a HipDriver"/>
<c:set var="str_signInCancel" value="Cancel"/>
<c:set var="str_signInPasswordSearchMent" value="비밀번호가 기억이 안나세요? "/>
<c:set var="str_passwordSearch" value="임시 비밀번호 발급받기"/>
<c:set var="str_wrongIdOrPasswd" value="이메일 주소 혹은 비밀번호가 맞지 않습니다."/>
<c:set var="str_needVerification" value="이메일 인증이 필요합니다. 가입 당시 입력하신  이메일로 인증코드가 전송되었으니 확인해주세요."/>

<!-- bottom.jsp -->
<c:set var="str_alramOn" value="알람기능을 켜주세요.^^"/>
<c:set var="str_noAlram" value="알람이 없습니다."/>
<c:set var="str_beat" value="비트"/>
<c:set var="str_rab" value="랩"/>
<c:set var="str_mixTape" value="믹스테이프"/>
<c:set var="str_vocal" value="보컬"/>
<c:set var="str_gasa" value="가사"/>
<c:set var="str_free" value="자유"/>
<c:set var="str_reply" value="에 댓글이 달렸습니다."/>
<c:set var="str_replyConfirm" value="실시간 댓글 확인"/>
<c:set var="str_realReply" value="실시간 댓글 알람"/>
<c:set var="str_busGo" value="최근 방문한 myBus로 이동합니다."/>
<c:set var="str_crewGo" value="최근 방문한 crewBus로 이동합니다."/>
<c:set var="str_stationGo" value="최근 방문한 게시판으로 이동합니다."/>

