<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<script src="/HipBus/scripts/bottomScript.js"></script>

<!-- 댓글 알람 -->
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript">
//<!--
var request = null;
var contentFix = null;
var itv = 0;
// 댓글목록 불러오기
	$(document).ready(function() {
		if(localStorage.getItem("alram") == "On"){
			 $('#alramOff').show();
				$('#alramOn').hide();
				alram();
		} else {
			var idvalue = document.getElementById("idvalue");
			$('#alramOn').show();
			$('#alramOff').hide();
			idvalue.innerHTML = "알림기능을 켜주세요.^^";
		}
	});
	function alram(){
			itv = setInterval(function(){ 
				replyResult();
			}, 1000);
	}
	function  replyResult() {
		var params = 'email=' + "${sessionScope.memEmail}"
					+ '&replynum=0';
		request = new Request(
				function() {
					var idvalue = document.getElementById("idvalue");
					var alramCount = document.getElementById("alramCount");
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var msg = "";
							var count = "";
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "select") {
								var data = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								//alert(data.length)
								if (data.length == 0) {
									msg += "<center>"
									msg += "알림이 없습니다.";
									msg += "</center>"									
									idvalue.innerHTML = msg;
								} else {
									count += eval("("
											+ xmldoc.getElementsByTagName("count")
													.item(0).innerHTML + ")");
																	
											alramCount.innerHTML = count;
											var deldiv = document
											.getElementById("board_" + data.replynum);
									while(idvalue.hasChildNodes()){
										idvalue.removeChild(idvalue.firstChild);
									}
									
								//	alert("1");
									for (var i = 0; i < data.length; i++) {
									//	alert("2");
										var newdiv = makeReply(data[i]);
										idvalue.appendChild(newdiv);
										
									}
								}
							} else if (code == "empty") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
								msg += message;
							}
						} else {
						}
					} else {
					}
				}, "replyAlertResult.do", "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}
function makeReply(data){
	var newdiv = document.createElement("div");
	newdiv.setAttribute("id", "board_" + data.replynum);
	var board = '';
	var categoryName = '';
	var category = data.category;
	var type = 1;
	switch( category ) {
	case 1 : categoryName = '비트'; type= category+1; break;
	case 2 : categoryName = '랩'; type= category+1; break;
	case 3 : categoryName = '믹스테잎'; type= category+1; break;
	case 4 : categoryName = '보컬'; type= category+1; break;
	case 5 : categoryName = '가사'; type= category+1; break;
	case 6 : categoryName = '자유'; type= category+1; break;
	}
	
			board += '<p>'
			board += '<a href="stationRead.do?num='+data.num+'&category='+data.category+'&type='+type+'"><span>['+categoryName+']'+ data.subject+'</span>에 댓글이 달렸습니다.</a>'
			board += '&nbsp;&nbsp;<a href="#"><i class="fa fa-hand-o-left w3-margin-right"></i></a>'
			board += '</p>'
	
				
	
	newdiv.innerHTML = board;
	newdiv.data += data;

	return newdiv;
}
function alramOff(){
	localStorage.removeItem("alram");
	var alramOff = document.getElementById( "alramOff" );
	 $('#alramOff').hide();
		$('#alramOn').show();
	localStorage.setItem("alram","Off");
	clearInterval(itv);
	var idvalue = document.getElementById("idvalue");
	var alramCount = document.getElementById("alramCount");
	idvalue.innerHTML = "알림기능을 켜주세요.^^";
	alramCount.innerHTML = '';
	
}
function alramOn(){
	localStorage.removeItem("alram");
	var alramOn = document.getElementById( "alramOn" );
	 $('#alramOn').hide();
		$('#alramOff').show();
	localStorage.setItem("alram","On");
	alram();
	
}
//-->
</script>
<body>
	<!-- 댓글 Alert   -->
	<div class="w3-container w3-margin-bottom w3-text-khaki" style="border: 1px solid transparent; ; float: left; width:85px;">
		<a href="#" onclick="document.getElementById('id01').style.display='block'" class="w3-bottom w3-left w3-padding-large w3-hover-opacity" title="실시간 댓글 알림"> <i class="fa fa-bell w3-xxlarge"></i><span
			class="w3-badge w3-red" id="alramCount"></span>
		</a>
	</div>
	
	<div style="border: 1px solid transparent; float: left; width: 40px;" id="mybusget">
		<a href="#" class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="myBusGet()" title="최근 방문한 bus로 이동합니다.">
		<img class="w3-circle" id="mybusImg" src=""> </a>
	</div>
	<div style="border: 1px solid transparent; float: left; width: 40px;" id="crewbusget">
		<a href="#" class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="crewBusGet()" title="최근 방문한 crewBus로 이동합니다.">
		<img class="w3-circle" id="crewbusImg" src=""></a>
	</div>
	<div style="border: 1px solid transparent; float: left; width: 40px;" id="boardget">
		<a href="#" class="w3-bottom w3-left w3-padding-large w3-hover-opacity" onclick="boardGet()" title="최근 방문한 게시판으로 이동합니다.">
		<img style="width:30px; height:35px;" class="w3-circle" src="${project}/view/img/board.jpg"></a>
	</div>
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-padding-32 w3-animate-top w3-card-8">
			<header class="w3-container w3-center">
				<span onclick="document.getElementById('id01').style.display='none'" class="w3-closebtn">&times;</span>
				<h4>
					<i class="fa fa-bell w3-xlarge"></i>&nbsp;실시간 댓글 확인
				</h4>
			</header>
			<div class="w3-container w3-padding-jumbo" id="idvalue">
			</div>
			<footer class="w3-container w3-padding-16 w3-padding-large">
				<div class="w3-right" id="alram">
				
				<a href="#" onClick="alramOff(); return false" style="text-decoration:none;" class="w3-xxlarge fa fa-toggle-on" id="alramOff"></a>
				<a href="#" onClick="alramOn(); return false"style="display:none; text-decoration:none; "class="w3-xxlarge fa fa-toggle-off" id="alramOn"></a>
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
