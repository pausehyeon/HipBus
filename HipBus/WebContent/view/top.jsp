<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/navbar_top_setting.jsp"%>
<!-- jQuery 연결 -->
<script type="text/javascript" src="${project}/scripts/jquery-3.1.1.js"></script>
<script src="${project}/scripts/generalScript.js"></script>

<script type="text/javascript">
	//Used to toggle the menu on smaller screens when clicking on the menu button
	var pageSize = 4;
	function openNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	function driverCheck() {
		var params = "keyword=" + $('input[name="keywords"]').val();
		var driverResult = document.getElementById("driverResult");
		var keywords = searchBusForm.keywords.value;
		var crewSearchResult = document.getElementById("crewSearchResult");
		var myBusSearchResult = document.getElementById("myBusSearchResult");
		var request = new Request(
				function() {
					if (request.httpRequest.readyState == 4) {
						if (request.httpRequest.status == 200) {
							var msg = "";
							var message = "";
							var messages = "";
							var xmldoc = request.httpRequest.responseXML;
							var code = xmldoc.getElementsByTagName("code")
									.item(0).innerHTML;
							if (code == "selected") {
								var data = eval("("
										+ xmldoc.getElementsByTagName("data")
												.item(0).innerHTML + ")");
								var datas = eval("("
										+ xmldoc.getElementsByTagName("datas")
												.item(0).innerHTML + ")");

								// myBus 검색 결과
								if (data.length == 0) {
									msg += '<div class="w3-margin-top w3-margin-left w3-margin-right"><p style="font-weight:bold;">My Bus 검색 결과</p> 검색 결과가 없습니다.</div> <hr>';
								} else {
									
									messages += '<div class="w3-margin"><h4 style="font-weight:bold; text-align:center;"><img src="${project}/view/img/HipBusLogo_colored_sq.png" class="w3-circle" style="width:40px; height:40px"> &nbsp; My Bus 검색 결과<h4></div>';
									for (var i = 0; i < data.length; i++) {
									if(data[i].imglocation !=""){
										messages += '<ul class="w3-pagination"><li><a href="myBus.do?driver='
												+ data[i].email
												+ '">'
												+ data[i].nick
												+ '의 버스 <img class="w3-circle"'+
								'style="width:30px; height:30px;" src="${project}/hipbusSave/'+data[i].imglocation+'"></a></li><br><br></ul>';
									}else{
										messages += '<ul class="w3-pagination"><li><a href="myBus.do?driver='
											+ data[i].email
											+ '">'
											+ data[i].nick
											+ '의 버스 <img class="w3-circle"'+
							'style="width:30px; height:30px;" src="${project}/view/img/HipBusLogo_colored_sq.png"></a></li><br><br></ul>';	
									}	
								}
									msg += '<div class="w3-margin"><p style="font-weight:bold;">My Bus 검색 결과</p></div>';

									if (data.length > 4) {
										for (var i = 0; i < pageSize; i++) {
											if(data[i].imglocation !=""){
											msg += '<a href="myBus.do?driver='
													+ data[i].email
													+ '">'
													+ data[i].nick
													+ '의 버스 <img class="w3-circle"'
													+ 'style="width:30px; height:30px;" src="${project}/hipbusSave/'+data[i].imglocation+'"></a>';
											}else {
												msg += '<a href="myBus.do?driver='
													+ data[i].email
													+ '">'
													+ data[i].nick
													+ '의 버스 <img class="w3-circle"'
													+ 'style="width:30px; height:30px;" src="${project}/view/img/HipBusLogo_colored_sq.png"></a>';
											}
										}
									} else {
										for (var i = 0; i < data.length; i++) {
											if(data[i].imglocation !=""){
											msg += '<a href="myBus.do?driver='
													+ data[i].email
													+ '">'
													+ data[i].nick
													+ '의 버스 <img class="w3-circle"'+
										'style="width:30px; height:35px;" src="${project}/hipbusSave/'+data[i].imglocation+'"></a>';
											}else{
												msg += '<a href="myBus.do?driver='
													+ data[i].email
													+ '">'
													+ data[i].nick
													+ '의 버스 <img class="w3-circle"'+
										'style="width:30px; height:30px;" src="${project}/view/img/HipBusLogo_colored_sq.png"></a>';
											}
										}
									}

									if (data.length >= 4) {
										msg += '<a class="w3-center w3-small" onclick="document.getElementById(\'driverSearch\').style.display=\'block\'" >'
												+ '<span>${str_more}</span></a><hr>';

									}

								}
								// crewBus 검색 결과
								if (datas.length == 0) {

									msg += '<div class="w3-margin"><p style="font-weight:bold;">Crew Bus 검색 결과</p> 검색 결과가 없습니다.</div>';

								} else {
									message += '<div class="w3-margin"><h4 style="font-weight:bold; text-align:center;"><img src="${project}/view/img/CrewBusLogo_colored_sq.png" class="w3-circle" style="width:40px; height:40px"> &nbsp;Crew Bus 검색 결과</h4></div>';
									for (var i = 0; i < datas.length; i++) {
										if(datas[i].crewImg != ""){
										message += '<ul class="w3-pagination"><li><a href="crewBus.do?driver='
												+ datas[i].crewid
												+ '">'
												+ datas[i].crewname
												+ '의 버스 <img class="w3-circle"'+
								'style="width:30px; height:30px;" src="${project}/hipbusSave/'+datas[i].crewImg+'"></a></li><br><br></ul>';
										}else{
											message += '<ul class="w3-pagination"><li><a href="crewBus.do?driver='
												+ datas[i].crewid
												+ '">'
												+ datas[i].crewname
												+ '의 버스 <img class="w3-circle"'+
								'style="width:30px; height:35px;" src="${project}/view/img/CrewBusLogo_colored_sq.png"></a></li><br><br></ul>';
										}
									}

									msg += '<div class="w3-margin"><p style="font-weight:bold;">Crew Bus 검색 결과</p></div>';
									if (datas.length > 4) {
										for (var i = 0; i < pageSize; i++) {
											if(datas[i].crewImg != ""){
											msg += '<a href="crewBus.do?driver='
													+ datas[i].crewid
													+ '">'
													+ datas[i].crewname
													+ '의 버스 <img class="w3-circle"'+
								'style="width:30px; height:30px;" src="${project}/hipbusSave/'+datas[i].crewImg+'"></a>';
											}else{
												msg += '<a href="crewBus.do?driver='
													+ datas[i].crewid
													+ '">'
													+ datas[i].crewname
													+ '의 버스 <img class="w3-circle"'+
								'style="width:30px; height:30px;" src="${project}/view/img/CrewBusLogo_colored_sq.png"></a>';
											}
										}
									} else {
										for (var i = 0; i < datas.length; i++) {
											if(datas[i].crewImg != ""){
											msg += '<a href="crewBus.do?driver='
													+ datas[i].crewid
													+ '">'
													+ datas[i].crewname
													+ '의 버스 <img class="w3-circle"'+
									'style="width:30px; height:30px;" src="${project}/hipbusSave/'+datas[i].crewImg+'"></a>';
											}else{
												msg += '<a href="crewBus.do?driver='
													+ datas[i].crewid
													+ '">'
													+ datas[i].crewname
													+ '의 버스 <img class="w3-circle"'+
									'style="width:30px; height:30px;" src="${project}/view/img/CrewBusLogo_colored_sq.png"></a>';
											}
										}
									}
									if (datas.length >= 4) {

										msg += '<a class="w3-center w3-small" onclick="document.getElementById(\'crewSearch\').style.display=\'block\'" >'
												+ '<span>${str_more}</span></a><hr>';

									}
								}
								driverResult.innerHTML = msg;
								crewSearchResult.innerHTML = message;
								myBusSearchResult.innerHTML = messages;

							}
						} else {
							$('#nickresult').text('오류');
						}
					} else {
						console.log("통신중...");
					}
				}, "driverSearchResult.do", "POST", params);
		request.sendRequest();
	}

	$(document).ready(function() {

		if (!sessionStorage.getItem("myBus")) {
			$('#mybusget').hide();
		} else {
			$('#mybusget').show();
		}

		if (!sessionStorage.getItem("crewBus")) {
			$('#crewbusget').hide();
		} else {
			$('#crewbusget').show();
		}

		if (!sessionStorage.getItem("board")) {
			$('#boardget').hide();
		} else {
			$('#boardget').show();
		}

		var myBusImgLocation = sessionStorage.getItem("myBusImg");
		$('#mybusImg').attr({
			src : myBusImgLocation,
			width : 32,
			height : 35
		});

		var crewBusImgLocation = sessionStorage.getItem("crewBusImg");
		$('#crewbusImg').attr({
			src : crewBusImgLocation,
			width : 32,
			height : 35
		});
		
	
	var garageImg = "http://localhost:8080/HipBus/view/img/garage.png";
		var stationImg = "http://localhost:8080/HipBus/view/img/station.png";
		var boardSrc = sessionStorage.getItem("board");
		if (boardSrc != "") {
			if (boardSrc.indexOf('station') == -1) {
				$('#boardImg').attr({
					src : garageImg,
					width : 35,
					height : 38
				});

			} else {
				$('#boardImg').attr({
					src : stationImg,
					width : 38,
					height : 42
				});

			}
		}

	});
//-->
</script>

<div class="w3-top">
	<ul class="w3-navbar w3-theme-d2 w3-left-align w3-large" style="height: 51px">
		<li class="w3-hide-medium w3-hide-large w3-opennav w3-right"><a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"> <i
				class="fa fa-bars"
			></i>
		</a></li>
		<li><a href="main.do" class="w3-padding-large w3-theme-d4" title="Go to Main"> <i class="fa fa-bus w3-margin-right"></i>${str_name}
		</a></li>
		<li class="w3-hide-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="GO to Board"> <i class="fa fa-chevron-down"></i>
		</a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<a href="station.do" title="Main Station 바로가기">${str_station}</a> <a href="garage.do"title="Public Garage바로가기">${str_garage}</a>
			</div></li>
		<li class="w3-hide-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="Driver/Crew 검색"> <i class="fa fa-search"></i>
				</a>
					<div id="searchResult" class="w3-dropdown-content w3-white w3-card-4">
						<form name="searchBusForm" method="post">
							<div class="w3-row w3-container w3-padding-16">
								<div class="w3-threequarter">
									<input type="text" name="keywords" id="keyword" class="w3-input" placeholder="${str_search}" onkeyup="driverCheck()">
								</div>
								<div class="w3-quarter w3-right-align">
									<i class="fa fa-search"></i>
								</div>
							</div>
							<div id="driverResult"></div>
						</form>
					</div></li>

		<c:if test="${sessionScope.memEmail eq null}">
			<!-- ^ 로그인 되어 있지 않은 경우에 로그인 요청 메시지 -->
		<li><a onclick="document.getElementById('login').style.display='block'">로그인 해주세요.</a></li>
		</c:if>

		<c:if test="${sessionScope.memEmail ne null}">
			<!-- ^ 로그인 된 경우 친구목록과 검색기능 -->
			<c:if test="${member.mem_level ne 3 }">
			<li class="w3-hide-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="Join List"> <i class="fa fa-users"></i>
			</a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<c:if test="${hoppedOnMembers ne null}">
						<c:forEach var="hoppedOnMember" begin="0" end="4" items="${hoppedOnMembers}">
							<a href="myBus.do?driver=${hoppedOnMember.email}"><i class="fa fa-bus w3-margin-right"></i>${hoppedOnMember.nick}</a>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(hoppedOnMembers) eq 0}">
						<a>아직 올라 탄 버스가 없습니다.</a>
					</c:if>
					<c:if test="${fn:length(hoppedOnMembers) ge 5}">
						<a class="w3-center w3-small" onclick="document.getElementById('myBusSearch').style.display='block'"> <span>${str_more}</span>
						</a>
					</c:if>
					<hr>
					<c:if test="${hoppedOnCrews ne null}">
						<c:forEach var="hoppedOnCrew" begin="0" end="4" items="${hoppedOnCrews}">
							<a href="crewBus.do?driver=${hoppedOnCrew.crewid}"><i class="fa fa-fort-awesome w3-margin-right"></i>${hoppedOnCrew.crewname}</a>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(hoppedOnCrews) eq 0}">
						<a>아직 올라 탄 크루가 없습니다.</a>
					</c:if>
					<c:if test="${fn:length(hoppedOnCrews) ge 5}">
						<a class="w3-center w3-small" onclick="document.getElementById('crewBusSearch').style.display='block'"> <span>${str_more}</span>
						</a>
					</c:if>

				</div></li>
			</c:if>

			
		</c:if>
		<c:if test="${sessionScope.memEmail ne null}">
			<!-- 로그인된 경우 로그아웃 버튼, my bus로 가기, crewbus로 가기 버튼 보이게 -->

			<li class="w3-hide-small w3-right">
				<!-- 로그아웃 -->
				<form name="signOutForm" method="post" action="signOutPro.do">
					<input type="submit" value="${str_signOut}" class="w3-btn w3-theme-d2 w3-padding-large w3-hover-white" title="LogOut">
					<input name="urlToGoBack" type="hidden">
					<!-- ^ 로그아웃 후 돌아올 현재 페이지 url을 기억.-->
					<script type="text/javascript">
						
						//<!--
						$(document).ready(
							function() {
								//여기서 hidden값을 현재 페이지 url로 바꿔줌.
								signOutForm.urlToGoBack.value = location.href;
							}
						);
					
					//-->
					</script>
				</form>
			</li>

			<c:if test="${member.mem_level ne 3}">
				<!-- 관리자는 제외 -->
				<li class="w3-hide-small w3-right"><a href="myBus.do?driver=${sessionScope.memEmail}" class="w3-padding-large w3-hover-white" title="${str_myBus}"> <c:if
							test="${member.imglocation eq null}"
						>
							<img src="${project}/view/img/HipBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
						</c:if> <c:if test="${member.imglocation ne null}">
							<img src="${project}/hipbusSave/${member.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
						</c:if>
				</a></li>

				<c:if test="${myCrews ne null}">
					<!-- 가입한 크루가 있으면 -->
					<c:forEach var="myCrew" items="${myCrews}" >
						<li class="w3-hide-small w3-right"><a href="crewBus.do?driver=${myCrew.crewid}" class="w3-padding-large w3-hover-white" title="${str_crewBus}"> 
							<c:if test="${myCrew.imglocation eq null}">
									<img src="${project}/view/img/CrewBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
								</c:if> <c:if test="${myCrew.imglocation ne null}">
									<img src="${project}/hipbusSave/${myCrew.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
								</c:if>
						</a></li>
					</c:forEach>
				</c:if>
			</c:if>

		</c:if>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 51px">
	<ul class="w3-navbar w3-left-align w3-large w3-theme">
		<li>
			<a href="station.do" title="Main Station 바로가기" class="w3-padding-large">${str_station}</a>
		</li>
		<li>
			<a href="garage.do" title="Public Garage 바로가기" class="w3-padding-large">${str_garage}</a>
		</li>

		<c:if test="${sessionScope.memEmail ne null}">
			<!-- 로그인된 경우 로그아웃 버튼, my bus로 가기, crewbus로 가기 버튼 보이게 -->
			<c:if test="${member.mem_level ne 3}">
				<!-- 관리자는 제외 -->
				<li>
					<a href="myBus.do?driver=${sessionScope.memEmail}" class="w3-padding-large w3-hover-white" title="${str_myBus}">${str_myBus} 
						<c:if test="${member.imglocation eq null}">
							<img src="${project}/view/img/HipBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
						</c:if>
						<c:if test="${member.imglocation ne null}">
							<img src="${project}/hipbusSave/${member.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="My Bus">
						</c:if>
					</a>
				</li>

				<c:if test="${myCrews ne null}">
					<!-- 가입한 크루가 있으면 -->
					<c:forEach var="myCrew" items="${myCrews}">
						<li>
							<a href="crewBus.do?driver=${myCrew.crewid}" class="w3-padding-large w3-hover-white" title="${str_crewBus}">${str_crewBus} 
								<c:if test="${myCrew.imglocation eq null}">
									<img src="${project}/view/img/CrewBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
								</c:if>
								<c:if test="${myCrew.imglocation ne null}">
									<img src="${project}/hipbusSave/${myCrew.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
								</c:if>
							</a>
						</li>
					</c:forEach>
				</c:if>
			</c:if>
			<li>
				<!-- 로그아웃 -->
				<form name="smallSignOutForm" method="post" action="signOutPro.do">
					<input type="submit" value="${str_signOut}" class="w3-btn w3-theme w3-padding-large" title="LogOut">
					<input name="urlToGoBack" type="hidden">
					<!-- ^ 로그아웃 후 돌아올 현재 페이지 url을 기억.-->
					<script type="text/javascript">
						$(document).ready(function() {
							//여기서 hidden값을 현재 페이지 url로 바꿔줌.
							smallSignOutForm.urlToGoBack.value = location.href;
						});
					//-->
					</script>
				</form>
			</li>

		</c:if>

	</ul>
</div>

<!-- member 검색결과창 -->
<c:import url="modal_hoppedOnList.jsp" />

<!-- member 검색결과창 -->
<c:import url="modal_driverSearch.jsp" />

<!-- login 모달 창 -->
<c:import url="modal_signIn.jsp" />