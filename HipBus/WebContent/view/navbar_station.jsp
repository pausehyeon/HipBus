<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/view/setting/station_setting.jsp"%>
<!-- Sidenav -->
<nav class="w3-sidenav w3-collapse w3-animate-right w3-theme-l5 w3-padding-xlarge" style="z-index:3;right:0;width:20%;" id="mySidenav">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="close menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4 onclick="location='station.do'"><b>${str_sideName}</b></h4>
	  <a href="station.do" class="w3-hover-opacity">${str_allView}</a>  
	  <a href="station.do?category=${category1}&type=2" class="w3-hover-opacity">${str_beat}</a>
	  <a href="station.do?category=${category2}&type=3" class="w3-hover-opacity">${str_rab}</a>
	  <a href="station.do?category=${category3}&type=4" class="w3-hover-opacity">${str_mixTape}</a>
	  <a href="station.do?category=${category4}&type=5" class="w3-hover-opacity">${str_vocal}</a>
	  <a href="station.do?category=${category5}&type=6" class="w3-hover-opacity">${str_gasa}</a>
	  <a href="station.do?category=${category6}&type=7" class="w3-hover-opacity">${str_freeBoard}</a>  
</nav>

<!-- Side Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-bottom w3-hide-large w3-hide-medium" id="myNavbar">
  <ul class="w3-navbar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <li class="w3-left" style="width:25% !important"><a href="station.do"> ${str_allView} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category1}&type=2"> ${str_beat} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category2}&type=3"> ${str_rab} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category3}&type=4"> ${str_mixTape} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category4}&type=5"> ${str_vocal} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category5}&type=6"> ${str_gasa} </a></li>
    <li class="w3-left" style="width:25% !important"><a href="station.do?category=${category6}&type=7"> ${str_freeBoard} </a></li>    
  </ul>
</div>