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
	var countCriteria = 5;	// 방명록 로드시 볼 갯수 (more를 누르면 이 수만큼 누적해서 더 보여준다)
	var boardCount = 5;		// 한번에 가져올 방명록 갯수
	// 댓글목록 불러오기
	$(document).ready(function() {
		loadBoard(boardCount);	// 페이지로드시에 방명록리스트를 불러온다.
	});

	function loadBoard(boardCount, more) {	// 방명록리스트 가져오는 메소드
		var params = 'driver=' + "${driver}" + '&boardCount=' + boardCount;
		request = new Request(
			function() {
				var boardList = document.getElementById("boardList");
				if (request.httpRequest.readyState == 4) {
					if (request.httpRequest.status == 200) {
						var msg = "";
						var xmldoc = request.httpRequest.responseXML;
						var code = xmldoc.getElementsByTagName("code").item(0).innerHTML;
						if (code == "selected") {
							var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).innerHTML + ")");
							if (data.length == 0) {
								msg = "현재 방명록이 없습니다. 첫방명록을 작성해보세요!";
								$('#boardInfo').html(msg);	// 방명록 없을때 메세지출력용 div
								$('#moreBoard').hide();
							} else {
								if ( more ) {	// more매개변수가 왔으면, 원래있던 리스트를 먼저 지운다
									$('#boardList').empty();
								}
								if (data.length < 5){
									$('#moreBoard').hide();
								} else {
									$('#moreBoard').show();
								}
								for (var i = 0; i < data.length; i++) {	// 방명록을 위부터 하나씩 붙인다
									var newdiv = makeBoard(data[i]);
									boardList.appendChild(newdiv);
								}
							}
						} else if (code == "empty") {
							var message = xmldoc.getElementsByTagName(
									"message").item(0).innerHTML;
							msg += message;
						}
						$('#console').remove();
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
		request.sendRequest();
	}

	// 방명록 위로 삽입하는 메소드 (appendresult핸들러가 db에 넣고 appendresult.jsp에 출력된 새 방명록을 맨 위에 붙인다)
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
								var newdiv = makeBoard(data);		// 일단 방명록을 div로 만든다
								if (boardList.firstChild != null) {
									var oldFirstChild = boardList.firstChild;	// 기존 리스트의 첫번째 방명록
									boardList.insertBefore(newdiv,				// 첫번째 방명록 위에 새 방명록을 붙인다
											oldFirstChild);
								}
								if (boardList.firstChild == null) {		// 기존리스트의 첫번째 방명록이 없으면 그냥 뒤에 붙인다
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
		request.sendRequest();
	}
	// 방명록 수정
	function modBoardView(num) {		// 방명록 수정가능한 폼으로 바꾸고 보일버튼과 안보일 버튼을 지정한다
		$('#board_' + num + ' textarea').prop('readonly', false);	// 해당 방명록의 textarea의 readonly속성을 없앤다 
		$('#board_' + num + ' #modView').hide();
		$('#board_' + num + ' #delBoard').hide();
		$('#board_' + num + ' #modComplete').show();
		$('#board_' + num + ' #modCancel').show();
		$('#board_' + num + ' textarea').focus();
	}
	// 방명록 수정취소
	function modCancel(num, content, criteria) { // 작성한 글을 삭제하고 이전 데이터를 다시 띄운다
		if (criteria) {		// 세번째 매개변수가 있으면
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
	// 방명록 수정 완료 (실제로 db에 저장한다)
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
							modCancel(num, data);	// 수정한 글에 수정한 내용을 띄우고 수정전 폼으로 되돌린다
						} else {
							$('#console').html("readyState 에러");
						}
					} else {
						$('#console').html("Status 에러");
					}
				}, 'myBusBoardModifyResult.do', "POST", params);
		request.sendRequest();
	}
	// 방명록 삭제
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
		request.sendRequest();
	}

	// div 만들어서 붙이기
	function makeBoard(data) {
		var newdiv = document.createElement("div");
		newdiv.setAttribute("id", "board_" + data.num);
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
		if(data.email=="${sessionScope.memEmail}"){		// 글의 작성자와 세션의 이메일이 같으면 수정버튼을 보여준다
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
		board += '<textarea readonly="true" rows="3" class="w3-padding-left">'+ data.content+ "</textarea>";
			if(data.email=="${email}" || "${driver}"=="${email}" || "${my_level}"==3){	// 작성자와 세션이메일이 같거나 버스주인과 이메일이 같으면 버튼을 붙인다
				board += appendBtn;
			}
		board += '</div>';
		
		newdiv.innerHTML = board;
		newdiv.data += data;

		return newdiv;
	}
	$(document).on('click', '#moreBoard', function(e) {	// more버튼을 눌렀을때 보일 방명록수를 카운트 누적해서 새로 로드한다
		boardCount += countCriteria;
		loadBoard(boardCount, "more");
	});


//-->
</script>
<title>${str_mybusTitle}</title>
<body class="w3-theme-l5">
	<!-- Navbar -->
	<c:import url="../top.do" />
	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>
		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
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
			<c:import url="../myBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
