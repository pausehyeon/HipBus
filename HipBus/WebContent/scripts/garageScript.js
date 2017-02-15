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


function newsDeleteCheck(){
	var num = document.getElementById("num")
	 if( confirm(" 정말 삭제하시겠습니까?" ) == true ){
		location.href="garageNewsDeletePro.do?num="+num.value;
	 }else{
		 location.reload(true);
	 }
	
}

function faqDeleteCheck(){
	   var num = document.getElementById("num");
	 if( confirm(" 정말 삭제하시겠습니까?" ) == true ){
		location.href="garageFAQDeletePro.do?num="+num.value;
	 }else{
		 location.reload(true);
	 }
	
}

function newsWriteCheck(){
	 var data = CKEDITOR.instances.editor.getData();
	if(data == "" ){
		alert("내용을 입력하세요");
		return false;
	}
}

function faqWriteCheck(){
	 var data = CKEDITOR.instances.editor.getData();
	if(data == "" ){
		alert("내용을 입력하세요");
		return false;
	}
}
