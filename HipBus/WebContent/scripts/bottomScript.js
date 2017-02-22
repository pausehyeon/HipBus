/**
 * 
 */

$(document).ready(function() {
	
	if (!localStorage.getItem("myBus")) {
		$('#mybusget').hide();
	} else {
		$('#mybusget').show();
	}

	if (!localStorage.getItem("crewBus")) { 	
		$('#crewbusget').hide();
	} else {
		$('#crewbusget').show();
	}
	

	if (!localStorage.getItem("board")) {
		$('#boardget').hide();
	} else {
		$('#boardget').show();
	}

	if (myBusImgLocation != "") {
		var myBusImgLocation = localStorage.getItem("myBusImg");
		$('#mybusImg').attr({
			src : myBusImgLocation,
			width : 30,
			height : 35
		});
	}
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
	//var memEmail = document.getElementById("getMemEmail").value
	if ( myBusDriver !="" ) {
		
		localStorage.setItem("myBus", myBusDriver);
		localStorage.setItem("myBusImg", myBusImgLocation);
	}

}
function myBusGet() {
	var myBusDriver = localStorage.getItem("myBus");
	location.href = myBusDriver;
}

function crewBusSet() {
	var crewBusDriver = document.location.href;
	//var crewBusImgLocation = document.getElementById("crewBusLeftImg").src;
	if (crewBusDriver != "") {
		localStorage.setItem("crewBus", crewBusDriver);
		//localStroage.setItem("crewBusImg",crewBusImgLocation);
	}

}

function crewBusGet() {
	var crewBusDriver = localStorage.getItem("crewBus");
	location.href = crewBusDriver;
}

function boardSet() {
	var boardSrc = document.location.href;
	if (boardSrc != "") {
		localStorage.setItem("board", boardSrc);
	}

}

function boardGet() {
	var boardSrc = localStorage.getItem("board");
	location.href = boardSrc;
}