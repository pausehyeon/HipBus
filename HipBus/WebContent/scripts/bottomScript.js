/**
 * 
 */

function myBusSet() {
	var myBusDriver = document.location.href;
	if (myBusDriver != "") {
		localStorage.setItem("myBus", myBusDriver);
	}

}
function myBusGet() {
	var myBusDriver = localStorage.getItem("myBus");
	location.href = myBusDriver;
}

function crewBusSet() {
	var crewBusDriver = document.location.href;
	if (crewBusDriver != "") {
		localStorage.setItem("crewBus", crewBusDriver);
	}

}

function crewBusGet() {
	var crewBusDriver = localStorage.getItem("crewBus");
	location.href = crewBusDriver;
}

function boardSet(){
	var boardSrc = document.location.href;
	if	(board != ""){
		loaclStorage.setItem("board",boardSrc);
	}
	
}

function boardGet(){
	var boardSrc = loaclStorage.getItem("board");
	loaction.href= boardSrc;
}