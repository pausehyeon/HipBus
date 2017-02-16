<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<script src="/HipBus/scripts/busScript.js"></script>
<script src="/HipBus/scripts/ajax.js"></script>
<style type="text/css">
textarea {
	resize: vertical;
	overflow: hidden;
	border: none;
	width: 100%;
}

textarea:focus {
	outline: none;
}
</style>

<script type="text/javascript">
	var request = null;
	var countCriteria = 5; // 방명록 로드시 볼 갯수
	var boardCount = 0;
	var contentFix = null;
	// 댓글목록 불러오기
	$(document).ready(function() {
		boardCount = countCriteria;
		loadBoard(boardCount);
	});

	function loadBoard(boardCount, more) {
		var params = 'driver=' + "${driver}" + '&boardCount=' + boardCount;
		request = new Request(
				function() {
					var boardList = document.getElementById("boardList");
					if (request.httpRequest.readyState == 4) {
						$('#console').remove();
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
									msg = "현재 방명록이 없습니다. 첫방명록을 작성해보세요!";
									$('#boardInfo').html(msg);
									$('#moreBoard').hide();
								} else {
									if (more) {
										$('#boardList').empty();
									}

									for (var i = 0; i < data.length; i++) {
										var newdiv = makeBoard(data[i]);
										boardList.appendChild(newdiv);
									}
								}
							} else if (code == "empty") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
								msg += message;
							}
						} else {
							$('#console').html("readyState 에러");
						}
					} else {
						$('#console').append($("<img/>",{
							src : "${project}/view/img/loading.gif",
							style : "width:30%"
						}));
					}
				}, "myBusBoardListResult.do", "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}

	// 댓글 삽입
	function boardAppend() {
		var params = 'driver=' + "${driver}" // 버스주인 이메일 혹은 크루아이디
				+ '&email=' + "${email}" // 세션에 저장된 작성자 이메일
				+ '&content=' + $('input[name=content]').val(); // 본문 입력내용
		request = new Request(
				function() {
					var boardList = document.getElementById("boardList");
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
								if (boardList.firstChild != null) {
									var oldFirstChild = boardList.firstChild;
									boardList.insertBefore(newdiv,
											oldFirstChild);
								}
								if (boardList.firstChild == null) {
									boardList.appendChild(newdiv);
								}
								$('input[name=content]').val("");
								$('#boardInfo').html("");
								$('console').html('성공적');
							} else if (code == "failed") {
								var message = xmldoc.getElementsByTagName(
										"message").item(0).innerHTML;
								$('#console').html(message);
							}
						} else {
							$('#console').html("readyState 에러");
						}
					} else {
						$('#console').html("Status 에러");
					}
				}, 'myBusBoardAppendResult.do', 'POST', params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}
	// 방명록 수정
	function modBoardView(num) {
		$('#board_' + num + ' textarea').prop('readonly', false);
		$('#board_' + num + ' #modView').hide();
		$('#board_' + num + ' #delBoard').hide();
		$('#board_' + num + ' #modComplete').show();
		$('#board_' + num + ' #modCancel').show();
		$('#board_' + num + ' textarea').focus();
	}

	function modCancel(num, content, criteria) { // 이전 데이터 저장해서 다시 띄움
		if (criteria) {
			if (!$('input[name=' + num + ']').prop("content")) {
				$('input[name=' + num + ']').prop("content", content);
				$('#board_' + num + ' textarea').val(
						$('input[name=' + num + ']').prop("content"));
			} else {
				$('#board_' + num + ' textarea').val(
						$('input[name=' + num + ']').prop("content"));
			}
		} else {
			$('input[name=' + num + ']').prop("content", content);
			$('#board_' + num + ' textarea').val(
					$('input[name=' + num + ']').prop("content"));
		}

		$('#board_' + num + ' textarea').prop('readonly', true);
		$('#board_' + num + ' #modView').show();
		$('#board_' + num + ' #delBoard').show();
		$('#board_' + num + ' #modComplete').hide();
		$('#board_' + num + ' #modCancel').hide();
	}

	function modComplete(num) {
		var params = 'num=' + num + '&content='
				+ $('#board_' + num + ' textarea').val();
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
								$('#console').html(message);
							}
							modCancel(num, data);
						} else {
							$('#console').html("readyState 에러");
						}
					} else {
						$('#console').html("Status 에러");
					}
				}, 'myBusBoardModifyResult.do', "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}
	// 댓글 삭제
	function delBoard(num) {
		var params = "num=" + num;
		request = new Request(
				function() {
					var boardList = document.getElementById("boardList");
					var msg = "";
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "deleted") {
								var num = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								var deldiv = document.getElementById("board_"
										+ num);
								boardList.removeChild(deldiv);
								alert("성공적으로 삭제하였습니다.");
								msg += num + " 번 글 삭제 성공";
							} else if (code == "failed") {
								msg += xmldoc.getElementsByTagName("message")
										.item(0).innerHTML;
							}
							$('#console').html(msg);
						} else {
							$('#console').html("readyState 에러");
						}
					} else {
						$('#console').html("Status 에러");
					}

				}, "myBusBoardDeleteResult.do", "POST", params);
		request.getXMLHttpRequest();
		request.sendRequest();
	}

	// div 만들어서 붙이기
	function makeBoard(data) {
		var newdiv = document.createElement("div");
		newdiv.setAttribute("id", "board_" + data.num);
<<<<<<< .mine
		alert("${driver}");
		alert("${email}");
		var appendBtn = ''; 
		var modBtn = ''; 
		var board = '';
		
		modBtn += '<button type="button" id="modComplete" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="modComplete('+ data.num+ ')">';
		modBtn += '<i class="fa fa-check"></i>';
		modBtn += '</button>';
		modBtn += '<button type="button" id="modView" class="w3-btn w3-theme-l1" onclick="modBoardView('+ data.num+ ')">';
		modBtn += '<i class="fa fa-pencil"></i>';
		modBtn += '</button> &nbsp;';
		modBtn += "<button type=\"button\" id='modCancel' class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"modCancel("+ data.num + ",\'"+ data.content+ "\','creteria')\">";
		modBtn += '<i class="fa fa-times"></i>';
		modBtn += '</button>';
		
		appendBtn += '<div class="w3-left">';
		if(data.email=="${sessionScope.memEmail}"){
			appendBtn += modBtn;
		}
		appendBtn += '<button type="button" id="delBoard" class="w3-btn w3-theme-l1" onclick="delBoard('+ data.num+ ')">';
		appendBtn += '<i class="fa fa-trash-o"></i>';
		appendBtn += '</button> &nbsp;';
		appendBtn += '</div>';
		
		
		board += '<div class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin" id="list">';
		board += '<a href=myBus.do?driver='+ data.email+ '><img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width: 40px"></a>';
		board += '<span class="w3-right w3-opacity">'+ data.reg_date+ '&nbsp;';
		board += '<a href="#"><i class="fa fa-close w3-right" onclick="delBoard('+ data.num+ ')"></i></a></span>';
		board += '<h4>'+ data.nick+ '</h4>';
		board += '<hr class="w3-clear">';
		board += '<input type="hidden" name="'+ data.num +'">';
		board += '<textarea readonly="true" rows="3">'+ data.content+ "</textarea>";
			if(data.email=="${sessionScope.memEmail}" || "${email==driver}"){
				board += appendBtn;
			}
		board += '</div>';
		
		newdiv.innerHTML = board;
		newdiv.data += data;
||||||| .r241
		alert("${fn:trim('" + data.email + "')=='f@com.com'}");
		alert("${sessionScope.memEmail=='f@com.com'}");
		newdiv.innerHTML = '<div class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin" id="list">'
				+ '<a href=myBus.do?driver='
				+ data.email
				+ '><img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width: 40px"></a>'
				+ '<span class="w3-right w3-opacity">'
				+ data.reg_date
				+ '&nbsp;'
				+ '<a href="#"><i class="fa fa-close w3-right" onclick="delBoard('
				+ data.num
				+ ')"></i></a></span>'
				+ '<h4>'
				+ data.nick
				+ '</h4>'
				+ '<hr class="w3-clear">'
				+ '<input type="hidden" name="'+ data.num +'">'
				+ '<textarea readonly="true" rows="3">'
				+ data.content
				+ "</textarea>"
				+ '<div class="w3-center">'
				+ '<c:if test="${driver==email}">'
				+ '<button type="button" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="modComplete('
				+ data.num
				+ ')">'
				+ '<i class="fa fa-scissors"></i>  ${str_modComplete}'
				+ '</button>'
				+ '<button type="button" class="w3-btn w3-theme-l1" onclick="modBoardView('
				+ data.num
				+ ')">'
				+ '<i class="fa fa-pencil"></i>  ${str_modBoard}'
				+ '</button> &nbsp;'
				+ "<button type=\"button\" class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"modCancel("
				+ data.num
				+ ",\'"
				+ data.content
				+ "\','first')\">"
				+ '<i class="fa fa-times"></i>  ${str_modCancel}'
				+ '</button>'
				+ '<button type="button" class="w3-btn w3-theme-l1" onclick="delBoard('
				+ data.num
				+ ')">'
				+ '<i class="fa fa-trash-o"></i>  ${str_delBoard}'
				+ '</button> &nbsp;' + '</c:if>' + '</div>' + '</div>';
		newdiv.data = data;
=======
		var msg = "";
		var modbuttons = "";
		
		modbuttons += '<button type="button" class="w3-btn w3-theme-l1 modc" style="display:none" onclick="modComplete(';
		modbuttons += data.num;
		modbuttons += ')">';
		modbuttons += '<i class="fa fa-scissors"></i>  ${str_modComplete}';
		modbuttons += '</button>';
		modbuttons += '<button type="button" class="w3-btn w3-theme-l1" onclick="modBoardView(';
		modbuttons += data.num;
		modbuttons += ')">';
		modbuttons += '<i class="fa fa-pencil"></i>  ${str_modBoard}';
		modbuttons += '</button> &nbsp;';
		modbuttons += "<button type=\"button\" class=\"w3-btn w3-theme-l1\" style=\"display:none\" onclick=\"modCancel(";
		modbuttons += data.num;
		modbuttons += ",\'";
		modbuttons += data.content;
		modbuttons += "\','first')\">";
		modbuttons += '<i class="fa fa-times"></i>  ${str_modCancel}';
		modbuttons += '</button>';
		modbuttons += '<button type="button" class="w3-btn w3-theme-l1" onclick="delBoard(';
		modbuttons += data.num;
		modbuttons += ')">';
		modbuttons += '<i class="fa fa-trash-o"></i>  ${str_delBoard}';
		modbuttons += '</button>';

		msg += '<div class="w3-container w3-card-2 w3-white w3-round w3-padding-32 w3-margin" id="list">';
		msg += '<a href=myBus.do?driver='+ data.email;
		msg += '><img src="${project}/view/img/HipBusLogo_colored_sq.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width: 40px"></a>';
		msg += '<span class="w3-right w3-opacity">';
		msg += data.reg_date;
		msg += '&nbsp;';
		msg += '<a href="#"><i class="fa fa-close w3-right" onclick="delBoard(';
		msg += data.num;
		msg += ')"></i></a></span>';
		msg += '<h4>';
		msg += data.nick;
		msg += '</h4>';
		msg += '<hr class="w3-clear">';
		msg += '<input type="hidden" name="'+ data.num +'">';
		msg += '<textarea readonly="true" rows="3">';
		msg += data.content;
		msg += "</textarea>";
		msg += '<div class="w3-center">';
		if(data.email == "${sessionScope.memEmail}"){
			msg += modbuttons;
		}
		msg += '</div>' + '</div>';
		
		newdiv.innerHTML = msg;
		newdiv.data = data;
>>>>>>> .r250
		return newdiv;
	}
	$(document).on('click', '#moreBoard', function(e) {
		boardCount += countCriteria;
		loadBoard(boardCount, "more");
	});


//-->
</script>
<title>${str_mybusTitle}</title>
<body class="w3-theme-l5">
	<!-- Navbar -->
	<c:import url="../top.do" />
	<textarea rows="" cols="" readonly="readonly"></textarea>
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>
		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}&email=${email}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-theme-l1 w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-16">

					<!-- 2. 2등급 회원이며 채널 연결한 경우 이용자와 타이용자 공용 -->
					<c:if test="${channelid != null}">
						<div class="w3-row">
							<h4 class="w3-right w3-margin-right">
								<i class="fa fa-video-camera"></i>&nbsp; ${str_live}
							</h4>
						</div>
						<div class="w3-row">
							<div class="w3-twothird" id="onair">
							</div>
							<div class="w3-third" id="onairchat">
							</div>
						</div>
<<<<<<< .mine
						<div id="oaconsole"></div>
						
						<script type="text/javascript">
						//<!--
							$(document).ready(
								function(){
									playonair("${channelid}","${googleApiKey}")	
								}
							);
						//-->
						</script>

					</c:if>
					<c:if test="${1=='1'}">
						<script type="text/javascript">
							alert("됨?");
						</script>
					</c:if>

					<!-- 본인페이지 if 시작-->
					<c:if test="${driver == email}">
						<!-- 2등급 회원인데 아직 채널을 연결하지 않은 경우 -->
						<c:if test="${channelid == null and mem_level == 2}">
							<div class="w3-row">
								<div class="w3-row w3-center w3-theme-l1 w3-padding-large w3-small">
									<p>
										<i class="fa fa-video-camera w3-xxlarge"></i> <br> 아직 채널 ID를 등록하지 않으셨습니다.<br> 유투브 채널 ID를 등록하고 방송을 시작해보세요.<br> <br>
										<input class="w3-input" type="text" required>
										<br> <a href="#">채널 ID를 찾으려면?</a>
									</p>
								</div>
							</div>						
						</c:if>
						<!-- 1등급 회원인 경우 -->
						<c:if test="${mem_level == 1}">
							<div class="w3-row">
								<p class="w3-center w3-theme-l1 w3-padding-large w3-tiny">
									<i class="fa fa-video-camera w3-xxlarge"></i> <br> 사이트 규정에 따라 Main Station에 10개 이상 글을 게시한 이용자만 라이브 스트리밍을 이용할 수 있습니다. <br> <br> <a href="station.do" class="w3-small">글 쓰러 가기</a>
								</p>
							</div>
						</c:if>
						<!-- 본인페이지 if 끝 -->
					</c:if>
					<!-- 채널연결안된 타페이지 -->
					<c:if test="${driver != email and channelid == null}">
						<div class="w3-row">
							<a href="#" class="w3-center w3-theme-l1 w3-padding-large">
								<p>
									<i class="fa fa-video-camera w3-xxlarge"></i><br>
									<%-- ${str_whatsLive} --%>
								</p>
							</a>
						</div>
					</c:if>
					<!-- 타페이지 끝 -->
				</div>

				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h6 class="w3-opacity">${str_putMsg}</h6>
								<c:if test="${email != null}">
									<input type="text" placeholder="${str_boardEx}" name="content" class="w3-border w3-padding w3-input" border="1">
								</c:if>
								<c:if test="${email == null}">
									<input type="text" placeholder="${str_cantBoard}" name="content" class="w3-border w3-padding w3-input" border="1" readonly>
								</c:if>
								<button type="button" class="w3-btn w3-theme-l1" onclick="boardAppend()">
									<i class="fa fa-pencil"></i> ${str_post}
								</button>
							</div>
						</div>
					</div>
				</div>

				<div id="boardList"></div>

				<div class="w3-row-padding">
					<div class="w3-col m12 w3-center dash">
						<br> <br> <span id="boardInfo"></span>
						<button id="moreBoard">${str_moreBoard}</button>
						<br> <br>
						<div id="console"></div>
					</div>
				</div>



				<!-- End Middle Column -->
			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
