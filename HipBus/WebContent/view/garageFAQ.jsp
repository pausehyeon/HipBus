<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>


<title>${str_Title}</title>
<body>

	<c:import url="../top.do"/>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right:20%; margin-left:20%">
		<c:import url="navbar_garage.jsp"/>
		<div class="w3-row w3-container" style="margin-top:64px">
			<h3>${str_FAQ}</h3>
			<p>${str_FAQTitle}</p>
			<hr>
		</div>
		<div class="w3-row w3-margin w3-padding-jumbo">
		<div class="w3-row w3-section">
			<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-search"></i></div>
			<div class="w3-rest">
				<input class="w3-input w3-border" name="message" type="text" placeholder="${str_Search}">
				<!-- 이 버튼은 관리자에게만 보임 -->
				<a href="#" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Modify}</a>
			</div>
		</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q1')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q1 회원가입은 어떻게 하나요?&nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q1" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q2')" class="w3-btn-block w3-theme-l1 w3-left-align">
					<h4>Q2 크루에 초대하려면 어떻게 하죠?&nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q2" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q3')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q3 라이브 스트리밍은 어떻게 하나요?&nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q3" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q4')" class="w3-btn-block w3-theme-l1 w3-left-align">
					<h4>Q4 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q4" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q5')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q5 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q3" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q6')" class="w3-btn-block w3-theme-l1 w3-left-align">
					<h4>Q6 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q4" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q7')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q7 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q3" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q8')" class="w3-btn-block w3-theme-l1 w3-left-align">
					<h4>Q8 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q4" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q9')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q9 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q3" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
			<div class="w3-accordion w3-white">
				<button onclick="myFunction('q10')" class="w3-btn-block w3-theme-l1 w3-left-align">
					<h4>Q10 &nbsp;<i class="fa fa-caret-down"></i></h4>
				</button>
				<div id="q4" class="w3-accordion-content w3-container">
				  <p>답변 내용은 다음과 같습니다.</p>
				</div>
			</div>
		</div>
		
		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
			  <ul class="w3-pagination">
			    <li><a class="w3-theme-d1" href="#">1</a></li>
			    <li><a class="w3-hover-opacity" href="#">2</a></li>
			    <li><a class="w3-hover-opacity" href="#">3</a></li>
			    <li><a class="w3-hover-opacity w3-hide-small" href="#">4</a></li>
			    <li><a class="w3-hover-opacity w3-hide-small" href="#">5</a></li>
			    <li><a class="w3-hover-opacity" href="#">»</a></li>
			  </ul>
			</div>
		</div>
	<!-- END MAIN -->
	</div>
	
<!-- Footer -->
<c:import url="../bottom.do"/>


</body>
</html>
