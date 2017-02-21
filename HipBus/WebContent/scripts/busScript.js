/**
 * mybus.jsp와 crewbus.jsp에 연결할 javascript.
 */

var str_insertSuccess = "글이 게시되었습니다.";
var str_insertFail = "게시에 실패했습니다. 잠시 후 다시 시도해주세요."
var str_deleteSuccess = "글이 삭제되었습니다.";
var str_deleteFail = "삭제에 실패했습니다. 잠시 후 다시 시도해주세요."
var str_modifySuccess = "글을 성공적으로 수정했습니다.";
var str_modifyFail = "수정에 실패했습니다. 잠시 후 다시 시도해주세요.";
var signouterror = "회원탈퇴에 실패했습니다. \n잠시 후 다시 시도해 주세요.";
var signoutok = "회원탈퇴에 성공하였습니다.";
var signoutpasswderror = "입력하신 비밀번호가 다릅니다. \n비밀번호를 다시 확인 해 주세요.";

// Accordion
function myFunction(id) {
	var x = document.getElementById(id);
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		x.previousElementSibling.className += " w3-theme-d1";
	} else {
		x.className = x.className.replace("w3-show", "");
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace(" w3-theme-d1", "");
	}
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
	var x = document.getElementById("navDemo");
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
	} else {
		x.className = x.className.replace(" w3-show", "");
	}
}


// youtube
function playonair(channel_id, googleApiKey){
	var params = "part=snippet&channelId="+channel_id+"&type=video&eventType=live&key="+googleApiKey;
	var request;
	request = new Request( function(){
				var onair = document.getElementById('onair');
				var onairchat = document.getElementById('onairchat');
				var console = document.getElementById('oaconsole');
				var cnt = 0;
				if(request.httpRequest.readyState == 4){
					if(request.httpRequest.status == 200){
						var jsonData = eval( "("+request.httpRequest.responseText.trim() +")");

						var video = "";
						var chat = "";
						video += '<iframe style="width: 100%; height: 360px" src="http://www.youtube.com/embed/live_stream?channel='+ channel_id +'" frameborder="0" allowfullscreen></iframe>';
						onair.innerHTML += video;
							
						if(jsonData.pageInfo.totalResults != 0){ //라이브 방송중인 경우
							var videoId = jsonData.items[0].id.videoId;
							chat += '<iframe style="width: 100%; height: 360px" src="https://www.youtube.com/live_chat?v='+videoId+'&embed_domain=localhost" frameborder="0" allowfullscreen></iframe>';
							
							onairchat.innerHTML += chat;
							cnt++;
						} else{
							//라이브 방송 중이 아닌 경우
						}
						
						if(cnt == 0){
							onairchat.innerHTML = "<p class='w3-center'>방송중인 영상이 없습니다.</p>";
						}else{
							onairchat.innerHTML = "";
						}
					}else{
						onairchat.innerHTML = "<p class='w3-center'> 오류 발생"+request.status+" </p>";
					}
				}else{
					onairchat.innerHTML = "<img src='/HipBus/view/img/loading.gif' alt='로딩 중입니다' style='width:100px;'>";
				}
			},
			"https://www.googleapis.com/youtube/v3/search",
			"GET",
			params);
	request.sendRequest();
}