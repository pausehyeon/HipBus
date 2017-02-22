<!-- 유재득 11 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>


<title>${str_title}</title>
<body onload="boardSet()">

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<c:import url="navbar_station.jsp" />
		<div class="w3-row w3-container" style="margin-top: 64px">
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
			<hr>
			<c:if test="${sessionScope.memEmail eq null}">
				<i class="w3-right">${msg_login}</i>
			</c:if>
			<c:if test="${sessionScope.memEmail ne null}">
				<a href="stationWrite.do?email=${sessionScope.memEmail}" class="w3-btn w3-padding w3-theme-d1 w3-margin-left w3-right"><i class="fa fa-pencil-square-o w3-margin-right"></i>${btn_write}</a>
			</c:if>
		</div>

		<form>
			<div class="w3-row">
				<div class="w3-twothird">
					<!-- 글이없는경우 -->
					<c:if test="${count == 0}">
						<div class="w3-row w3-margin-bottom">
							<div class="w3-twothird w3-container">
								<h5>${msg_station_x}</h5>
							</div>
						</div>
					</c:if>
					<!-- 글이있는경우 -->

					<c:if test="${count != 0}">
						<c:forEach var="article" items="${station}">
							<c:if test="${type == 1 }">
								<div>
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&pageNum=${pageNum}&category=${article.category}&type=${type}"> <c:choose>
													<c:when test="${article.category == 1}">
														<h4>[${str_beat}] ${article.subject}</h4>
													</c:when>
													<c:when test="${article.category == 2}">
														<h4>[${str_rab}] ${article.subject}</h4>
													</c:when>
													<c:when test="${article.category == 3}">
														<h4>[${str_mixTape}] ${article.subject}</h4>
													</c:when>
													<c:when test="${article.category == 4}">
														<h4>[${str_vocal}] ${article.subject}</h4>
													</c:when>
													<c:when test="${article.category == 5}">
														<h4>[${str_gasa}] ${article.subject}</h4>
													</c:when>
													<c:when test="${article.category == 6}">
														<h4>[${str_freeBoard}] ${article.subject}</h4>
													</c:when>
												</c:choose>
											</a>
											<hr>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>

								</div>
							</c:if>
							<c:if test="${type == 2 }">
								<c:if test="${article.category == 1}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_beat}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${type == 3 }">
								<c:if test="${article.category == 2}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_rab}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${type == 4 }">
								<c:if test="${article.category == 3}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_mixTape}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${type == 5 }">
								<c:if test="${article.category == 4}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_vocal}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${type == 6 }">
								<c:if test="${article.category == 5}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_gasa}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${type == 7 }">
								<c:if test="${article.category == 6}">
									<div class="w3-row w3-margin-bottom">
										<div class="w3-twothird w3-container">
											<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
												<h4>[${str_freeBoard}] ${article.subject}</h4>
											</a>
										</div>
										<div class="w3-third w3-container">
											<p class="w3-right w3-tiny">${str_writeNick}:
												${article.nick} | ${str_reg_date}:
												<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
												| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
											</p>
										</div>
									</div>
								</c:if>
							</c:if>

						</c:forEach>
					</c:if>
				</div>
				<div class="w3-third">
					<!-- 상업광고 -->
					<div class="w3-container">
						<!-- 광고 있을 때 -->
						<c:if test="${ad1_imglocation eq null}">
							<div class="w3-col m12 w3-margin-top">
								<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
							</div>
						</c:if>
						<c:if test="${ad1_imglocation ne null}">
							<div class="w3-col m12 w3-margin-top">
								<img src="${project}/hipbusSave/${ad1_imglocation}" width="100%" />
							</div>
						</c:if>
						<c:if test="${ad2_imglocation eq null}">
							<div class="w3-col m12 w3-margin-top">
								<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
							</div>
						</c:if>
						<c:if test="${ad2_imglocation ne null}">
							<div class="w3-col m12 w3-margin-top">
								<img src="${project}/hipbusSave/${ad2_imglocation}" width="100%" />
							</div>
						</c:if>
						<c:if test="${ad3_imglocation eq null}">
							<div class="w3-col m12 w3-margin-top">
								<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
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
		</form>

	</div>
	<c:if test="${type == 1 }">
		<div class="w3-center ">
			<!-- Pagination -->

			<c:if test="${startPage > pageBlock}">
				<a class="w3-hover-black" href="station.do">◀◀</a>
				<a class="w3-hover-black" href="station.do?pageNum=${startPage-pageBlock}">◀</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<span class="w3-hover-black">${i}</span>
				</c:if>
				<c:if test="${i != currentPage}">
					<a class="w3-hover-black" href="station.do?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<a class="w3-hover-black" href="station.do?pageNum=${startPage+pageBlock}">▶</a>
				<a class="w3-hover-black" href="station.do?pageNum=${pageCount}">▶▶</a>
			</c:if>

		</div>
	</c:if>
	<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
