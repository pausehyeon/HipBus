/**
 * public garage에 공통으로 들어가는 javascript
 */

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

function msg_login(){
	
	alert("글읽기 권한이 없습니다. 로그인 후 이용해주세요.");
}