/**
 * main station에 연결할 javascript.
 */
var writeerror = "글작성에 실패했습니다. \n잠시 후 다시 시도하세요.";
var modifyerror = "글수정에 실패했습니다. \n잠시 후 다시 시도하세요.";
var deleteok = "게시글을 삭제하시겠습니까?";
var deleteerror = "글삭제 실패했습니다.\n잠시 후 다시 시도하세요.";
var contentnull = "글내용이 없습니다.\n내용을 입력 하세요.";
var back = "목록으로 돌아가시겠습니까?\n작성된 내용은 삭제됩니다.";
var likeok = "추천 하시겠습니까?";
var likeconfirm = "이미 추천하셨습니다.";
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

function alertgo() {
	var retVal = confirm( deleteok );
	   if( retVal == true ){
		   location.href="stationDeletePro.do?num="+readform.num.value;
	   }else{
		   location.href="stationRead.do?num="+readform.num.value+"&pageNum="+readform.pageNum.value+"category="+readform.category.value+"&type="+readform.type.value;
	   }
}


function backAlert() {
	return confirm( back );
}