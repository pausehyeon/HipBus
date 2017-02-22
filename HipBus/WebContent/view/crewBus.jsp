<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/crewBus_setting.jsp"%>


<title>${str_crewbusTitle}</title>
<body class="w3-theme-l5" onload="crewBusSet()">

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
		
			<!-- Left Column -->
			<c:import url="../crewBusLeft.do"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<div class="w3-col m7">

				<div class="w3-container w3-card-2 w3-theme-l1 w3-round w3-margin">
					<br>
					<button
						class="w3-btn w3-btn-block w3-center w3-theme-l1 w3-padding-large">
						<br> <br> <i class="fa fa-video-camera w3-xxlarge"></i>
						<p>${str_startLive}</p>
						<br> <br>
					</button>
				</div>

				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h6 class="w3-opacity">${str_putMsg}</h6>
								<p contenteditable="true" class="w3-border w3-padding">좋은
									음악이에요!</p>
								<button type="button" class="w3-btn w3-theme">
									<i class="fa fa-pencil"></i>  ${str_post}
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 60px"> <span class="w3-right w3-opacity">16
						min</span>
					<h4>Jueun Jeong</h4>
					<br>
					<hr class="w3-clear">
					<p>안녕하세요!!!!</p>
					<%-- <button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  ${str_modBoard}
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-eraser"></i>  ${str_delBoard}
					</button> --%>
					<!-- ^ 글 쓴 본인에게만 보이는 수정삭제버튼 -->
					<!-- 	
        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      -->
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 60px"> <span class="w3-right w3-opacity">32
						min</span>
					<h4>Victory Lee</h4>
					<br>
					<hr class="w3-clear">
					<p>다음 라이브 언제에요???</p>
					<%-- <button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  ${str_modBoard}
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-eraser"></i>  ${str_delBoard}
					</button> --%>
					<!-- ^ 글 쓴 본인에게만 보이는 수정삭제버튼 -->
					<!-- 
			        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			         -->
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br> <img src="${project}/view/img/HipBusLogo_colored_sq.png"
						alt="Avatar" class="w3-left w3-circle w3-margin-right"
						style="width: 60px"> <span class="w3-right w3-opacity">1
						min</span>
					<h4>JD Yoo</h4>
					<br>
					<hr class="w3-clear">
					<p>공연하신다면서요? 꼭 갈게요!</p>
					<%-- <button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-pencil"></i>  ${str_modBoard}
					</button>
					<button type="button" class="w3-btn w3-theme-l1">
						<i class="fa fa-eraser"></i>  ${str_delBoard}
					</button> --%>
					<!-- ^ 글 쓴 본인에게만 보이는 수정삭제버튼 -->
					<!--    
			        <div class="w3-row-padding" style="margin:0 -16px">
				            <div class="w3-half">
				              <img src="${project}/view/img/notice3.png" style="width:100%" alt="some photos" class="w3-margin-bottom">
				            </div>
				            <div class="w3-half">
				              <img src="${project}/view/img/notice2.png" style="width:100%" alt="some photos" class="w3-margin-bottom">
				        	</div>
			     	</div>
			    	-->
					<!--    
			        <button type="button" class="w3-btn w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-btn w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			      	-->
				</div>
				<div class="w3-row-padding">
					<div class="w3-col m12 w3-center">
						<a href="#">${str_moreBoard}</a>
					</div>
				</div>
				<!-- End Middle Column -->
			</div>

			<!-- Right Column -->
			<c:import url="../crewBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
