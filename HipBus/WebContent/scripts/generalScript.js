/**
 * 
 */

function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";"
}

function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) { 
		offset = document.cookie.indexOf(search);
		if (offset != -1) { 
			offset += search.length; 
			end = document.cookie.indexOf(";", offset);
														
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}

function sendit() {
	var id = loginCheckForm.email.value;
	
	if (loginCheckForm.rememberMe.checked) {
		setCookie("id", id, 999);
	} else{
		setCookie("id", id, 0);
	}

}


function sendId() {
	var id = signInForm.email.value;
	
	if (signInForm.rememberMe.checked) {
		setCookie("id", id, 999);
	} else{
		setCookie("id", id, 0);
	}

}
$(document).ready(
		function() {
			
			if (!sessionStorage.getItem("myBus")) {
				$('#mybusget').hide();
			} else {
				$('#mybusget').show();
			}

			if (!sessionStorage.getItem("crewBus")) { 	
				$('#crewbusget').hide();
			} else {
				$('#crewbusget').show();
			}
			

			if (!sessionStorage.getItem("board")) {
				$('#boardget').hide();
			} else {
				$('#boardget').show();
			}
			
			var myBusImgLocation = sessionStorage.getItem("myBusImg");
			$('#mybusImg').attr({
				src : myBusImgLocation,
				width : 32,
				height : 35
			});

			var crewBusImgLocation = sessionStorage.getItem("crewBusImg");
			$('#crewbusImg').attr({
				src : crewBusImgLocation,
				width : 32,
				height : 35
			});
			
		var garageImg = "http://localhost:8080/HipBus/view/img/garage.png";
			var stationImg = "http://localhost:8080/HipBus/view/img/station.png";
			var boardSrc = sessionStorage.getItem("board");
			if (boardSrc) {
				if (boardSrc.indexOf('station') == -1) {
					$('#boardImg').attr({
						src : garageImg,
						width : 35,
						height : 38
					});

				} else {
					$('#boardImg').attr({
						src : stationImg,
						width : 38,
						height : 42
					});

				}
			}

			
	});
