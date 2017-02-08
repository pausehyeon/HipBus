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
<c:set var="str_allViewText" value="전체 게시글을 모아볼 수 있습니다."/>
<c:set var="str_write" value="글쓰기"/>
<!-- stationRead.jsp -->
<c:set var="str_recommend" value="추천하기"/>
<c:set var="str_top" value="위로"/>
<c:set var="str_reply" value="답글"/>
<c:set var="str_modify" value="수정"/>
<c:set var="str_delete" value="삭제"/>
<c:set var="str_replyWrite" value="답글달기"/>
<c:set var="str_register" value="등록"/>
<!-- navbar_station.jsp -->
<c:set var="str_sideName" value="Main Station"/>
<c:set var="str_beat" value="비트"/>
<c:set var="str_rab" value="랩"/>
<c:set var="str_mixTape" value="믹스테이프"/>
<c:set var="str_vocal" value="보컬"/>
<c:set var="str_gasa" value="가사"/>
<c:set var="str_freeBoard" value="자유게시판"/>
