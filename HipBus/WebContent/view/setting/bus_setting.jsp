<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Titles -->
<c:set var="str_crewbusTitle" value="HipBus - Crew Bus"/>
<c:set var="str_mybusTitle" value="HipBus - My Bus"/>
<c:set var="str_upcomingTitle" value="HipBus - Upcoming"/>
<c:set var="str_crewbusTitle" value="HipBus - Crew Bus"/>

<!-- myBus / crewBus -->
<c:set var="str_putMsg" value="이곳에 메세지를 남기세요"/>
<c:set var="str_boardEx" value="ex) 좋은 음악이에요!"/>
<c:set var="str_cantBoard" value="방명록을 작성하려면 로그인해주세요♡"/>
<c:set var="str_live" value="Live"/>
<c:set var="str_whatsLive" value="라이브방송이란?"/>
<c:set var="str_post" value="Post"/>
<c:set var="str_modBoard" value="수정하기"/>
<c:set var="str_delBoard" value="삭제하기"/>
<c:set var="str_modComplete" value="수정완료"/>
<c:set var="str_modCancel" value="수정취소"/>
<c:set var="str_moreBoard" value="More..."/>

<!-- myBusBeforeEdit.jsp -->
<c:set var="str_modProfile" value="회원 정보 수정"/>
<c:set var="str_passwdHelp" value="* 정보 수정을 위해 비밀번호를 다시 한번 입력해주세요."/>
<c:set var="str_email" value="Email"/>
<c:set var="str_passwd" value="Password"/>
<c:set var="str_confilm" value="확인"/>

<!-- myBusLeft.jsp -->
<c:set var="str_myProfile" value="Profile"/>
<c:set var="str_crew" value="소속 크루 : "/>
<c:set var="str_editProfile" value=" edit profile"/>
<c:set var="str_hop" value="hop"/>
<c:set var="str_hopperList" value=" 탑승자 명단"/>
<c:set var="str_oldVideos" value=" 지난 라이브 영상"/>
<c:set var="str_seePosts" value=" 의 게시글 모아보기"/>
<c:set var="str_whole" value="전체"/>
<c:set var="str_rap" value="랩"/>
<c:set var="str_mixtape" value="믹스테잎"/>
<c:set var="str_vocal" value="보컬"/>
<c:set var="str_lirics" value="가사"/>
<c:set var="str_freeTalk" value="잡담"/>
<c:set var="str_tags" value="관심사"/>

<!-- crewBusLeft.jsp -->
<c:set var="str_crewProfile" value="Crew Profile"/>
<c:set var="str_memberCount" value="크루 구성원 : "/>
<c:set var="str_per" value="명"/>
<c:set var="str_infoTitle" value="잠깐!"/>
<c:set var="str_infoMsg" value="다른 Driver의 버스에 탑승하면 다양한 정보를 받아보실 수 있습니다."/>

<!-- myBusRight.jsp -->
<c:set var="str_edit" value="Edit"/>
<c:set var="str_detail" value="자세히"/>
<c:set var="str_wanted" value="Wanted"/>
<c:set var="str_crewApply" value="Crew 가입 요청"/>

<!-- myBusUpcoming.jsp -->
<c:set var="str_upcomingList" value="다가오는 공연"/>
<c:set var="str_writer" value="작성자 : "/>
<c:set var="str_writeDate" value="| 작성일 : "/>
<c:set var="str_hits" value="| 조회수 : "/>

<!-- myBusUpcomingRead.jsp -->
<c:set var="str_minute" value=" 분"/>
<c:set var="str_goUpcomingList" value="더 많은 공연일정 보러가기"/>

<!-- myBusUpcomingWrite.jsp -->
<c:set var="str_upcoming" value="Upcoming"/>
<c:set var="str_concertName" value="공연명"/>
<c:set var="str_location" value="* 장소"/>
<c:set var="str_cast" value="* 출연진"/>
<c:set var="str_date" value="* 일시"/>
<c:set var="str_time" value="* 시간"/>
<c:set var="str_register" value="등록"/>

<!-- myBusVideos.jsp -->
<c:set var="str_whosLive" value="님의 라이브"/>

<!-- myBusHopOnPro.jsp -->
<c:set var="str_hopOnError" value="버스에 정상적으로 올라타지 못했습니다."/>
<c:set var="str_hopOffError" value="버스에서 성공적으로 내리지 못했습니다."/>

<!-- myBusMyArticles.jsp -->
<c:set var="str_myArticles" value="님의 모든 글"/>

<!-- myBusWanted.jsp, myBusWantedModify.jsp -->
<c:set var="str_subject" value="제목"/>
<c:set var="str_duedate" value="모집 마감일"/>
<c:set var="str_list" value="전체 글목록"/>
<c:set var="str_mylist" value="글목록"/>
<c:set var="str_ended" value="마감"/>
<c:set var="str_insertThumbnail" value="대표이미지 선택"/>
<c:set var="str_modifyThumbnail" value="대표이미지 수정"/>
<c:set var="str_currentThumbnail" value="기존 대표이미지"/>
