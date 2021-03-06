<!-- 유재득 11 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>
<style>
a{text-decoration:none;
}
a.yes-uline:hover{ text-decoration:underline}
</style>

<title>${str_title}</title>
<body onload="boardSet()">

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main w3-margin-bottom" style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_station.jsp" />
		<div class="w3-row-padding" style="margin-top: 64px">
			<c:if test="${type == 1 }">
				<h3>${str_allView}</h3>
				<p>${str_allViewText}</p>
			</c:if>
			<c:if test="${type == 2 }">
				<h3>${str_beat}</h3>
				<p>${str_beatViewText}</p>
			</c:if>
			<c:if test="${type == 3 }">
				<h3>${str_rab}</h3>
				<p>${str_rabViewText}</p>
			</c:if>
			<c:if test="${type == 4 }">
				<h3>${str_mixTape}</h3>
				<p>${str_mixViewText}</p>
			</c:if>
			<c:if test="${type == 5 }">
				<h3>${str_vocal}</h3>
				<p>${str_vocalViewText}</p>
			</c:if>
			<c:if test="${type == 6 }">
				<h3>${str_gasa}</h3>
				<p>${str_gasaViewText}</p>
			</c:if>
			<c:if test="${type == 7 }">
				<h3>${str_freeBoard}</h3>
				<p>${str_freeViewText}</p>
			</c:if>
			<div class="w3-row-padding w3-center">
				<c:if test="${sessionScope.memEmail eq null}">
					<a onclick="document.getElementById('login').style.display='block'" class="w3-tiny w3-padding w3-margin-left w3-right" style="text-decoration: underline;">${msg_login}</a>
				</c:if>
				<c:if test="${sessionScope.memEmail ne null}">
					<a href="stationWrite.do?email=${sessionScope.memEmail}&type=${type}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right">
						<i class="fa fa-pencil-square-o w3-margin-right"></i>${btn_write}</a>
				</c:if>
			</div>
			<hr>
		</div>

		<div class="w3-row-padding">
			<div class="w3-twothird">
				<div class="w3-margin-bottom w3-text-red">
					<c:forEach var="dto" items="${topStation}">
						<div class="w3-row">
							<div class="w3-col m12">
								<a href="stationRead.do?num=${dto.num}&pageNum=${pageNum}&category=${dto.category}&type=${type}"  style="font-weight: bold">
								<i class="fa fa-hand-peace-o"></i>
									<c:choose>
										<c:when test="${dto.category == 1}">
												[${str_beat}] ${dto.subject}
												</c:when>
										<c:when test="${dto.category == 2}">
													[${str_rab}] ${dto.subject}
												</c:when>
										<c:when test="${dto.category == 3}">
													[${str_mixTape}] ${dto.subject}
												</c:when>
										<c:when test="${dto.category == 4}">
													[${str_vocal}] ${dto.subject}
												</c:when>
										<c:when test="${dto.category == 5}">
													[${str_gasa}] ${dto.subject}
												</c:when>
										<c:when test="${dto.category == 6}">
													[${str_freeBoard}] ${dto.subject}
												</c:when>
									</c:choose>
								</a>
								<p class="w3-right w3-tiny">${str_writeNick}:
									<a href="myBus.do?driver=${dto.email}" 
									title="${dto.nick}${str_busGo}"
									class="yes-uline">${dto.nick}</a> | ${str_reg_date}:
									<fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									| ${str_readCount}: ${dto.readcount} | ${str_upCount}: ${dto.likenum }
								</p>
								<hr>
							</div>
						</div>
						</c:forEach>
					</div>
					<!-- 글이없는경우 -->
				<c:if test="${count == 0}">
					<div class="w3-row w3-margin-bottom">
						<div class="w3-col m12">
							<h5>${msg_station_x}</h5>
						</div>
					</div>
				</c:if>
				<!-- 글이있는경우 -->
					<c:if test="${count != 0}">
					<c:forEach var="article" items="${station}">
						<div class="w3-row w3-margin-bottom">
							<div class="w3-col m12">
								<a href="stationRead.do?num=${article.num}&pageNum=${pageNum}&category=${article.category}&type=${type}">
									<c:choose>
										<c:when test="${article.category == 1}">
													[${str_beat}] ${article.subject}
												</c:when>
										<c:when test="${article.category == 2}">
													[${str_rab}] ${article.subject}
												</c:when>
										<c:when test="${article.category == 3}">
													[${str_mixTape}] ${article.subject}
												</c:when>
										<c:when test="${article.category == 4}">
													[${str_vocal}] ${article.subject}
												</c:when>
										<c:when test="${article.category == 5}">
													[${str_gasa}] ${article.subject}
												</c:when>
										<c:when test="${article.category == 6}">
													[${str_freeBoard}] ${article.subject}
												</c:when>
									</c:choose>
								</a>
								<p class="w3-right w3-tiny">${str_writeNick}:
									<a href="myBus.do?driver=${article.email}" 
									title="${article.nick}${str_busGo}"
									class="yes-uline">${article.nick}</a> |
									 ${str_reg_date}:
									<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
								</p>
								<hr>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="w3-third">
				<!-- 상업광고 -->
				<div class="w3-container">
					<!-- 광고 있을 때 -->
					<c:if test="${ad1_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-128 w3-center">${str_ad}</p>
						</div>
					</c:if>
					<c:if test="${ad1_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad1_imglocation}" width="100%" />
						</div>
					</c:if>
					<c:if test="${ad2_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-48 w3-center">${str_ad}</p>
						</div>
					</c:if>
					<c:if test="${ad2_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad2_imglocation}" width="100%" />
						</div>
					</c:if>
					<c:if test="${ad3_imglocation eq null}">
						<div class="w3-col m12 w3-margin-top">
							<p class="w3-border w3-padding-large w3-padding-48 w3-center">${str_ad}</p>
						</div>
					</c:if>
					<c:if test="${ad3_imglocation ne null}">
						<div class="w3-col m12 w3-margin-top">
							<img src="${project}/hipbusSave/${ad3_imglocation}" width="100%" />
						</div>
					</c:if>
				</div>
			</div>
		</div>

		<div class="w3-row w3-center w3-margin-bottom">
			<div class="w3-col m7">
				<div class="w3-row-padding">
					<form action="station.do?type=${type}" method="post" name="searchform">
						<div class="w3-col m2">
							<select name="search" class="w3-padding w3-theme-l4 w3-btn w3-margin-right">
								<option value="subject">${str_subject}</option>
								<option value="email">${str_email}</option>
								<option value="nick">${str_nick}</option>
							</select>
						</div>
						<div class="w3-col m3">
							<input type="text" name="keyword" placeholder="${str_search}" class="w3-input">
						</div>
						<div class="w3-col m1">
							<button type="submit" class="w3-btn-block w3-theme-d1 w3-padding">
								<i class="fa fa-search"></i>
							</button>
						</div>



					</form>
				</div>
			</div>
		</div>

		<div class="w3-row">
			<!-- Pagination -->
			<div class="w3-center w3-padding-64">
				<ul class="w3-pagination">
					<c:if test="${startPage > pageBlock}">
						<li><a href="station.do" class="w3-hover-opacity">«</a></li>
						<li><a href="station.do?pageNum=${startPage-pageBlock}" class="w3-hover-opacity">«</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<li><a class="w3-theme-d1">${i}</a></li>
						</c:if>
						<c:if test="${i != currentPage}">
							<li><a href="station.do?pageNum=${i}&type=${type}&category=${category}&key=${keyword}" class="w3-hover-opacity">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount > endPage}">
						<li><a href="station.do?pageNum=${startPage+pageBlock}" class="w3-hover-opacity">»</a></li>
						<li><a href="station.do?pageNum=${pageCount}" class="w3-hover-opacity">»</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
