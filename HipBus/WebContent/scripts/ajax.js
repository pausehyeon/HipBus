/**
 * JSON 표기법으로 바꾼 xmlHttpRequest 모듈
 */

function Request( callback, url, method, params){
	this.httpRequest = null;
	this.callback = callback;
	this.url = url;
	this.method = method;
	this.params = params;	
}

Request.prototype = {
	getXMLHttpRequest : function(){
		if(window.ActiveXObject){
			//IE인 경우
			try{
				this.httpRequest = new ActiveXObject("Msxml2.XMLHTTP");				
			}catch(e){
				this.httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}else{
			//IE 이외의 브라우저인 경우
			this.httpRequest = new XMLHttpRequest();
		}
	},
	sendRequest : function(){
		this.getXMLHttpRequest();
		
		//callback
		this.httpRequest.onreadystatechange = this.callback;
		//method
		var httpMethod = ( this.method ? this.method : "GET" );
		if(httpMethod != "POST" && httpMethod != "GET"){			//잘못된 문자열 입력했을 때는 그냥 GET방식.
			httpMethod = "GET";
		}
		
		//params
		var httpParams = (this.params == null || this.params == ""? null : encodeURI(this.params));
		
		//url
		var httpUrl = ( httpMethod == "GET" ? this.url+"?"+httpParams : this.url);
		
		this.httpRequest.open(httpMethod, httpUrl, true);
		this.httpRequest.setRequestHeader( "content-type", "application/x-www-form-urlencoded");
		this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
	}
};

