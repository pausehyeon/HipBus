/**
 * main.jsp에 연결할 javascript.
 */
var signuperror = "회원가입에 실패했습니다. \n잠시 후 다시 시도하세요.";
var signupok = "회원가입에 성공하였습니다. \n입력하신 이메일로 인증 후 로그인 가능합니다!";

//Accordions
function myAccordion(id) {
	var x = document.getElementById(id);
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		x.previousElementSibling.className += " w3-theme";
	} else {
		x.className = x.className.replace("w3-show", "");
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace(" w3-theme", "");
	}
}
// Slideshow 관련 스크립트 단락. 공지사항이 있을 때만 적용
var slideIndex = 1;
function plusDivs(n) {
	showDivs(slideIndex += n);
}
function currentDiv(n) {
	showDivs(slideIndex = n);
}
function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("demodots");
	if (n > x.length) {
		slideIndex = 1
	}
	if (n < 1) {
		slideIndex = x.length
	}
	;
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" w3-white", "");
	}
	x[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " w3-white";
}



//채널 아이디를 넘겨받아서 라이브 중인 채널의 썸네일을 출력해주는 function
function checkonair(channelId, googleApiKey){
	var params = "part=snippet&channelId="+channelId+"&type=video&eventType=live&key="+googleApiKey;
	var request;
	request = new Request( function(){
				var onairsection = document.getElementById('onairsection');
				var onairloadingsection = document.getElementById('onairloadingsection');
				var cnt = 0;
				if(request.httpRequest.readyState == 4){
					if(request.httpRequest.status == 200){
						var jsonData = eval( "("+request.httpRequest.responseText.trim() +")");
						if(jsonData.pageInfo.totalResults != 0){
							//라이브 방송중인 경우
							//var videoId = jsonData.items[0].id.videoId;
							var title = jsonData.items[0].snippet.title;
							var thumbnail = jsonData.items[0].snippet.thumbnails.high.url;
							
							var msg = "";
							msg += "<div class='w3-col l3 m6 w3-margin-bottom'>";
							msg += "	<div class='w3-display-container'>";
							msg += "		<div class='w3-display-topleft w3-black w3-padding'>"+title+"</div>";
							msg += "		<img src='"+thumbnail+"' alt='thumbnail' style='width: 100%'>";
							msg += "	</div>";
							msg += "</div>";
							
							onairsection.innerHTML += msg;
							cnt++;
						}else{
							//라이브 방송 중이 아닌 경우
						}
						
						if(cnt == 0){
							onairloadingsection.innerHTML = "<p class='w3-center'>현재 방송 중인 채널이 없습니다.</p>";
						}else{
							onairloadingsection.innerHTML = "";
						}
					}else{
						onairloadingsection.innerHTML = "<p class='w3-center'> 오류 발생"+request.status+" </p>";
					}
				}else{
					onairloadingsection.innerHTML = "<img src='/HipBus/view/img/loading.gif' alt='로딩 중입니다' style='width:100px;'>";
				}
			},
			"https://www.googleapis.com/youtube/v3/search",
			"GET",
			params);
	request.sendRequest();
}

//채널 목록 받아와서 checkonair()에 출력을 요청
function getonairlist(channelsJson, googleApiKey){
//	var channelsJson = eval("${channelsJson}");
	for(var i=0; i<channelsJson.length; i++){
		var channel_id = channelsJson[i].channel_id;
		var driver = channelsJson[i].driver;
		checkonair(channel_id, googleApiKey);
	}
}


$(document).ready(function() {	
	// 자동으로 슬라이드 넘기기
	if($('#nextslide').length){
		//^ 만일 id=nextslide가 하나도 없으면 0. 즉 false
		setInterval(function() {
			$('#nextslide').trigger('click');
		}, 1500);
	}

});
