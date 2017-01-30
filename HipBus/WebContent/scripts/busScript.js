/**
 * mybus.jsp와 crewbus.jsp에 연결할 javascript.
 */

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


// myBusUpcomingWrite
// 글자크기 조절
function writeFont(){
	
	var sizeVal = ["10pt","12pt","14pt","16pt","24pt","36pt","50pt"]
	var size = [10,12,14,16,24,36,50]
	
		for (var i=0; i<sizeVal.length; i++){
			if(select.value == sizeVal[i]){
				$('#text1').each(function(index,item){
					index + $(item).css("font-size",size[i])	
				}
			);			
			}
		}
		
	}

// 글꼴
/*
function writeSize(){
	var font= ["궁서체","굴림체","고딕체","돋움체","comic Sans Ms","impact","gerogia","courier New"]
	
		for (var i=0; i<font.length; i++){
			if(select.value == font[i]){
				$('#text1').each(function(index,item){
					index + $(item).css("font-family",font[i])	
				}
			);			
			}
		}
	}
*/

// 글정렬
function leftAlign(){	
	$('#text1').css("text-align","left")	
}
function centerAlign(){
	$('#text1').css("text-align","center")	
}
function rightAlign(){
	$('#text1').css("text-align","right")	
}







