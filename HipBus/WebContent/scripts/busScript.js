/* 아이피바꿔주세요!!!!!!!!!!!!! */
var serverIP = "192.168.20.101";

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
function playonair(channel_id, googleApiKey) {
	var params = "part=id&channelId=" + channel_id
			+ "&type=video&eventType=live&key=" + googleApiKey;
	var request;
	request = new Request(
			function() {
				var onair = document.getElementById('onair');
				var onairchat = document.getElementById('onairchat');
				var console = document.getElementById('oaconsole');
				var cnt = 0;
				if (request.httpRequest.readyState == 4) {
					if (request.httpRequest.status == 200) {
						var jsonData = eval("("	+ request.httpRequest.responseText.trim() + ")");

						var video = "";
						var chat = "";
						
						if (jsonData.pageInfo.totalResults != 0) { // 라이브 방송중인경우
							var videoId = jsonData.items[0].id.videoId;
							video += '<iframe style="width: 100%; height: 360px" src="https://www.youtube.com/embed/'
									+ videoId
									+ '" frameborder="0" allowfullscreen></iframe>';
							onair.innerHTML += video;
							chat += '<iframe style="width: 100%; height: 360px" src="https://www.youtube.com/live_chat?v='
								+ videoId
								+ '&embed_domain='+serverIP+'" frameborder="0" allowfullscreen></iframe>';

							onairchat.innerHTML = chat;
							cnt++;
							
						} else {
							// 라이브 방송 중이 아닌 경우
							video += '<iframe style="width: 100%; height: 360px" src="http://www.youtube.com/embed/live_stream?channel='
								+ channel_id
								+ '" frameborder="0" allowfullscreen></iframe>';
							onair.innerHTML += video;
						}
 
						if (cnt == 0) {
							onairchat.innerHTML = "<p class='w3-center'><br><br><br><br><br><br>방송중인 영상이 없습니다.</p>";
						}
					}else{
						onair.innerHTML = "<p class='w3-center'> 유효하지 않은 채널아이디입니다. <br> 확인 후 수정해주세요! <br></p>"
										+ "<a href='https://www.youtube.com/account_advanced'>채널아이디 확인하러가기</a> ";
					}
				} else {
					onairchat.innerHTML = "<img src='/HipBus/view/img/loading2.gif' alt='로딩 중입니다' style='width:100px;'>";
				}
			}, "https://www.googleapis.com/youtube/v3/search", "GET", params);
	request.sendRequest();
}

// google Map
var geocoder;
var map;
function initMap() {
	geocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(37.5580798, 126.9255336);
	var mapOptions = {
		zoom : 15,
		center : latlng
	}
	map = new google.maps.Map(document.getElementById("map"), mapOptions);
}

function codeAddress() {
	var address = document.writeform.placeToSearch.value;
	geocoder
			.geocode(
					{
						'address' : address
					},
					function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							map.setCenter(results[0].geometry.location);
							var marker = new google.maps.Marker({
								map : map,
								position : results[0].geometry.location
							});
							document.writeform.perf_place.value = results[0].place_id
									+ '@' + results[0].formatted_address;
							document.writeform.showSearchResult.value = results[0].formatted_address;
						} else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
							alert("'" + address + "'의 검색결과가 없습니다.");
						} else {
							alert("잠시 후 다시 시도해주세요. ( status : " + status + ")");
						}
					});
}

function geocodePlaceId(geocoder, map, infowindow) {
	var placeId = '${perf_place}'
	geocoder.geocode({
		'placeId' : placeId
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				map.setZoom(11);
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				infowindow.setContent(results[0].formatted_address);
				infowindow.open(map, marker);
			} else {
				window.alert('No results found');
			}
		} else {
			window.alert('Geocoder failed due to: ' + status);
		}
	});
}
