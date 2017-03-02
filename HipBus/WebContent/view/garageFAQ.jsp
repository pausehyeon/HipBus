<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/garage_setting.jsp"%>


<title>${str_Title}</title>
<body onload="boardSet()">

	<c:import url="../top.do" />
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_garage.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<h3>${str_FAQ}</h3>
			<p>${str_FAQTitle}</p>
			<c:if test="${dto.mem_level == 3 }">
				<!-- 이 버튼은 관리자에게만 보임 -->
				<div class="w3-row-padding w3-center">
					<a href="garageFAQWrite.do" class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i class="fa fa-pencil-square-o w3-margin-right"></i>${str_Write}</a>
				</div>
			</c:if>
			<hr>
		</div>
		<div class="w3-row w3-margin w3-padding-jumbo">
			<!-- 글이없는경우 -->
			<c:if test="${FAQList eq null}">
				<div class="w3-row w3-margin-bottom">
					<div class="w3-col m12 w3-container">
						<p class="w3-center w3-cell-middle" style="font-weight: bold;">${msg_list_x}</p>
					</div>
				</div>
			</c:if>
			<c:if test="${FAQList ne null}">
				<c:forEach var="article" items="${FAQList}">
					<div class="w3-accordion w3-white w3-card-4">
						<c:set var="sum" value="${sum+1}" />
						<c:if test="${sum%2 eq 0}">
							<!-- 짝수 일 때 -->
						<button onclick="myFunction('q${article.num}')" class="w3-btn-block w3-theme-d1 w3-left-align">
						<h4>
							<c:if test="${fn:length(article.subject) lt 40}">
								<!-- 제목이 길지 않을 때 -->
								Q${sum}.&nbsp;${article.subject}&nbsp;<i class="fa fa-caret-down"></i>
							</c:if>
							<c:if test="${fn:length(article.subject) ge 40}">
								<!-- 제목이 길 때 -->
								Q${sum}.&nbsp;${fn:substring(article.subject,0,40)}...&nbsp;<i class="fa fa-caret-down"></i>
							</c:if>
						</h4>
						</button>
						</c:if>
						
						
						<c:if test="${sum%2 eq 1}">
							<!-- 홀수 일 때 -->
						<button onclick="myFunction('q${article.num}')" class="w3-btn-block w3-theme-l3 w3-left-align">
						<h4>
							<c:if test="${fn:length(article.subject) lt 40}">
								<!-- 제목이 길지 않을 때 -->
								Q${sum}.&nbsp;${article.subject}&nbsp;<i class="fa fa-caret-down"></i>
							</c:if>
							<c:if test="${fn:length(article.subject) ge 40}">
								<!-- 제목이 길 때 -->
								Q${sum}.&nbsp;${fn:substring(article.subject,0,40)}...&nbsp;<i class="fa fa-caret-down"></i>
							</c:if>
						</h4>
						</button>
						
						</c:if>
						
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
			</c:if>

		</div>

		<div class="w3-center">
			<!-- Pagination -->
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />


</body>
</html>
