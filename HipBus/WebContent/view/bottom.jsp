<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body onclick="set()">

	<!-- 댓글 Alert   -->
	<div class="w3-container w3-margin-bottom w3-text-khaki" style="border: 1px solid white; float: left; width: 5%;">
		<a href="#" onclick="document.getElementById('id01').style.display='block'" class="w3-bottom w3-left w3-padding-large w3-hover-opacity" title="실시간 댓글 알림"> <i class="fa fa-bell w3-xxlarge"></i><span
			class="w3-badge w3-red">3</span>
		</a>
	</div>
	<div style="border: 1px solid white; float: left; width: 5%;">
		<span class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="get()" Title="${driver}의 bus">mybus1</span>
	</div>
	<div style="border: 1px solid white; float: left; width: 5%;">
		<span class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="get2()" >mybus2</span>
	</div>
	<div style="border: 1px solid white; float: left; width: 5%;">
		<span class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="location.href='garageNews.do'">mybus3</span>
	</div>
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-padding-32 w3-animate-top w3-card-8">
			<header class="w3-container w3-center">
				<span onclick="document.getElementById('id01').style.display='none'" class="w3-closebtn">&times;</span>
				<h4>
					<i class="fa fa-bell w3-xlarge"></i>&nbsp;실시간 댓글 확인
				</h4>
			</header>
			<div class="w3-container w3-padding-jumbo">
				<p>
					<a href="#"><span>[잡담] 안녕...</span>에 댓글이 달렸습니다.</a>&nbsp;&nbsp;<a href="#"><i class="fa fa-close w3-margin-right"></i></a>
				</p>
				<p>
					<a href="#"><span>[잡담] 안녕...</span>에 댓글이 달렸습니다.</a>&nbsp;&nbsp;<a href="#"><i class="fa fa-close w3-margin-right"></i></a>
				</p>
				<p>
					<a href="#"><span>[잡담] 안녕...</span>에 댓글이 달렸습니다.</a>&nbsp;&nbsp;<a href="#"><i class="fa fa-close w3-margin-right"></i></a>
				</p>

			</div>
			<footer class="w3-container w3-padding-16 w3-padding-large">
				<div class="w3-right">
					<input class="w3-check" type="checkbox"> <label class="w3-validate">알림중지</label>
				</div>
			</footer>
		</div>
	</div>


	<!-- Footer -->
	<footer class="w3-container w3-padding-32 w3-light-grey w3-center">
		<h4>HipBus corp.</h4>
		<a href="#" class="w3-btn w3-padding w3-black w3-margin"> <i class="fa fa-arrow-up w3-margin-right"></i>To the top
		</a>
		<div class="w3-xlarge w3-section">
			<i class="fa fa-facebook-official w3-hover-text-indigo"></i> <i class="fa fa-instagram w3-hover-text-purple"></i> <i class="fa fa-snapchat w3-hover-text-yellow"></i> <i
				class="fa fa-pinterest-p w3-hover-text-red"
			></i> <i class="fa fa-twitter w3-hover-text-light-blue"></i> <i class="fa fa-linkedin w3-hover-text-indigo"></i>
		</div>
		<p>
			Powered by <a href="http://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a>
		</p>
	</footer>
	
</body>
