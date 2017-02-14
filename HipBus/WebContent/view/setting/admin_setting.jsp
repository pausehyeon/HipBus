<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/HipBus/stylesheets/w3style_black.css">
<script type="text/javascript" src="/HipBus/scripts/adminScript.js"></script>

<!-- admin.jsp -->
<c:set var="str_title" value="HipBus"/>
<c:set var="str_idMsg" value="님 <br>반갑습니다."/>
<c:set var="str_adminMenu" value="관리자 메뉴"/>

<c:set var="str_report" value="HipBus 이용현황"/>
<c:set var="str_memberReport" value="Members"/>	<!--사용자 현황 -->
<c:set var="str_crewReport" value="Crew"/>		<!-- 크루현황 -->
<c:set var="str_postReport" value="Posted"/>	<!-- 게시물현황 -->

<c:set var="str_memberModify" value="회원정보 관리"/>
<c:set var="str_memGrade" value="등급"/>
<c:set var="str_memEmail" value="이메일(=id)"/>
<c:set var="str_memNick" value="닉네임"/>
<c:set var="str_memAuthority" value="관리자 권한"/>
<c:set var="str_listMsg" value="불러올 회원목록이 없습니다."/>
<c:set var="str_memGo" value="Go to"/>
<c:set var="str_memModify" value="회원정보수정"/>
<c:set var="str_memLeave" value="회원탈퇴"/>
<c:set var="str_memSearchOption" value="검색기준 선택"/>
<c:set var="str_memSearchBtn" value="검색"/>

<c:set var="str_adminAd" value="상업광고"/>
<c:set var="str_adMsg" value="*이미지를 업로드하거나 광고용HTML코드를 입력해주세요."/>
<c:set var="str_adSize" value="크기 : 350X250"/>
<c:set var="str_adImgBtn" value="이미지 삽입"/>
<c:set var="str_adCodeMsg" value="HTML Code를 삽입하세요."/>
<c:set var="str_adAddBtn" value="Add AD"/>
<c:set var="str_adDeleteBtn" value="Delete AD"/>

<c:set var="str_adminEmail" value="관리자 초대"/>
<c:set var="str_emEmail" value="Email"/>
<c:set var="str_emSendEmail" value="Send Email"/>

<c:set var="str_adminModify" value="관리자 정보수정"/>
<c:set var="str_amProfile" value="Profile Picture"/>
<c:set var="str_amNick" value="Nick Name"/>
<c:set var="str_amPasswd" value="PassWord"/>
<c:set var="str_amPasswdCheck" value="PassWord Check"/>
<c:set var="str_amModifyBtn" value="수정 완료"/>


<c:set var="str_adminSignOut" value="관리자 탈퇴"/>
<c:set var="str_amLeaveMsg" value=" 사용하고 계신 계정은 탈퇴할 경우 복구가 불가능하며 자세한 사항은 인사부 02-111-1313으로 문의바랍니다. <br>탈퇴 후 사이트관리 권한이 사라지며 한달간 가입이 불가합니다."/>
<c:set var="str_amLeaveCheck" value="안내 사항을 모두 확인하였으며, 이에 동의합니다."/>
<c:set var="str_adminDeleteBtn" value="관리자 탈퇴"/>















