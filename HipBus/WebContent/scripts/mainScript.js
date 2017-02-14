/**
 * main.jsp에 연결할 javascript.
 */
var signuperror = "회원가입에 실패했습니다. \n잠시 후 다시 시도하세요.";
var signupok = "회원가입에 성공하였습니다. \n로그인 이용 후 사용 가능합니다!";

//Accordions
function myAccordion(id) {
	var x = document.getElementById(id);
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
		x.previousElementSibling.className += " w3-theme";
	} else {
		x.className = x.className.replace("w3-show", "");
		x.previousElementSibling.className = x.previousElementSibling.className
				.replace(" w3-theme", "");
	}
}

// Slideshow 관련 스크립트 단락. 공지사항이 있을 때만 적용
var slideIndex = 1;
function plusDivs(n) {
	showDivs(slideIndex += n);
}
function currentDiv(n) {
	showDivs(slideIndex = n);
}
function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("demodots");
	if (n > x.length) {
		slideIndex = 1
	}
	if (n < 1) {
		slideIndex = x.length
	}
	;
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" w3-white", "");
	}
	x[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " w3-white";
}


// 자동으로 슬라이드 넘기기
$(document).ready(function() {
	if($('#nextslide').length){
		//^ 만일 id=nextslide가 하나도 없으면 0. 즉 false
		setInterval(function() {
			$('#nextslide').trigger('click');
		}, 1500);
	}
});
