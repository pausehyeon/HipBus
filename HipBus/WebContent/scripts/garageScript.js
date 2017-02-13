/**
 * public garage에 공통으로 들어가는 javascript
 */
var modifyerror = "글수정에 실패했습니다. \n잠시 후 다시 시도하세요.";
var writeerror = "글작성에 실패했습니다. \n잠시 후 다시 시도하세요.";


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

