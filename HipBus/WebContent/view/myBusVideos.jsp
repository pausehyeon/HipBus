<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<script src="/HipBus/scripts/busScript.js"></script>
<script type="text/javascript">
//<!--
function Quest(){	// 주소창의 주소 가져와서 getParameter처럼 쓸 수 있게 하는 메소드
 var requestParam ="";
 //getParameter 펑션
  this.getParameter = function(param){
  //현재 주소를 decoding
  var url = unescape(location.href); 
  //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
   var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
 
   for(var i = 0 ; i < paramArr.length ; i++){
     var temp = paramArr[i].split("="); //파라미터 변수명을 담음
 
     if(temp[0].toUpperCase() == param.toUpperCase()){
       // 변수명과 일치할 경우 데이터 삽입
       requestParam = paramArr[i].split("=")[1]; 
       break;
     }
   }
   return requestParam;
 }
}


$(document).ready(
	function() {
		var quest = new Quest();
		if(quest.getParameter("nextPageToken")!=null) {		// 이전페이지에서 넘어온 경우
			loadVideos("${channelid}","${googleApiKey}",quest.getParameter("nextPageToken"));
		} else if(quest.getParameter("prevPageToken")!=null) {// 다음 페이지에서 넘어온 경우
			loadVideos("${channelid}","${googleApiKey}",quest.getParameter("prevPageToken"));
		} else {
			loadVideos("${channelid}","${googleApiKey}");
		}
		
	}
);


function loadVideos(channel_id, googleApiKey, pageToken){
	if(pageToken){
		var params = "pageToken="+pageToken+"&part=snippet&channelId="+channel_id+"&key="+googleApiKey;
	} else {
		var params = "part=snippet&channelId="+channel_id+"&key="+googleApiKey;
	}
	var request;
	request = new Request( function(){
				var videos = document.getElementById('videos');
				if(request.httpRequest.readyState == 4){
					if(request.httpRequest.status == 200){
						var jsonData = eval( "("+request.httpRequest.responseText.trim() +")");
						var video = null;
						if(jsonData.pageInfo.totalResults != 0){ // 동영상이 있는경우
							for(var i=0;i<jsonData.items.length;i++){
								var data = jsonData.items[i];
								
								video += '<div class="w3-col m4 l6 w3-padding-32">';
								video += '<iframe src="http://www.youtube.com/embed/'+data.id.videoId+'" frameborder="0" allowfullscreen></iframe>';
								video += '<p class="w3-center w3-tiny">${str_title}'+data.snippet.channelTitle+' ${str_writeDate}'+data.snippet.publishedAt+'</p>';
								video += '<h5>'+data.snippet.title+'</h5>';
								video += '</div><br>';
							}
							if(jsonData.nextPageToken && !jsonData.prevPageToken){
								video += '<div class="w3-row w3-center">';
								video += '<div class="w3-col w3-padding-12">'
								video += '<a class="w3-btn w3-hover-red w3-round" href="myBusVideos.do?driver=${driver}&nextPageToken='+jsonData.nextPageToken+'">▶</a>';
								video += '</div></div>';
							} else if(jsonData.prevPageToken && !jsonData.nextPageToken){
								video += '<div class="w3-row w3-center">';
								video += '<div class="w3-col w3-padding-12">'
								video += '<a class="w3-btn w3-hover-red w3-round" href="myBusVideos.do?driver=${driver}&prevPageToken='+jsonData.prevPageToken+'">◀</a>';
								video += '</div></div>';
							} else if(jsonData.nextPageToken && jsonData.prevPageToken){
								video += '<div class="w3-row w3-center">';
								video += '<div class="w3-col w3-padding-12">'
								video += '<a class="w3-btn w3-hover-red w3-round" href="myBusVideos.do?driver=${driver}&prevPageToken='+jsonData.prevPageToken+'">◀</a>';
								video += '<a class="w3-btn w3-hover-red w3-round" href="myBusVideos.do?driver=${driver}&nextPageToken='+jsonData.nextPageToken+'">▶</a>';
								video += '</div></div>';
							}
							videos.innerHTML += video;
						} else{ // 동영상이 없는경우
							video += '<p class="w3-center"> 영상이 없습니다. </p>';
							videos.innerHTML += video;
						}
						$('#console').empty();
					}else{
						$('#console').html("<p class='w3-center'> 오류 발생"+request.httpRequest.status+" </p>");
					}
				}else{
					$('#console').html("<img src='/HipBus/view/img/loading.gif' alt='로딩 중입니다' style='width:100px'>");
				}
			},
			"https://www.googleapis.com/youtube/v3/search", "GET", params);
	request.sendRequest();
}
//-->
</script>
<title>${str_mybusTitle}</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="../top.do"/>


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge" >
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa-list-ul"></i>&nbsp; ${nick} ${str_myVideos}
						</h3>
					</div>
					<div class="w3-row">
						<a href="myBus.do" class="w3-closebtn"><span>&times;</span></a>
					</div>
					<div class="w3-row-padding w3-center w3-theme-l5" id="videos"></div>
					<div id="console"></div>
				</div>
			<!-- 여기까지 -->
			<!-- End Middle Column -->
			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do"/>

</body>
</html>
