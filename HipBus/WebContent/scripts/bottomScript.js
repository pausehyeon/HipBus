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
	

	
		var crewBusImgLocation = sessionStorage.getItem("crewBusImg");
		$('#crewbusImg').attr({
			src : crewBusImgLocation,
			width : 30,
			height : 35
		});


	
		
});


function myBusSet() {
	var myBusDriver = document.location.href;
	var myBusImgLocation = document.getElementById("myBusLeftImg").src;
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
	// crewBusLeft img태그에 id="crewBusLeftImg" 줄것
	var crewBusDriver = document.location.href;
	var crewBusImgLocation = document.getElementById("crewBusLeftImg").src;
	if (crewBusDriver != "") {
		sessionStorage.setItem("crewBus", crewBusDriver);
		sessionStorage.setItem("crewBusImg",crewBusImgLocation);
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
