<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/HipBus/scripts/ajax.js"></script>
<script src="/HipBus/scripts/busScript.js"></script>

<!-- Titles -->
<c:set var="str_crewbusTitle" value="HipBus - Crew Bus"/>
<c:set var="str_mybusTitle" value="HipBus - My Bus"/>
<c:set var="str_crewbusTitle" value="HipBus - crew Bus"/>
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
<c:set var="str_upcoming" value="공연"/>
<c:set var="str_wanted" value="구인"/>

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
<c:set var="str_goUpcomingList" value="공연일정 보러가기"/>

<!-- myBusUpcomingWrite.jsp -->
<c:set var="str_upcoming" value="Upcoming"/>
<c:set var="str_perf_subject" value="공연명"/>
<c:set var="str_perf_place" value="공연 장소"/>
<c:set var="str_perf_cast" value="출연진"/>
<c:set var="str_perf_date" value="공연 일자"/>
<c:set var="str_perf_runningtime" value="공연 시간 (분)"></c:set>
<c:set var="str_perf_price" value="관람료 (원)"/>
<c:set var="str_searchPlace" value="검색할 주소를 입력해주세요."/>
<c:set var="str_postUpcoming" value="공연일정 등록"/>
<c:set var="str_selectPoster" value="공연 포스터 (권장 크기 560*790) : "/>

<!-- myBusUpcomingRead.jsp -->
<c:set var="str_time" value="공연 시각"/>

<!--  myBusUpcomingModify -->
<c:set var="str_modifyUpcoming" value="공연일정 수정"/>

<!-- myBusVideos.jsp -->
<c:set var="str_whosLive" value="님의 라이브"/>
<c:set var="str_title" value="TITLE : "/>
<c:set var="str_myVideos" value=" 님의 모든 영상"/>

<!-- myBusHopOnPro.jsp -->
<c:set var="str_hopOnError" value="버스에 정상적으로 올라타지 못했습니다."/>
<c:set var="str_hopOffError" value="버스에서 성공적으로 내리지 못했습니다."/>

<!-- myBusMyArticles.jsp -->
<c:set var="str_myArticles" value="님의 모든 글"/>

<!-- myBusWanted.jsp, myBusWantedModify.jsp -->
<c:set var="str_subject" value="제목"/>
<c:set var="str_duedate" value="모집 마감일"/>
<c:set var="str_list" value="전체 목록"/>
<c:set var="str_mylist" value="목록"/>
<c:set var="str_ended" value="마감"/>
<c:set var="str_insertThumbnail" value="대표이미지 선택 (권장 크기 560*790) : "/>
<c:set var="str_modifyThumbnail" value="대표이미지 수정"/>
<c:set var="str_currentThumbnail" value="기존 대표이미지"/>
<c:set var="str_postWanted" value="구인광고 등록"/>
<c:set var="str_modifyWanted" value="구인광고 수정 완료"/>

<!-- myBusEdit.jsp crewBusEdit.jsp-->
<c:set var="str_editChanal" value="채널 아이디 확인하는 방법"/>
<c:set var="str_editModifyBtn" value="수정완료"/>
<c:set var="str_crewMemEmail" value="Email"/>
<c:set var="str_crewMemNick" value="Nick"/>
<c:set var="str_crewMasterBtn" value="크루장 위임"/>
<c:set var="str_crewMemEjectBtn" value="크루 탈퇴"/>
<c:set var="str_crewMemManage" value="Crew Member Management"/>
<c:set var="str_crewMemNoneMsg" value="크루에 가입한 회원이 없습니다. 크루를 홍보해주세요."/>

<c:set var="str_editTag" value="Tags 수정"/>
<c:set var="str_goSignOut" value="회원 탈퇴"/>
<c:set var="str_signOutmsg1" value="탈퇴할 경우 재사용 및 복구가 불가능합니다."/>
<c:set var="str_signOutmsg2" value="탈퇴 후 사이트에 게시한 내용을 수정/삭제 할 수 없습니다."/>
<c:set var="str_agreeSignOut" value="안내 사항을 모두 확인하였으며, 이에 동의합니다."/>
<c:set var="str_signOutbtn" value="탈퇴"/>
