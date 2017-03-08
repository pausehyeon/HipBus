/**
 * public garage에 공통으로 들어가는 javascript
 */
var modifyerror = "글수정에 실패했습니다. \n잠시 후 다시 시도하세요.";
var writeerror = "글작성에 실패했습니다. \n잠시 후 다시 시도하세요.";
var deleteMsg = "게시글을 삭제하시겠습니까.?";
var writeMsg = "내용을 입력하세요.";
var searchMsg = "검색어를 입력하세요.";

//채널 아이디를 넘겨받아서 라이브 중인 채널의 썸네일을 출력해주는 function
function checkonair(channel_id, googleApiKey, url, nick){
	var params = "part=snippet&channelId="+channel_id+"&type=video&eventType=live&key="+googleApiKey;
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
							var publishedAt = jsonData.items[0].snippet.publishedAt;
							
							var msg = "";
							msg += "<div class='w3-col m4 l5  w3-padding-32 w3-theme-l5 w3-margin w3-hover-opacity' onclick='location=\""+url+"\"'>";
							msg += "	<div class='w3-display-container'>";
							msg += "		<img src='" + thumbnail + "' alt='thumbnail' style='width: 100%'>";
							msg += "		<div class='w3-padding w3-display-middle'>";
							msg += "			<a href='"+url+"'><i class='fa fa-play w3-xxlarge'></i></a>";
							msg += "		</div>";
							msg += "	</div>";
							msg += "	<p>"+ title +"</p>";
							msg += "	<p class='w3-center w3-tiny'> "+ nick +" | "+ publishedAt +" </p>";
							msg += "</div>";
							
							onairsection.innerHTML += msg;
							cnt++;
						}else{
							//라이브 방송 중이 아닌 경우
						}
						
						//if(cnt == 0){
							//onairloadingsection.innerHTML = '<p class="w3-center w3-cell-middle" style="font-weight: bold;">현재 방송 중인 채널이 없습니다.</p>';
						//}else{
							onairloadingsection.innerHTML = "";
						//}
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
	for(var i=0; i<channelsJson.length; i++){
		var channel_id = channelsJson[i].channel_id;
		var url = channelsJson[i].url;
		var nick = channelsJson[i].nick;
		checkonair(channel_id, googleApiKey, url, nick);
	}
}

//Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

function erroralert( msg ) {
	alert( msg );
	history.back();
}

function newsDeleteCheck(){
	var num = document.getElementById("num")
	 if( confirm( deleteMsg ) == true ){
		location.href="garageNewsDeletePro.do?num="+num.value;
	 }else{
		 location.reload(true);
	 }
	
}

function faqDeleteCheck(){
	   var num = document.getElementById("num");
	 if( confirm( deleteMsg ) == true ){
		location.href="garageFAQDeletePro.do?num="+num.value;
	 }else{
		 location.reload(true);
	 }
	
}

function search(){	
	
	if(! searchform.keyword.value){
		alert(searchMsg);
		searchform.keyword.focus();
		return false;
	}
	
}
