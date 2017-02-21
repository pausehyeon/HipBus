<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="/HipBus/scripts/stationScript.js"></script>
<script type="text/javascript" src="/HipBus/scripts/ajax.js"></script>
<script type="text/javascript">
	var request = null;
	var contentFix = null;
	// 댓글목록 불러오기
	$(document).ready(function() {
		loadBoard();
	});

	function loadBoard() {
		var params = 'num=' + "${num}";
		request = new Request(
				function() {
					var result = document.getElementById("result");
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var msg = "";
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "selected") {
								var data = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								if (data.length == 0) {
									msg += "<center>"
									msg += "현재 댓글이 없습니다.";
									msg += "</center>"
									$('#boardInfo').html(msg);
								} else {
									for (var i = 0; i < data.length; i++) {
								
										var newdiv = makeBoard(data[i]);
										result.appendChild(newdiv);
									}
								}
							} else if (code == "empty") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
								msg += message;
							}
						} else {
						}
					} else {
					}
				}, "stationReplyListResult.do", "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}

	// div 만들어서 붙이기
	function makeBoard(data) {
		var newdiv = document.createElement("div");
		newdiv.setAttribute("id", "board_" + data.replynum);
		var modBtn = '';
		var board = '';
		var reboard = '';
		modBtn += '<button type="button" id="replyComplete" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="modComplete('
				+ data.replynum + ')">';
		modBtn += '<i class="fa fa-check"></i>';
		modBtn += '</button>';
		modBtn += "<button type=\"button\" id='replyCancel' class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"modCancel("
				+ data.replynum + ",\'" + data.content + "\','creteria')\">";
		modBtn += '<i class="fa fa-times"></i>';
		modBtn += '</button>';

		board += '<div class="w3-card-8 w3-margin w3-padding-xlarge w3-padding-64">';
		board += '<div class="w3-container w3-row">';
		board += '<div class="w3-col m1 w3-center">';
		board += '	<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">';
		board += '</div>';
		board += '<div class="w3-col m11 w3-center">';
		board += '<div class="w3-harf w3-container w3-large w3-left">';
		board += data.email + '&nbsp;' + data.reg_date;
		board += '</div>';
		board += '<div class="w3-harf w3-container w3-padding-4 w3-right">';
		if (data.email == "${sessionScope.memEmail}") {
			board += '<a href="#" onClick="modBoardView('
					+ data.replynum
					+ '); return false" id="modView" class="w3-margin-right">${str_modify}</a>';
			board += '<a href="#" onClick="delComplete('
					+ data.replynum
					+ '); return false"   id="delBoard" class="w3-margin-right">${str_delete}</a>';
			board += modBtn;
		}
		board += '<a href="#" onClick="reBoardView(' + data.replynum +','
			  + data.ref_num + ',' + data.re_step				
		      + '); return false" id="reBoard">${str_reply}</a>';
		board += '</div>';
		board += '<div class="w3-container w3-left-align">';
		board += '<input type="hidden" name="'+ data.replynum +'">';
		board += '<textarea readonly="true" wrap="VIRTUAL" style="resize:none; width:100%;' 
			  + 'height:4000; border:0;overflow-y:hidden;background:clear;">'
			  + data.content +'</textarea>'
		board += '</div>';
		board += '<div id="replyBoardABC_'+data.replynum+'">';
		board += '</div>';
		board += '</div>';
		board += '</div>';
		board += '</div>';
		
		
		newdiv.innerHTML = board;
		newdiv.data += data;

		return newdiv;
	}
	
	// 댓글 삽입
	function boardAppend() {
		var params = 'num=' + "${num}" // 버스주인 이메일 혹은 크루아이디
				+ '&email=' + "${sessionScope.memEmail}" // 세션에 저장된 작성자 이메일
				+ '&content=' + $('input[name=content]').val(); // 본문 입력내용
		request = new Request(
				function() {
					var result = document.getElementById("result");
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "inserted") {
								var data = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								var newdiv = makeBoard(data);
								$('#boardInfo').html("");
								if (result.firstChild != null) {
									var oldFirstChild = result.firstChild;
									result.insertBefore(newdiv, oldFirstChild);
								}
								if (result.firstChild == null) {
									result.appendChild(newdiv);
								}
								$('input[name=content]').val("");
								alert("글이 등록되었습니다.")
							} else if (code == "failed") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
							}
						} else {

						}
					} else {

					}
				}, 'stationReplyAppendResult.do', 'POST', params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}
	function Likego() {
		var retVal = confirm(likeok);
		if (retVal == true) {
			location.href = "stationLikePro.do?num=" + "${article.num}";
		} else {
			location.href = "stationRead.do?num=" + readform.num.value
					+ "&pageNum=" + readform.pageNum.value + "category="
					+ readform.category.value + "&type=" + readform.type.value;
		}
	}
	// 리댓글
	function reBoardView(replynum,ref_num,re_step){
		//var replyBoard = document.getElementById("replyBoardABC_"+replynum);
		reloadBoard(ref_num);
	}
	function reMakeBoard(data) {
		var renewdiv = document.createElement("div");
		renewdiv.setAttribute("id", "reboard_" + data.replynum);
		var modBtn = '';
		var reboard = '';
		modBtn += '<button type="button" id="replyComplete" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="modComplete('
			+ data.replynum + ')">';
		modBtn += '<i class="fa fa-check"></i>';
		modBtn += '</button>';
		modBtn += "<button type=\"button\" id='replyCancel' class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"modCancel("
				+ data.replynum + ",\'" + data.content + "\','creteria')\">";
		modBtn += '<i class="fa fa-times"></i>';
		modBtn += '</button>';
		
		
		reboard += '<div class="w3-row-padding w3-padding-32 w3-row">'
		reboard += '<div class="w3-col m1">'
		reboard += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">'
		reboard += '</div>'
		reboard += '<div class="w3-col m7">'
		reboard += '<input name="recontent" type="text" required class="w3-input w3-border w3-padding-5" style="height: 50px">'
		reboard += '</div>'
		reboard += '<div class="w3-col m2">'
		reboard += '<input type="button" onclick="boardAppend()" value="${btn_register}" class="w3-btn-block w3-theme-d1" style="height: 50px">'
		reboard += '</div>'
		reboard += '</div>'
		
		reboard += '<div class="w3-card-8 w3-margin w3-padding-xlarge w3-padding-64">';
		reboard += '<div class="w3-container w3-row">';
		reboard += '<div class="w3-col m1 w3-center">';
		reboard += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">';
		reboard += '</div>';
		reboard += '<div class="w3-col m11 w3-center">';
		reboard += '<div class="w3-harf w3-container w3-large w3-left">';
		reboard += data.email + '&nbsp;' + data.reg_date;
		reboard += '</div>';
		reboard += '<div class="w3-harf w3-container w3-padding-4 w3-right">';
		
	 	if (data.email == "${sessionScope.memEmail}") {
			reboard += '<a href="#" onClick="modBoardView('
					+ data.replynum
					+ '); return false" id="remodView" class="w3-margin-right">${str_modify}</a>';
			reboard += '<a href="#" onClick="delComplete('
					+ data.replynum
					+ '); return false"   id="redelBoard" class="w3-margin-right">${str_delete}</a>';
			reboard += modBtn;
		} 
		reboard += '</div>';
		reboard += '<div class="w3-container w3-left-align">';
	 	reboard += '<input type="hidden" name="'+ data.replynum +'">';	
		reboard += '<textarea readonly="true" wrap="VIRTUAL" style="resize:none; width:100%;' 
				+ 'height:4000; border:0;overflow-y:hidden;background:clear;">'
				+ data.content +'</textarea>'
	 	reboard += '</div>';
		reboard += '</div>';
		reboard += '</div>';
		reboard += '</div>';
		renewdiv.innerHTML = reboard;
		renewdiv.data += data;

		return renewdiv;
	}
	
	function reloadBoard(ref_num) {
		var params = 'ref_num=' + ref_num;
		request = new Request(
				function() {
					var infResult = document.getElementById("replyBoardABC_"+ref_num);
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var msg = "";
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "selected") {
								var data = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								if (data.length == 0) {
									msg += "<center>"
										msg += '<div class="w3-row-padding w3-padding-32 w3-row">'
										msg += '<div class="w3-col m1">'
										msg += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">'
										msg += '</div>'
										msg += '<div class="w3-col m7">'
										msg += '<input name="recontent" type="text" required class="w3-input w3-border w3-padding-5" style="height: 50px">'
										msg += '</div>'
										msg += '<div class="w3-col m2">'
										msg += '<input type="button" onclick="boardAppend()" value="${btn_register}" class="w3-btn-block w3-theme-d1" style="height: 50px">'
										msg += '</div>'
										msg += '</div>'
									msg += "현재 댓글이 없습니다.";
									msg += "</center>"
									infResult.innerHTML = msg;
								} else {
									for (var i = 0; i < data.length; i++) {
										var renewdiv = reMakeBoard(data[i]);
										infResult.appendChild(renewdiv);
									}
								}
							} else if (code == "empty") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
								msg += message;
							}
						} else {
						}
					} else {
					}
				}, "stationInfReplyListResult.do", "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}
	// 댓글 수정
	function modBoardView(replynum) {
		$('#board_' + replynum + ' textarea').prop('readonly', false);
		$('#board_' + replynum + ' #modView').hide();
		$('#board_' + replynum + ' #delBoard').hide();
		$('#board_' + replynum + ' #reBoard').hide();
		$('#board_' + replynum + ' #replyComplete').show();
		$('#board_' + replynum + ' #replyCancel').show();
		$('#board_' + replynum + ' textarea').focus();
	}

	function modCancel(replynum, content, criteria) { // 이전 데이터 저장해서 다시 띄움
		if (criteria) {
			if (!$('input[name=' + replynum + ']').prop("content")) {
				$('input[name=' + replynum + ']').prop("content", content);
				$('#board_' + replynum + ' textarea').val(
						$('input[name=' + replynum + ']').prop("content"));
			} else {
				$('#board_' + replynum + ' textarea').val(
						$('input[name=' + replynum + ']').prop("content"));
			}
		} else {
			$('input[name=' + replynum + ']').prop("content", content);
			$('#board_' + replynum + ' textarea').val(
					$('input[name=' + replynum + ']').prop("content"));
		}

		$('#board_' + replynum + ' textarea').prop('readonly', true);
		$('#board_' + replynum + ' #modView').show();
		$('#board_' + replynum + ' #delBoard').show();
		$('#board_' + replynum + ' #reBoard').show();
		$('#board_' + replynum + ' #replyComplete').hide();
		$('#board_' + replynum + ' #replyCancel').hide();
	}

	function modComplete(replynum) {
		var params = 'replynum=' + replynum + '&content='
				+ $('#board_' + replynum + ' textarea').val();
		request = new Request(
				function() {
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "updated") {
								var data = xmldoc.getElementsByTagName("data")
										.item(0).innerHTML;
								alert("성공적으로 수정되었습니다.");
							} else if (code == "failed") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;

							}
							modCancel(replynum, data);
						} else {

						}
					} else {

					}
				}, 'stationReplyModifyResult.do', "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}

	// 댓글 삭제
	function delComplete(replynum) {
		var retVal = confirm("삭제 하시겠습니까?");
		if (retVal == true) {
			var params = "replynum=" + replynum;
			request = new Request(
					function() {
						var result = document.getElementById("result");
						var msg = "";
						if (request.httpRequest.readyState == 4) {
							if (request.httpRequest.status == 200) {
								var xmldoc = request.httpRequest.responseXML;
								var code = xmldoc.getElementsByTagName("code")
										.item(0).innerHTML;
								if (code == "deleted") {
									var replynum = eval("("
											+ xmldoc.getElementsByTagName(
													"data").item(0).innerHTML
											+ ")");
									var deldiv = document
											.getElementById("board_" + replynum);
									result.removeChild(deldiv);
									alert("성공적으로 삭제하였습니다.");
									if(data.length > 1){
										msg += "<center>"
										msg += "현재 댓글이 없습니다.";
										msg += "</center>"
										$('#boardInfo').html(msg);
									}
								} else if (code == "failed") {
									msg += xmldoc.getElementsByTagName(
											"message").item(0).innerHTML;
								} else if (code == "no") {
									alert("댓글이 있는글은 삭제할수없습니다.");
								}

							} else {

							}
						} else {

						}
					}, "stationReplyDeleteResult.do", "POST", params);
			request.getXMLHttpRequest();
			request.sendRequest();
		} else {
			location.href = "stationRead.do?num=" + readform.num.value
					+ "&pageNum=" + readform.pageNum.value + "category="
					+ readform.category.value + "&type=" + readform.type.value;
		}
	}
//-->
</script>


<title>${str_title}</title>
<body>

	<c:import url="../top.do" />

	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<%@ include file="navbar_station.jsp"%>
		<div class="w3-row w3-container" style="margin-top: 64px">
			<c:choose>
				<c:when test="${article.category == 1}">
					<h3>${str_beat}</h3>
				</c:when>
				<c:when test="${article.category == 2}">
					<h3>${str_rab}</h3>
				</c:when>
				<c:when test="${article.category == 3}">
					<h3>${str_mixTape}</h3>
				</c:when>
				<c:when test="${article.category == 4}">
					<h3>${str_vocal}</h3>
				</c:when>
				<c:when test="${article.category == 5}">
					<h3>${str_gasa}</h3>
				</c:when>
				<c:when test="${article.category == 6}">
					<h3>${str_freeBoard}</h3>
				</c:when>
			</c:choose>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<div class="w3-card-4">
					<form name="readform">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<h3>${article.subject}</h3>
							<p class="w3-right">${str_writeNick}:
								${article.nick} | ${str_reg_date}:
								<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
								| ${str_readCount}: ${article.readcount} <br>
							</p>
						</header>

						<div class="w3-container w3-padding-128 w3-padding-jumbo">
							<pre>
${article.content}
					</pre>
						</div>

						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<c:if test="${sessionScope.memEmail != null }">
								<a class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="Likego()"><i class="fa fa-thumbs-up w3-margin-right"></i>${btn_recommend}<br>${article.likenum}</a>
							</c:if>
							<a href="station.do?pageNum=${pageNum}&type=${type}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
							<c:if test="${sessionScope.memEmail == article.email}">
								<a href="stationModify.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-cog w3-margin-right"></i>${str_modify}</a>
								<input type="hidden" value="${article.num}" name="num">
								<input type="hidden" value="${pageNum}" name="pageNum">
								<input type="hidden" value="${article.category}" name="category">
								<input type="hidden" value="${type}" name="type">
								<input type="hidden" value="${sessionScope.memEmail}" name="email">
								<input type="hidden" name="ref_num" value="${ref_num}">
								<input type="hidden" name="re_step" value="${re_step}">
								<input type="hidden" name="re_level" value="${re_level}">
								<a class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="alertgo()"> <i class="glyphicon glyphicon-remove w3-margin-right"></i>${str_delete}</a>
							</c:if>

					
					</footer>
					



					</form>

				</div>
			</div>
			<br> <br>
			
			<div id="result">
			<span id="boardInfo"></span>
			</div>

			<!--  댓글쓰기 -->
			<div class="w3-row-padding w3-padding-64 w3-row">
				<div class="w3-col m1">
					<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">
				</div>
				<div class="w3-col m9">
					<input name="content" type="text" required class="w3-input w3-border w3-padding-5" style="height: 70px">
				</div>
				<div class="w3-col m2">
					<input type="button" onclick="boardAppend()" value="${btn_register}" class="w3-btn-block w3-theme-d1" style="height: 70px">
				</div>
			</div>
		</div>

	</div>


	<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>