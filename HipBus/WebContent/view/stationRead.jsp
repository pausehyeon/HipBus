<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>HipBus</title>
<body>

	<c:import url="navbar_top.jsp"/>
	<%@ include file="navbar_station.jsp" %>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>가사</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<div class="w3-card-4">
					<header class="w3-container w3-padding-jumbo w3-theme-l3">
						<h3>애국가</h3>
						<p class="w3-right">작성자:aaa | 작성일:2016-12-19 | 조회수:0</p>
					</header>

					<div class="w3-container w3-padding-128 w3-padding-jumbo">
						<pre>
동해물과 백두산이 마르고 닳도록
하느님이 보우하사 우리나라 만세!
무궁화 삼천리 화려강산
대한사람 대한으로 길이 보전하세.
					</pre>
					</div>

					<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
						<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-thumbs-up w3-margin-right"></i>추천하기</a> <a href="#"
							class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
							class="fa fa-arrow-up w3-margin-right"></i>위로</a>
					</footer>
					<!--  댓글이 있는 경우  -->
				<div class="w3-container w3-row">
				<div class="w3-harf w3-container">
				<ul class="w3-ul">
				<li class="w3-xlarge">&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-user  w3-padding-5"></i>
   				ID 작성일</li>
   				</ul>
   				</div>
   				<div class="w3-harf w3-container w3-right">
   				asdas
   				</div>
   				</div>
				<div class="w3-container">
				<pre class="w3-input w3-border w3-left"> 댓글이 있네요</pre>
				</div>
				</div>
   				</div>
				<br><br>
				&nbsp;<h5>댓글작성</h5>	
					<!--  댓글쓰기 -->
					<div class="w3-container w3-row">
				<div class="w3-third w3-container w3-margin-top" style="width:8%"> 
				<i class="w3-xxlarge glyphicon glyphicon-user"></i>
				</div>
				<div  class="w3-third w3-container" style="width:80%">
				<textarea class="w3-input w3-border w3-padding-5"></textarea>
				</div>
				<div class="w3-third w3-container w3-margin-top" style="width:12%">
				<input class="w3-btn w3-theme-d1 " type="button" value="등록">
				</div>
				</div>
			</div>
		</div>	
		
	
		<!-- END MAIN -->
		</div>

	<!-- Footer -->
	<c:import url="footer.jsp"/>


</body>
</html>