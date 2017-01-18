/**
 * main.jsp에 연결할 javascript.
 */
	
	// Slideshow
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
	
	// Accordions
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
	
	// 자동으로 슬라이드 넘기기
	$(document).ready(function(){
		
		setInterval(function() {
			$('#nextslide').trigger('click');	
		}, 1500);
	});
