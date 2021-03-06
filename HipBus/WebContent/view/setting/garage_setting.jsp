<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/HipBus/stylesheets/w3style_blue.css">
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript" src="/HipBus/scripts/garageScript.js"></script>
<style>
	.w3-sidenav a,.w3-sidenav h4 {padding: 12px;}
	.w3-navbar li a {
	    padding-top: 12px;
	    padding-bottom: 12px;
	}
</style>

<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="str_Title" value="HipBus"/>
<c:set var="str_Subject" value="글제목"/>
<c:set var="str_Modify" value="수정하기"/>
<c:set var="str_Image" value="이미지 첨부"/>
<c:set var="str_Write" value="글쓰기"/>
<c:set var="str_Writer" value="작성자"/>
<c:set var="str_Content" value="내용"/>
<c:set var="str_Search" value="검색"/>
<c:set var="str_ReadCount" value="조회수"/>
<c:set var="str_Reg_Date" value="작성일"/>
<c:set var="btn_Write" value="작성완료"/>
<c:set var="btn_Cancel" value="작성취소"/>

<!-- garageFAQ.jsp -->
<c:set var="str_FAQ" value="FAQ"/>
<c:set var="str_FAQModify" value="FAQ수정"/>
<c:set var="str_FAQWrite" value="FAQ작성"/>
<c:set var="str_FAQTitle" value="자주 묻는 질문"/>

<!-- garageNews.jsp -->
<c:set var="str_News" value="NEWS"/>
<c:set var="str_NewsTitle" value="HipBus에서 전하는 공지사항 및 최신 힙합 소식입니다."/>
<c:set var="str_newsInfo" value="최신 공지사항은 이미지 슬라이드 형식으로 HipBus 메인화면에도 보여집니다. 신중히 작성해주세요."/>
<c:set var="str_Recommend" value="추천하기"/>
<c:set var="str_Top" value="위로"/>

<!--  garageNewsWrite.jsp -->
<c:set var="str_insertThumbnail" value="대표 이미지 :"></c:set>

<!-- garageOnAir.jsp  -->
<c:set var="str_OnAir" value="OnAir"/>
<c:set var="str_OnAirTitle" value="현재 방송중인 버스를 모아봅니다."/>
<c:set var="str_order" value="정렬"/>
<c:set var="str_latest" value="최신순"/>
<c:set var="str_morePassengers" value="탑승인원순"/>
<c:set var="str_howTo" value="라이브 스트리밍 이용방법"/>

<!-- garageUpcoming.jsp -->
<c:set var="str_Upcoming" value="Upcoming"/>
<c:set var="str_UpcomingTitle" value="각 Bus의 공연일정 게시글을 모아서 보여줍니다."/>
<c:set var="str_upcomingO" value="의 공연일정이 있습니다."/>

<!-- garageWanted.jsp -->
<c:set var="str_Wanted" value="Wanted"/>
<c:set var="str_WantedTitle" value="각 Bus의 구인게시글을 모아서 보여줍니다."/>
<c:set var="msg_search_x" value="검색 결과가 없습니다."/>


<c:set var="msg_list_x" value="게시글이 없습니다."/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>

<c:set var="btn_modify" value="글수정"/>
<c:set var="btn_delete" value="글삭제"/>
<c:set var="btn_list" value="글목록"/>

<!-- garageUpcoming.jsp -->
<c:set var="str_noUpcoming" value="다가오는 공연 일정이 없습니다."></c:set>



