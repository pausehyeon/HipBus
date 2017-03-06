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
<c:set var="str_termsCheck" value="위사항에 동의 하였으며 회원가입을 진행하겠습니다."/>
<c:set var="str_termsLabel" value="약관동의"/>
<c:set var="str_terms" value="개인정보 보호 및 약관
&#9;아래에서 '동의'를 선택하면 HipBus 서비스 약관에 동의하게 됩니다. &#13;
또한 다음 주요 사항을 포함해 개인정보수집항목∙이용목적∙보유기간을 설명한 HipBus 개인정보처리방침에도 동의하게 됩니다. &#13;
&#13;사용자가 HipBus을사용할 때 HipBus에서 수집 및 이용하는 데이터 &#13;
&#9;HipBus 계정에 가입할 때 사용자의 계정과 함께 보관하기 위하여 이름과 이메일 주소와 같은 개인정보를 요청합니다.
사용자가 HipBus 지도에서 식당을 검색하거나 YouTube에서 동영상을 시청할 때 HipBus에서는 사용자의 활동에 관한 정보(예: 시청한 동영상, 기기 ID, IP 주소, 쿠키 데이터, 위치)를 수집 및 이용할 수 있습니다.
&#13;
또한 HipBus에서는 사용자가 HipBus 서비스(예: 광고, 애널리틱스, YouTube 동영상 플레이어)를 사용하는 앱 또는 사이트를 사용하는 경우에도 위에 설명한 종류의 데이터를 수집 및 이용합니다.
사용자의 계정 설정에 따라 이 데이터 중 일부는 Google 계정과 연결될 수 있으며 Google은 이 데이터를 개인정보로 취급합니다.
내 계정(myaccount.google.com)에서 Google이 이 데이터를 수집하고 사용하는 방법을 제어할 수 있습니다.
&#13;
HipBus이 정보를 처리하는 이유 &#13;
&#9;HipBus은 HipBus 개인정보처리방침에 명시된 다음과 같은 목적으로 이 데이터를 처리합니다.
&#13;
&divonx; 서비스의 유용성 향상 및 사용자의 관심분야를 반영한 검색결과 등 사용자에게 개인 최적화 설정된 콘텐츠 제공
&divonx; HipBus 서비스 품질 개선 및 새로운 서비스 개발
&divonx; HipBus 서비스 및 HipBus과 파트너 관계에 있는 사이트 및 앱을 통하여 사용자에게 개인 최적화 설정된 광고 제공
&divonx; 사기 및 오용 예방을 통한 보안 강화
&divonx; HipBus 서비스가 사용되는 방식을 이해하기 위한 분석 및 측정 수행
&#13;
데이터 보유 &#13;
&#9;HipBus은 이용자에게 자신의 개인정보를 열람하고, 이용자의 삭제 요청에 따라 해당 개인정보를 삭제하기 위하여 성실하게 노력합니다. &#13;
이용자로부터 개인정보 삭제 요청을 받는 경우, 아카이브 사본의 보존기간이 만료하며, 법률상 의무 준수 또는 합법적인 사업상 목적을 위하여 일부 데이터를 보관하여야 하는 경우가 아닌 한 아카이브 사본은 그 이후에 덮어 씌워집니다."/>

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


























