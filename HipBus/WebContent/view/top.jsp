<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/navbar_top_setting.jsp"%>
<!-- jQuery 연결 -->
<script type="text/javascript" src="${project}/scripts/jquery-3.1.1.js"></script>
<script src="${project}/scripts/generalScript.js"></script>

<script type="text/javascript">
	//Used to toggle the menu on smaller screens when clicking on the menu button
	function openNav() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
	
	function driverCheck() {
		var params = "keyword=" + $('input[name="keyword"]').val();
		var driverResult = document.getElementById("driverResult");
		var request = new Request(function() {
			if (request.httpRequest.readyState == 4) {
				if (request.httpRequest.status == 200) {
					var msg="";
					var xmldoc= request.httpRequest.responseXML;
					var code = xmldoc.getElementsByTagName("code").item(0).innerHTML;
					if(code == "selected"){
					var data = eval("("+ xmldoc.getElementsByTagName("data").item(0).innerHTML + ")");
					var datas = eval("("+ xmldoc.getElementsByTagName("datas").item(0).innerHTML + ")");
					
					if (data.length == 0) {
						msg+='<div class="w3-margin">My Bus 검색 결과 <br><br> 검색 결과가 없습니다.</div> <hr>';
						}else{
							msg+='<div class="w3-margin">MY Bus 검색 결과</div>';
							for (var i = 0; i < data.length; i++) {	// 방명록을 위부터 하나씩 붙인다
								msg+='<a href="myBus.do?driver='+data[i].email+'">'+data[i].nick+'의버스<img class="w3-circle"'+
										'style="width:30px; height:35px;" src="${project}/hipbusSave/'+data[i].imglocation+'"></a>';
							}
							msg+='<hr>';
							
						}
					
					if (datas.length == 0) {
						msg+='<div class="w3-margin">Crew Bus 검색 결과 <br><br> 검색 결과가 없습니다.</div>';
					
					}else{
							msg+='<div class="w3-margin">Crew Bus 검색 결과</div>';
							for (var i = 0; i < datas.length; i++){
								msg+='<a href="crewBus.do?driver='+datas[i].crewid+'">'+datas[i].crewname+'의버스<img class="w3-circle"'+
								'style="width:30px; height:35px;" src="${project}/hipbusSave/'+datas[i].crewImg+'"></a>';
							}
						}
					
						driverResult.innerHTML=msg;
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


	
	$(document).ready(function(){


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
			width : 30,
			height : 35
		});

		var crewBusImgLocation = sessionStorage.getItem("crewBusImg");
		$('#crewbusImg').attr({
			src : crewBusImgLocation,
			width : 30,
			height : 35
		});
	
	
	});

//-->
</script>

<div class="w3-top">
	<ul class="w3-navbar w3-theme-d2 w3-left-align w3-large" style="height:51px">
		<li class="w3-hide-medium w3-hide-large w3-opennav w3-right"><a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"> <i
				class="fa fa-bars"
			></i>
		</a></li>
		<li><a href="main.do" class="w3-padding-large w3-theme-d4"> <i class="fa fa-bus w3-margin-right"></i>${str_name}
		</a></li>
		<li class="w3-hide-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="go"> <i class="fa fa-chevron-down"></i>
		</a>
			<div class="w3-dropdown-content w3-white w3-card-4">
				<a href="station.do">${str_station}</a> <a href="garage.do">${str_garage}</a>
			</div></li>

		<c:if test="${sessionScope.memEmail eq null}">
			<!-- ^ 로그인 되어 있지 않은 경우에 로그인 요청 메시지 -->
			<li><a onclick="document.getElementById('login').style.display='block'">로그인 해주세요.</a></li>
		</c:if>
		<c:if test="${sessionScope.memEmail ne null}">
			<!-- ^ 로그인 된 경우 친구목록과 검색기능 -->
			<li class="w3-hid	e-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers"> <i class="fa fa-users"></i>
			</a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<c:if test="${hoppedOnMembers ne null}">
						<c:forEach var="hoppedOnMember" items="${hoppedOnMembers}">
							<a href="myBus.do?driver=${hoppedOnMember.email}"><i class="fa fa-bus w3-margin-right"></i>${hoppedOnMember.nick}</a>
						</c:forEach>
					</c:if>
					<c:if test="${hoppedOnMembers eq null}">
						<a>아직 올라 탄 버스가 없습니다.</a>
					</c:if>
					<hr>
					<c:if test="${hoppedOnCrews ne null}">
						<c:forEach var="hoppedOnCrew" items="${hoppedOnCrews}">
							<a href="crewBus.do?driver=${hoppedOnCrew.crewid}"><i class="fa fa-fort-awesome w3-margin-right"></i>${hoppedOnCrew.crewname}</a>
						</c:forEach>
					</c:if>
					<c:if test="${hoppedOnCrews eq null}">
						<a>아직 올라 탄 크루가 없습니다.</a>
					</c:if>
					<a class="w3-center w3-small" onclick="document.getElementById('driverSearch').style.display='block'"> <span>${str_more}</span>
					</a>
				</div></li>

			<li class="w3-hide-small w3-dropdown-hover"><a href="#" class="w3-padding-large w3-hover-white" title="otherdrivers"> <i class="fa fa-search"></i>
			</a>
				<div id="searchResult" class="w3-dropdown-content w3-white w3-card-4">
					<form name="searchform" method="post">
						<div class="w3-row w3-container w3-padding-16">
							<div class="w3-threequarter">
								<input type="text" name="keyword" class="w3-input" placeholder="${str_search}" onkeyup="driverCheck()">
							</div>
							<div class="w3-quarter w3-right-align">
								<i class="fa fa-search"></i>
							</div>
						</div>
					<div id="driverResult">
					
					</div>
					</form>
				</div></li>
		</c:if>
		<c:if test="${sessionScope.memEmail ne null}">
			<!-- 로그인된 경우 로그아웃 버튼, my bus로 가기, crewbus로 가기 버튼 보이게 -->

			<li class="w3-hide-small w3-right">
				<!-- 로그아웃 -->
				<form name="signOutForm" method="post" action="signOutPro.do">
					<input type="submit" value="${str_signOut}" class="w3-btn w3-theme-d2 w3-padding-large w3-hover-white"> <input name="urlToGoBack" type="hidden">
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
				<c:forEach var="myCrew" items="${myCrews}" begin="0" end="${fn:length(myCrews)}">
					<li class="w3-hide-small w3-right"><a href="crewBus.do?driver=${myCrew.crewid}" class="w3-padding-large w3-hover-white" title="${str_crewBus}"> <c:if test="${myCrew.imglocation eq null}">
								<img src="${project}/view/img/CrewBusLogo_pale_sq.png" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
							</c:if> <c:if test="${myCrew.imglocation ne null}">
								<img src="${project}/hipbusSave/${myCrew.imglocation}" class="w3-circle" style="height: 25px; width: 25px" alt="Crew Bus">
							</c:if>
					</a></li>
				</c:forEach>
			</c:if>


		</c:if>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top: 51px">
	<ul class="w3-navbar w3-left-align w3-large w3-theme">
		<li><a class="w3-padding-large" href="#">${str_other}</a></li>
		<li><a class="w3-padding-large" href="#">${str_station}</a></li>
		<li><a class="w3-padding-large" href="#">${str_garage}</a></li>
	</ul>
</div>

<!-- member 검색결과창 -->
<c:import url="modal_hoppedOnList.jsp" />

<!-- member 검색결과창 -->
<c:import url="modal_driverSearch.jsp" />

<!-- login 모달 창 -->
<c:import url="modal_signIn.jsp" />