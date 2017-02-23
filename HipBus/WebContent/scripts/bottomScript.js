/**
 * 
 */

$(document).ready(function() {	
	
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
			width : 30,
			height : 35
		});
	
/*
	if (crewBusImgLocation != "") {
		var crewBusImgLocation = localStorage.getItem("crewBusImg");
		$('#crewbusImg').attr({
			src : crewBusImgLocation,
			width : 30,
			height : 35
		});
	}
*/
	
		
});


function myBusSet() {
	var myBusDriver = document.location.href;
	var myBusImgLocation = document.getElementById("myBusLeftImg").src;
	//var src = "http://localhost:8080/HipBus/myBus.do?driver="+memEmail;
	if ( myBusDriver !="" ) {
		sessionStorage.setItem("myBus", myBusDriver);
		sessionStorage.setItem("myBusImg", myBusImgLocation);
		
	}
	
}	
function myBusGet() {
	var myBusDriver = sessionStorage.getItem("myBus");

	location.href = myBusDriver;
}

function crewBusSet() {
	var crewBusDriver = document.location.href;
	//var crewBusImgLocation = document.getElementById("crewBusLeftImg").src;
	if (crewBusDriver != "") {
		sessionStorage.setItem("crewBus", crewBusDriver);
		//localStroage.setItem("crewBusImg",crewBusImgLocation);
	}

}

function crewBusGet() {
	var crewBusDriver = sessionStorage.getItem("crewBus");
	location.href = crewBusDriver;
}

function boardSet() {
	var boardSrc = document.location.href;
	if (boardSrc != "") {
		sessionStorage.setItem("board", boardSrc);
	}

}

function boardGet() {
	var boardSrc = sessionStorage.getItem("board");
	location.href = boardSrc;
}
