<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl연결 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/HipBus/stylesheets/w3style_lilac.css">
<script type="text/javascript" src="/HipBus/scripts/stationScript.js"></script>
<style>
	.w3-sidenav a,.w3-sidenav h4 {padding: 12px;}
	.w3-navbar li a {
	    padding-top: 12px;
	    padding-bottom: 12px;
	}
</style>

<!-- station.jsp -->
<c:set var="str_title" value="Hipbus"/>
<c:set var="str_allView" value="전체보기"/>
<c:set var="str_allViewText" value="Main Station의 모든 글을 모아볼 수 있습니다."/>
<c:set var="str_beatViewText" value="자작 비트를 포스팅 하거나 관련 정보를 공유하는 공간입니다."/>
<c:set var="str_rabViewText" value="자작 랩을 게시하거나 관련 정보를 공유하는 공간입니다."/>
<c:set var="str_mixViewText" value="자작 음원을 포스팅 하거나 관련 정보를 공유하는 공간입니다."/>
<c:set var="str_vocalViewText" value="자신의 목소리를 자유롭게 들려주며 이야기 나누는 공간입니다."/>
<c:set var="str_gasaViewText" value="자작 가사를 포스팅 하거나 관련 정보를 공유하는 공간입니다."/>
<c:set var="str_freeViewText" value="힙합 이야기를 포함한 모든 주제에 대해 이야기 하는 공간입니다."/>
<c:set var="str_busGo" value="님의 버스로&#13;이동합니다"/>
<c:set var="str_ad" value="AD"/>
<c:set var="btn_write" value="글쓰기"/>
<c:set var="msg_station_x" value="게시글이 없습니다."/>
<c:set var="msg_login" value="글을 쓰려면 로그인을 해주세요"/>
<c:set var="str_subject" value="제목"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_nick" value="닉네임"/>
<c:set var="str_search" value="검색"/>
<!-- stationRead.jsp -->
<c:set var="btn_recommend" value="추천"/>
<c:set var="btn_top" value="위로"/>
<c:set var="str_reply" value="답글"/>
<c:set var="str_replyClose" value="답글닫기"/>
<c:set var="str_modify" value="수정"/>
<c:set var="str_delete" value="삭제"/>
<c:set var="str_replyWrite" value="댓글"/>
<c:set var="str_list" value="목록"/>
<c:set var="str_noreply" value="현재 댓글이 없습니다."/>
<c:set var="str_writeOk" value="글이 등록 되었습니다."/>
<c:set var="str_modOk" value="성공적으로 수정되었습니다."/>
<c:set var="str_delConfirm" value="삭제 하시겠습니까?"/>
<c:set var="btn_register" value="등록"/>
<c:set var="str_delOk" value="성공적으로 삭제되었습니다."/>

<!-- navbar_station.jsp -->
<c:set var="str_sideName" value="Main Station"/>
<c:set var="str_beat" value="비트"/>
<c:set var="str_rab" value="랩"/>
<c:set var="str_mixTape" value="믹스테이프"/>
<c:set var="str_vocal" value="보컬"/>
<c:set var="str_gasa" value="가사"/>
<c:set var="str_freeBoard" value="자유게시판"/>

<!-- stationWrite.jsp -->
<c:set var="str_free" value="자유"/>
<c:set var="str_writeName" value="글제목"/>
<c:set var="str_img" value="이미지 첨부"/>
<c:set var="btn_complete" value="작성완료"/>
<c:set var="btn_cancel" value="작성취소"/>

<!--  stationModify -->
<c:set var="btn_modifyComplete" value="수정완료"/>
<c:set var="btn_modifyCancel" value="수정취소"/>

<!-- stationRead.jsp -->
<c:set var="str_upCount" value="추천수"/>
<c:set var="str_writeNick" value="작성자"/>
<c:set var="str_reg_date" value="작성일"/>
<c:set var="str_readCount" value="조회수"/>