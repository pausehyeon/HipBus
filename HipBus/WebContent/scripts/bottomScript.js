/**
 * 
 */



function set(){
	var a = document.location.href;
		if( a != ""){
			localStorage.setItem("myBus1",a);
		}
	
} 
function get(){
	driver = localStorage.getItem("myBus1");

		location.href=driver;
	}