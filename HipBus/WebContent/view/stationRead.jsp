<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="/HipBus/scripts/stationScript.js"></script>
<title>${str_title}</title>
<body>

	<c:import url="../top.do"/>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<%@ include file="navbar_station.jsp" %>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<c:choose>
			<c:when test="${article.category == 1}">
			<h3>${str_beat}</h3>
			</c:when>
			<c:when test="${article.category == 2}">
			<h3>${str_rab}</h3>
			</c:when>
			<c:when test="${article.category == 3}">
			<h3>${str_mixTape}</h3>
			</c:when>
			<c:when test="${article.category == 4}">
			<h3>${str_vocal}</h3>
			</c:when>
			<c:when test="${article.category == 5}">
			<h3>${str_gasa}</h3>
			</c:when>
			<c:when test="${article.category == 6}">
			<h3>${str_freeBoard}</h3>
			</c:when>
			</c:choose>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<div class="w3-card-4">
				<form name="readform">
					<header class="w3-container w3-padding-jumbo w3-theme-l3">
						<h3>${article.subject}</h3>
						<p class="w3-right">작성자:${article.nick} | 작성일:
						<fmt:formatDate value="${article.reg_date}"
				type="both" pattern="yyyy-MM-dd HH:mm"/> | 조회수:${article.readcount}
						<br>
						</p>
					</header>

					<div class="w3-container w3-padding-128 w3-padding-jumbo">
						<pre>
${article.content}
					</pre>
					</div>
					
					<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
						<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"
							onclick=""><i
							class="fa fa-thumbs-up w3-margin-right"></i>${btn_recommend}</a>
							<a href="station.do?pageNum=${pageNum}"
							class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
						<c:if test="${sessionScope.memEmail == article.email}">
						<a href="stationModify.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left">
						<i class="fa fa-cog w3-margin-right"></i>${str_modify}</a>
						<input type="hidden" value="${article.num}" name="num">
						<a  class="w3-btn w3-padding w3-theme-d1 w3-margin-left"
						onclick="alertgo()">
						<i class="glyphicon glyphicon-remove w3-margin-right"></i>${str_delete}</a>
							</c:if>
					
					</footer>
					<!--  댓글이 있는 경우  -->
				<div class="w3-container w3-row">
				<div class="w3-harf w3-container w3-large w3-left">
				<i class="glyphicon glyphicon-user  w3-padding-4"></i>
   				ID 작성일
   				</div>
   				<div class="w3-harf w3-container w3-padding-4 w3-right">
   				<a>${str_modify}</a> <a>${str_delete}</a> <a>${str_reply}</a>
   				</div>
   				</div>
				<div class="w3-container">
				<pre class="w3-input w3-border w3-left"> 댓글이 있네요</pre>
				</div>
				</form>
				</div>
   				</div>
				<br><br>
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;${str_replyWrite}</h5>
					<!--  댓글쓰기 -->
					<div class="w3-container w3-row">
				<div class="w3-third w3-container w3-margin-top" style="width:8%"> 
				<i class="w3-xxlarge glyphicon glyphicon-user"></i>
				</div>
				<div  class="w3-third w3-container" style="width:80%">
				<textarea class="w3-input w3-border w3-padding-5"></textarea>
				</div>
				<div class="w3-third w3-container w3-margin-top" style="width:12%">
				<input class="w3-btn w3-theme-d1 " type="button" value="${btn_register}">
				</div>
				</div>
			</div>
			
		</div>	
		
	
		<!-- END MAIN -->
		</div>

	<!-- Footer -->
	<c:import url="../bottom.do"/>


</body>
</html>