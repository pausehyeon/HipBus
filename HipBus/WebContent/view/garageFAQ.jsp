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
				
				<c:if test="${dto.mem_level == 3 }">
				<!-- 이 버튼은 관리자에게만 보임 -->
				<a href="garageFAQWrite.do" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Write}</a>
				</c:if>
				<c:if test="${dto.mem_level != 3 }">
				<div class="w3-padding"></div>
				</c:if>
			</div>
		</div>
		
		<!-- 글이없는경우 -->
				<c:if test="${count == 0}">
			
				<div class="w3-row w3-margin-bottom">
						<div class="w3-twothird w3-container">
						<h5>${msg_list_x}</h5>
						</div>
						</div>	
				</c:if>	
			
			
			<c:forEach var="article" items="${FAQList}">
			<c:set var="sum" value="${sum+1}"/>
			<div class="w3-accordion w3-white w3-card-4">
				<button onclick="myFunction('q${article.num}')" class="w3-btn-block w3-theme-l3 w3-left-align">
					<h4>Q${sum}&nbsp;${article.subject}&nbsp;<i class="fa fa-caret-down"></i></h4>
				<hr>
				</button>

				<div id="q${article.num}" class="w3-accordion-content w3-container">
				  <div class="w3-padding-jumbo ">${article.content}
				  <c:if test="${dto.mem_level == 3 }">
				  <div class=" w3-margin w3-padding">
				  <a href="garageFAQModify.do?num=${article.num}" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Modify}</a>
				  <button type="button" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right " onclick="faqDeleteCheck()">
				  <i class="fa fa-cut w3-margin-right"></i>${btn_delete}</button>
				  <input type="hidden" value="${article.num}" id="num">
				  </div>
				  </c:if>
				  <c:if test="${dto.mem_level != 3 }">
				  <div class="w3-padding"></div> 
				  </c:if>
				  </div>
				  
				</div>
			</div>
				
			</c:forEach>
			
		</div>

		<div class="w3-center">
			<!-- Pagination -->
			<!--  
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
		-->
	
		
		
		
		
		</div>
		
	<!-- END MAIN -->
	</div>

<!-- Footer -->
<c:import url="../bottom.do"/>


</body>
</html>
