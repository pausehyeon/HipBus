<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.w3-tag, .fa {
	cursor: pointer
}

.w3-tag {
	height: 15px;
	width: 15px;
	padding: 0;
	margin-top: 6px
}

.mySlides {
	display: none
}
</style>
<!-- main.jsp -->
<c:set var="str_welcome" value="HipBus - Welcome!"/>
<c:set var="str_topTitle" value="What's HipBus?"/>
<c:set var="str_topContent1" value="The hippest way to express myself<br>나를 표현하는 가장 Hip한 방법, HipBus"/>
<c:set var="str_topContent2" value="&nbsp;Become a HipDriver"/>
<c:set var="str_topContentsignIn" value="or sign-in (click)"/>
<c:set var="str_mainNews" value="News"/>
<c:set var="str_mainOnAir" value="On Air"/>
<c:set var="str_top3" value="Top3 Drivers of Today"/>
<c:set var="str_hopOn" value="Go to Hop on"/>
<c:set var="str_upcoming" value="Upcoming Events"/>
<c:set var="str_detail" value="자세히"/>
<c:set var="str_contactUs" value="Contact Us"/>
<c:set var="str_mainSend" value="Send"/>
<c:set var="str_welcomeMain" value="님 어서오세요!"/>
<c:set var="str_passengerCount" value="명의 승객이 탑승중입니다."/>
<c:set var="str_noTopDriver" value="아직 활동 회원이 없습니다. <br> 더 많은 활동 부탁드립니다!"></c:set>
<c:set var="str_noNewsArticles" value="등록된 공지사항이 없습니다."/>
<c:set var="str_rank" value="위"/>
<c:set var="str_perf_place" value="장소"/>
<c:set var="str_perf_date" value="공연 일자"/>
<c:set var="str_perf_runningtime" value="공연 시각"/>
<c:set var="str_minute" value="분"/>
<c:set var="str_perf_cast" value="출연진"/>
<c:set var="str_noUpcomings" value="다가오는 공연 정보가 없습니다."/>

<!-- mainForgot.jsp -->
<c:set var="str_searchPassword" value=" &nbsp;비밀번호 찾기"/>
<c:set var="str_noEmail" value="* 가입되어 있지 않은 이메일입니다."/>
<c:set var="str_newPasswordSend" value="새 비밀번호 전송"/>

<!-- mainSignUp.jsp -->
<c:set var="str_email" value="Email"/>
<c:set var="str_passwordCheck" value="Password 확인"/>

<!-- navbar_main.jsp -->
<c:set var="str_topDrivers" value="Top Drivers"/>

<!-- mainContactUsPro.jsp -->
<c:set var="str_mailingSuccess" value="문의메일이 성공적으로 전송되었습니다. 관리자 확인 후 24시간 이내에 답변하겠습니다."></c:set>

<!-- myBusEdit.jsp -->

<c:set var="str_editProfile" value=" edit profile"/>
<c:set var="str_userName" value="NickName"/>
<c:set var="str_password" value="Password"/>
<c:set var="str_channel_id" value="Youtube 채널 아이디"/>
<c:set var="str_howToChannel" value="채널 아이디 확인하는 방법"/>


























