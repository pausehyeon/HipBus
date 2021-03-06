<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<title>${str_title}</title>
<body>

	<c:import url="../top.do" />
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
										msg += "${str_noreply}";
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
			if (data.imglocation == "") {
				board += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">';
			} else {
				board += '<img src="${project}/hipbusSave/'+ data.imglocation +'" width="100%" class="w3-circle">';
			}
			board += '</div>';
			board += '<div class="w3-col m11 w3-center">';
			board += '<div class="w3-harf w3-container w3-large w3-left">';
			board += '<a href="myBus.do?driver='+data.email+'"';
			board += 'title="'+data.nick+'${str_busGo}"';
			board += 'class="yes-uline">'+data.nick+'</a>' + '&nbsp;&nbsp;&nbsp;'+data.reg_date;
			board += '</div>';
			board += '<div class="w3-harf w3-container w3-padding-4 w3-right">';
			if (data.email == "${sessionScope.memEmail}") {
				board += '<a href="#" onClick="modBoardView('
						+ data.replynum
						+ '); return false" id="modView" class="w3-margin-right">${str_modify}</a>';
				board += modBtn;		
			}if (data.email == "${sessionScope.memEmail}" || "${dtoImg.mem_level}" == 3){
				board += '<a href="#" onClick="delComplete('
					+ data.replynum +','
					  + data.ref_num + ',' + data.re_step
						+ '); return false"   id="delBoard" class="w3-margin-right">${str_delete}</a>';
				board += modBtn;
			}
			
			board += '<a href="#" onClick="reBoardView(' + data.replynum +','
				  + data.ref_num + ',' + data.re_step				
			      + '); return false" id="reBoardView">${str_reply}</a>';
			board += '<a href="#" onClick="reBoardClose(' + data.replynum +','
				  + data.ref_num + ',' + data.re_step				
			      + '); return false" id="reBoardClose"  style="display:none">${str_replyClose}</a>'; 
			board += '</div>';
			board += '<div class="w3-container w3-left-align">';
			board += '<input type="hidden" name="'+ data.replynum +'">';
			board += '<textarea id="boardContent"readonly="true" wrap="VIRTUAL" style="resize:none; width:100%;' 
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
	
									
										result.appendChild(newdiv);
									
									$('input[name=content]').val("");
									alert("${str_writeOk}")
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
			if("${sessionScope.memEmail}" == '' || "${sessionScope.memEmail}" == null){
				alert("로그인을 해주세요.");		
			}else {
			var retVal = confirm(likeok);
			if (retVal == true) {
				 location.href = "stationLikePro.do?num=" + readform.num.value
							+ "&pageNum=" + readform.pageNum.value + "&category="
							+ readform.category.value + "&type=" + readform.type.value;
				//location.href = "stationLikePro.do?urlToGoBack="+location.href+"&num="+"${article.num}";
			} else {
				location.href = "stationRead.do?num=" + readform.num.value
						+ "&pageNum=" + readform.pageNum.value + "&category="
						+ readform.category.value + "&type=" + readform.type.value;
			}
			}
		}
		// 리댓글
		function reBoardClose(replynum,ref_num,re_step){
			$('#board_' + replynum + ' #reBoardView').show();
			$('#board_' + replynum + ' #reBoardClose').hide();
			$('#replyBoardABC_'+ ref_num + ' #reContentClose').hide();
			$('#reboard' + replynum + ' #reboardDown').hide();
			$('#replyBoardABC_'+ ref_num + ' center').hide();
		}
		
		function reBoardView(replynum,ref_num,re_step){
			//var replyBoard = document.getElementById("replyBoardABC_"+replynum);
			var infResult = document.getElementById("replyBoardABC_"+ref_num);
		      $('#board_' + replynum + ' #reBoardView').hide();
				$('#board_' + replynum + ' #reBoardClose').show();
			var reboard = '';
				if("${sessionScope.memEmail}" != ''){
				reboard += '<div class="w3-row-padding w3-padding-32 w3-row" id="reContentClose">'
				reboard += '<div class="w3-col m1">'
					if ("${dtoImg.imglocation}" == '') {
						reboard += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">';
					} else {
						reboard += '<img src="${project}/hipbusSave/'+ '${dtoImg.imglocation}' +'" width="100%" class="w3-circle">';
					}
				reboard += '</div>'
				reboard += '<div class="w3-col m7">'
				reboard += '<input name="recontent" type="text" required class="w3-input w3-border w3-padding-5" style="height: 50px">'
				reboard += '</div>'
				reboard += '<div class="w3-col m2">'
				reboard += '<input type="button" onclick="reboardAppend('+ref_num+')" value="${btn_register}" class="w3-btn-block w3-theme-d1" style="height: 50px">'	
				reboard += '</div>'
				reboard += '</div>'
				
			infResult.innerHTML = reboard;
				}
			reloadBoard(ref_num);
		}
		function reboardAppend(ref_num) {
			var params = 'num=' + "${num}" // 버스주인 이메일 혹은 크루아이디
					+ '&ref_num=' + ref_num
					+ '&email=' + "${sessionScope.memEmail}" // 세션에 저장된 작성자 이메일
					+ '&content=' + $('#replyBoardABC_'+ref_num+' input[name=recontent]').val(); // 본문 입력내용
			request = new Request(
					function() {
						var reResult = document.getElementById("replyBoardABC_"+ref_num);
						if (request.httpRequest.readyState == 4) {
							if (request.httpRequest.status == 200) {
								var xmldoc = request.httpRequest.responseXML;
								var code = xmldoc.getElementsByTagName("code")
										.item(0).innerHTML;
								if (code == "inserted") {
									var data = eval("("
											+ xmldoc.getElementsByTagName("data")
													.item(0).innerHTML + ")");
									var newdiv = reMakeBoard(data);
										reResult.appendChild(newdiv);
									$('input[name=recontent]').val("");
									$("#replyBoardABC_"+ref_num+ ' center').remove();
									alert("${str_writeOk}")
								} else if (code == "failed") {
									var message = xmldoc.getElementsByTagName(
											"message").item(0).innerHTML;
								}
							} else {
	
							}
						} else {
	
						}
					}, 'stationInfReplyAppendResult.do', 'POST', params);
			request.getXMLHttpRequest();
			request.sendRequest();
		}
		function reMakeBoard(data) {
			var renewdiv = document.createElement("div");
			renewdiv.setAttribute("id", "reboard_" + data.replynum);
			var modBtn = '';
			var reboard = '';
			modBtn += '<button type="button" id="reReplyComplete" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="remodComplete('
				+ data.replynum + ')">';
			modBtn += '<i class="fa fa-check"></i>';
			modBtn += '</button>';
			modBtn += "<button type=\"button\" id='reReplyCancel' class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"remodCancel("
					+ data.replynum + ",\'" + data.content + "\','creteria')\">";
			modBtn += '<i class="fa fa-times"></i>';
			modBtn += '</button>';
			
			reboard += '<div id="reboard'+data.ref_num+'">';
			reboard += '<div class="w3-card-8 w3-margin w3-padding-xlarge w3-padding-64" id="reboardDown">';
			reboard += '<div class="w3-container w3-row">';
			reboard += '<div class="w3-col m1 w3-center">';
			if (data.imglocation == "") {
				reboard += '<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">';
			} else {
				reboard += '<img src="${project}/hipbusSave/'+ data.imglocation +'" width="100%" class="w3-circle">';
			}
			reboard += '</div>';
			reboard += '<div class="w3-col m11 w3-center">';
			reboard += '<div class="w3-harf w3-container w3-large w3-left">';
			reboard += '<a href="myBus.do?driver='+data.email+'"';
			reboard += 'title="'+data.nick+'${str_busGo}"';
			reboard += 'class="yes-uline">'+data.nick+'</a>' + '&nbsp;&nbsp;&nbsp;'+data.reg_date;
			reboard += '</div>';
			reboard += '<div class="w3-harf w3-container w3-padding-4 w3-right">';
			
		 	if (data.email == "${sessionScope.memEmail}") {
				reboard += '<a href="#" onClick="remodBoardView('
						+ data.replynum
						+ '); return false" id="remodView" class="w3-margin-right">${str_modify}</a>';
				reboard += modBtn;		
		 	}
		 	if (data.email == "${sessionScope.memEmail}" || "${dtoImg.mem_level}" == 3){
				reboard += '<a href="#" onClick="redelComplete('
						+ data.replynum +","+ data.ref_num+","+ data.re_step
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
										msg += "${str_noreply}";
										msg += "</center>"
										infResult.innerHTML += msg;
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
		// 리댓글 수정
		function remodBoardView(replynum){
		$('#reboard_' + replynum + ' textarea').prop('readonly', false);
		$('#reboard_' + replynum + ' #remodView').hide();
		$('#reboard_' + replynum + ' #redelBoard').hide();
		$('#reboard_' + replynum + ' #reBoardView').hide();
		$('#reboard_' + replynum + ' #reReplyComplete').show();
		$('#reboard_' + replynum + ' #reReplyCancel').show();
		$('#reboard_' + replynum + ' textarea').focus();
		}
		function remodCancel(replynum, content, criteria) { // 이전 데이터 저장해서 다시 띄움
			if (criteria) {
				if (!$('input[name=' + replynum + ']').prop("content")) {
					$('input[name=' + replynum + ']').prop("content", content);
					$('#reboard_' + replynum + ' textarea').val(
							$('input[name=' + replynum + ']').prop("content"));
				} else {
					$('#reboard_' + replynum + ' textarea').val(
							$('input[name=' + replynum + ']').prop("content"));
				}
			} else {
				$('input[name=' + replynum + ']').prop("content", content);
				$('#reboard_' + replynum + ' textarea').val(
						$('input[name=' + replynum + ']').prop("content"));
			}
	
			$('#reboard_' + replynum + ' textarea').prop('readonly', true);
			$('#reboard_' + replynum + ' #remodView').show();
			$('#reboard_' + replynum + ' #redelBoard').show();
			$('#reboard_' + replynum + ' #reBoardView').show();
			$('#reboard_' + replynum + ' #reReplyComplete').hide();
			$('#reboard_' + replynum + ' #reReplyCancel').hide();
		}
		function remodComplete(replynum) {
			var params = 'replynum=' + replynum + '&content='
					+ $('#reboard_' + replynum + ' textarea').val();
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
									alert("${str_modOk}");
									$('#reboard_' + replynum + ' textarea').prop('readonly', true);
									$('#reboard_' + replynum + ' #remodView').show();
									$('#reboard_' + replynum + ' #redelBoard').show();
									$('#reboard_' + replynum + ' #reBoardView').show();
									$('#reboard_' + replynum + ' #reReplyComplete').hide();
									$('#reboard_' + replynum + ' #reReplyCancel').hide();
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
		// 리댓글 삭제
		function redelComplete(replynum,ref_num,re_step) {
			var retVal = confirm("${str_delConfirm}");
			if (retVal == true) {
				var params = "replynum=" + replynum
								+ '&ref_num=' + ref_num
								+ '&re_step=' + re_step;
				request = new Request(
						function() {
							var infResult = document.getElementById("replyBoardABC_"+ref_num);
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
												.getElementById("reboard_" + replynum);
										infResult.removeChild(deldiv);	
										alert("${str_delOk}");
									} else if (code == "failed") {
										msg += xmldoc.getElementsByTagName(
												"message").item(0).innerHTML;
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
						+ "&pageNum=" + readform.pageNum.value + "&category="
						+ readform.category.value + "&type=" + readform.type.value;
			}
		}
		
		// 댓글 수정
		function modBoardView(replynum) {
			$('#board_' + replynum + ' #boardContent').prop('readonly', false);
			$('#board_' + replynum + ' #modView').hide();
			$('#board_' + replynum + ' #delBoard').hide();
			$('#board_' + replynum + ' #reBoardView').hide();
			$('#board_' + replynum + ' #reBoardClose').hide();
			$('#board_' + replynum + ' #replyComplete').show();
			$('#board_' + replynum + ' #replyCancel').show();
			$('#board_' + replynum + ' #boardContent').focus();
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
	
			$('#board_' + replynum + ' #boardContent').prop('readonly', true);
			$('#board_' + replynum + ' #modView').show();
			$('#board_' + replynum + ' #delBoard').show();
			$('#board_' + replynum + ' #reBoardView').show();
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
									alert("${str_modOk}");							
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
		function delComplete(replynum,ref_num,re_step) {
			var retVal = confirm("${str_delConfirm}");
			if (retVal == true) {
				var params = "replynum=" + replynum
							+ '&ref_num=' + ref_num
							+ '&re_step=' + re_step;
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
														"deldata").item(0).innerHTML
												+ ")");
										var deldiv = document
												.getElementById("board_" + replynum);
										result.removeChild(deldiv);
										alert("${str_delOk}");
										
									} else if (code == "failed") {
										msg += xmldoc.getElementsByTagName(
												"message").item(0).innerHTML;
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
						+ "&pageNum=" + readform.pageNum.value + "&category="
						+ readform.category.value + "&type=" + readform.type.value;
			}
		}
	//-->
	</script>

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
								<a href="myBus.do?driver=${article.email}" title="${article.nick}님의 버스로&#13;이동합니다">${article.nick}</a> | ${str_reg_date}:
								<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
								| ${str_readCount}: ${article.readcount} <br>
							</p>
						</header>

						<div class="w3-container w3-padding-128 w3-padding-jumbo">
							<p>
${article.content}
					</p>
						</div>

						<footer class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
						<input type="hidden" value="${article.num}" name="num">
								<input type="hidden" value="${pageNum}" name="pageNum">
								<input type="hidden" value="${article.category}" name="category">
								<input type="hidden" value="${type}" name="type">
								<input type="hidden" value="${article.nick}" name="nick">
								<input type="hidden" value="${sessionScope.memEmail}" name="email">
								<input type="hidden" name="ref_num" value="${ref_num}">
								<input type="hidden" name="re_step" value="${re_step}">
								<input type="hidden" name="re_level" value="${re_level}">
								<a class="w3-btn w3-padding w3-theme-d1 w3-margin-left" onclick="Likego()"><i class="fa fa-thumbs-up w3-margin-right"></i>${btn_recommend}(${article.likenum})</a>
							<a href="station.do?pageNum=${pageNum}&type=${type}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i class="fa fa-align-justify w3-margin-right"></i>${str_list}</a>
							<c:if test="${sessionScope.memEmail == article.email}">
								<a href="stationModify.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left"> <i class="fa fa-cog w3-margin-right"></i>${str_modify}</a>
							</c:if>	
							<c:if test="${sessionScope.memEmail == article.email || dtoImg.mem_level == 3}">			
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
			<c:if test="${sessionScope.memEmail != null }">
			<div class="w3-row-padding w3-padding-64 w3-row">
				<div class="w3-col m1">
				<c:choose>
				<c:when test="${dtoImg.imglocation == null}">
				<img src="${project}/view/img/HipBusLogo_pale_sq.png" width="100%" class="w3-circle">
				</c:when>
				<c:when test="${dtoImg.imglocation != ''}">
				<img src="${project}/hipbusSave/${dtoImg.imglocation}" width="100%" class="w3-circle">
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
				</c:choose>
				</div>
				<div class="w3-col m9">
					<input name="content" type="text" required class="w3-input w3-border w3-padding-5" style="height: 70px">
				</div>
				<div class="w3-col m2">
					<input type="button" onclick="boardAppend()" value="${btn_register}" class="w3-btn-block w3-theme-d1" style="height: 70px">
				</div>
			</div>
			</c:if>
		</div>

	</div>

	
	<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>