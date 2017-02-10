<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/HipBus/scripts/mainScript.js"></script>
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
<c:set var="str_slideShow1" value="공연정보"/>
<c:set var="str_slideShow2" value="자작곡공유"/>
<c:set var="str_slideShow3" value="Live방송"/>
<c:set var="str_mainOnAir" value="On Air"/>
<c:set var="str_top3" value="Top3 Drivers of today"/>
<c:set var="str_hopOn" value="Hop on"/>
<c:set var="str_upcoming" value="Upcoming Events"/>
<c:set var="str_detail" value="자세히"/>
<c:set var="str_contactUs" value="Contact Us"/>
<c:set var="str_mainSend" value="Send"/>
<c:set var="str_welcomeMain" value="님 어서오세요!"/>

<!-- mainForgot.jsp -->
<c:set var="str_searchPassword" value=" &nbsp;비밀번호 찾기"/>
<c:set var="str_noEmail" value="* 가입되어 있지 않은 이메일입니다."/>
<c:set var="str_newPasswordSend" value="새 비밀번호 전송"/>

<!-- mainSignUp.jsp -->
<c:set var="str_email" value="Email"/>
<c:set var="str_signUpEmail" value="*이 주소로 가입인증 메일이 발송되므로 반드시 정확한 주소를 입력해주세요."/>
<c:set var="str_signUpUserName" value="*닉네임을 입력해주세요."/>
<c:set var="str_signUpPassword" value="*비밀번호는 숫자와 알파벳을 조합하여 5~10자리로 입력해주세요."/>
<c:set var="str_passwordCheck" value="Password 확인"/>
<c:set var="str_signUpPasswordCheck" value="*확인을 위해 다시 한번 입력해주세요."/>
<c:set var="str_emailOk" value="*사용할 수 있는 이메일입니다."/>
<c:set var="str_emailNo" value="*이미 존재하는 이메일입니다."/>
<c:set var="str_userNameOk" value="*사용할 수 있는 닉네임입니다."/>
<c:set var="str_userNameNo" value="*이미 존재하는 닉네임입니다."/>
<c:set var="str_emailLength" value="글자까지만 입력가능합니다."/>
<c:set var="str_passwordError1" value="*반드시 숫자와 알파벳을 조합하여야 합니다."/>
<c:set var="str_passwordError2" value="자리 이상입력해주십시오."/>
<c:set var="str_passwordError3" value="*비밀번호는 최대 "/>
<c:set var="str_passwordError4" value="글자를 초과할 수 없습니다."/>
<c:set var="str_passwordOk" value="*유효한 비밀번호입니다."/>
<c:set var="str_passwordError5" value="*반드시 숫자와 알파벳을 조합하여야 합니다."/>
<c:set var="str_passwordCheckOk" value="비밀번호가 일치합니다."/>
<c:set var="str_passwordCheckNo" value="비밀번호가 일치하지 않습니다."/>

<!-- navbar_main.jsp -->
<c:set var="str_topDrivers" value="Top Drivers"/>


<!-- mainContactUsPro.jsp -->
<c:set var="str_mailingSuccess" value="문의메일이 성공적으로 전송되었습니다. 관리자 확인 후 24시간 이내에 답변하겠습니다."></c:set>
























